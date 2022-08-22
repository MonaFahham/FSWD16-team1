<?php
session_start();
require_once 'components/db_connect.php';
require_once 'components/file_upload.php';
if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: index.php");
    exit;
}

$backBtn = '';

if (isset($_SESSION["user"])) {
    $backBtn = "home.php";
}

if (isset($_SESSION["adm"])) {
    $backBtn = "dashboard.php";
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM user WHERE id = {$id}";
    $result = mysqli_query($connect, $sql);
    if (mysqli_num_rows($result) == 1) {
        $data = mysqli_fetch_assoc($result);
        $first_name = $data['first_name'];
        $last_name = $data['last_name'];
        $address = $data['address'];
        $phone_number = $data['phone_number'];
        $email = $data['email'];
        $date_of_birth = $data['date_of_birth'];
        $picture = $data['picture'];
    }
}

$class = 'd-none';
if (isset($_POST["submit"])) {
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $phone_number = $_POST['phone_number'];
    $date_of_birth = $_POST['date_of_birth'];
    $id = $_POST['id'];
    $uploadError = '';
    $pictureArray = file_upload($_FILES['picture']);
    $picture = $pictureArray->fileName;
    if ($pictureArray->error === 0) {
        ($_POST["picture"] == "picuser.png") ?: unlink("picture/{$_POST["picture"]}");
        $sql = "UPDATE user SET first_name = '$first_name', last_name = '$last_name', email = '$email', address = '$address', phone_number = '$phone_number',  date_of_birth = '$date_of_birth', picture = '$pictureArray->fileName' WHERE id = {$id}";
    } else {
        $sql = "UPDATE user SET first_name = '$first_name', last_name = '$last_name', email = '$email', address = '$address', phone_number = '$phone_number',  date_of_birth = '$date_of_birth' WHERE id = {$id}";
    }
    if (mysqli_query($connect, $sql) === true) {
        $class = "alert alert-success";
        $message = "The record was successfully updated";
        $uploadError = ($pictureArray->error != 0) ? $pictureArray->ErrorMessage : '';
        header("refresh:3;url=dashboard.php?id={$id}");
    } else {
        $class = "alert alert-danger";
        $message = "Error while updating record : <br>" . $connect->error;
        $uploadError = ($pictureArray->error != 0) ? $pictureArray->ErrorMessage : '';
    }
}

mysqli_close($connect);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit </title>
    <link rel="stylesheet" href="style.css">
    <?php require_once './components/boot.php' ?>
    <style type="text/css">
    fieldset {
        margin: auto;
        margin-top: 100px;
        width: 60%;
    }
    .img-thumbnail {
        width: 70px !important;
        height: 70px !important;
    }
    </style>
</head>
<body>
<?php require_once './components/navbar.php' ?>
    <fieldset>
    <p class="title mt-3 text-center display-5 " style="color:#A58F6F; margin-bottom:10%">Edit your Profile: </p>
        <legend class='h2' style="margin-bottom:5%">Update request for User : <?php echo $first_name ?> <?php echo $last_name ?></legend>
        <form method="post" enctype="multipart/form-data">
            <table class="table" style="margin-bottom:10%">
                <tr>
                    <th>First name</th>
                    <td><input class="form-control" type="text" name="first_name" value="<?php echo $first_name ?>" /></td>
                </tr>
                <tr>
                    <th>Last name</th>
                    <td><input class="form-control" type="text" name="last_name"   value="<?php echo $last_name ?>" /></td>
                </tr>
                <tr>
                    <th>Date of birth</th>
                    <td><input class="form-control" type="date" name="date_of_birth"   value="<?php echo $date_of_birth ?>" /></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><input class="form-control" type="text" name="email"   value="<?php echo $email ?>" /></td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td><input class='form-control' type="text" name="phone_number" value="<?php echo $phone_number ?>"/></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><input class='form-control' type="text" name="address" value="<?php echo $address ?>"/></td>
                </tr>
                </tr>
                <tr>
                    <th>Picture</th>
                    <td><input class="form-control" type="file" name="picture" value="<?php echo $picture ?>"/></td>
                </tr>
                <tr >
                    <input type="hidden" name="id" value="<?php echo $data['id'] ?>" />
                    <input type="hidden" name="picture" value="<?php echo $data['picture'] ?>" />
                    <td><button name="submit" class="btn" style='color: white; background-color:#253423' type="submit" >Save Changes</button></td>
                    <td><a href="home.php"><button class="btn " style='color: white; background-color:#253423' type="button">Back</button></a></td>
                </tr>
            </table>
        </form>
    </fieldset>
    <?php require_once './components/footer.php' ?>
</body>
</html>
