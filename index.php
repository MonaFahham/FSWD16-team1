<?php
session_start();
require_once 'components/db_connect.php';

if (isset($_SESSION['user']) != "") {
    header("Location: home.php");
    exit;
}
if (isset($_SESSION['adm']) != "") {
    header("Location: dashboard.php"); 
}


$error = false;
$email = $password = $emailError = $passError = '';

if (isset($_POST['btn-login'])) {

    $email = trim($_POST['email']);
    $email = strip_tags($email);
    $email = htmlspecialchars($email);

    $pass = trim($_POST['password']);
    $pass = strip_tags($pass);
    $pass = htmlspecialchars($pass);

    if (empty($email)) {
        $error = true;
        $emailError = "Please enter your email address.";
    } else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = true;
        $emailError = "Please enter valid email address.";
    }

    if (empty($pass)) {
        $error = true;
        $passError = "Please enter your password.";
    }

    if (!$error) {

        $password = hash('sha256', $pass); 

        $sql = "SELECT id, first_name, password, status FROM user WHERE email = '$email'";
        $result = mysqli_query($connect, $sql);
        $row = mysqli_fetch_assoc($result);
        $count = mysqli_num_rows($result);
        if ($count == 1 && $row['password'] == $password) {
            if ($row['status'] == 'adm') {
                $_SESSION['adm'] = $row['id'];
                header("Location: dashboard.php");
            } else {
                $_SESSION['user'] = $row['id'];
                header("Location: home.php");
            }
        } else {
            $errMSG = "Incorrect Credentials, Try again...";
        }
    }
}

mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Registration System</title>
    <?php require_once 'components/boot.php' ?>
    <link rel="stylesheet" href="style.css">
</head>

<body>
<?php require_once 'components/navbar.php' ?>
    <div class="container">
    
        <form class="w-50 mx-auto" method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">
        <p class="title mt-5 text-center display-5 " style="color:#A58F6F; margin-bottom:10%;">Log Into Your Account</p>
            
            <?php
            if (isset($errMSG)) {
                echo $errMSG;
            }
            ?>

            <input type="email" autocomplete="off" name="email" class="form-control" placeholder="Your Email" value="<?php echo $email; ?>" maxlength="40" />
            <span class="text-danger"><?php echo $emailError; ?></span>
            <br>
            <input type="password" name="password" class="form-control" placeholder="Your Password" maxlength="15" />
            <span class="text-danger"><?php echo $passError; ?></span>
            <br>
            <button class="btn btn-block " style='background-color:#A58F6F; color:white' type="submit" name="btn-login">Sign In</button>
            <hr />
            <a class="btn " style="margin-bottom: 10%; color: white; background-color:#253423" href="register.php">Not registered yet? Click here</a>
            <a class="btn " style="margin-bottom: 10%; color: white; background-color:#253423" href="homepage.php">Back</a>
            
        </form>
    </div>
    <?php require_once 'components/footer.php' ?>
</body>

</html>