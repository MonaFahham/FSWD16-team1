<?php
session_start();

if (isset($_SESSION['user']) != "") {
    header("Location: ../../home.php");
    exit;
}


if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: ../../homepage.php");
    exit;
}

require_once '../../components/db_connect.php';
require_once '../../components/file_upload.php';

if ($_POST) {
    $name = $_POST['name'];
    $description = $_POST['description'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];
    $date_added = $_POST['date_added'];
    $weight = $_POST['weight'];
    $url_slug = $_POST['url_slug'];
    $status = $_POST['status'];
    $uploadError = '';
    $picture = file_upload($_FILES['picture']);
    $sql = "INSERT INTO products(`name`, `description`, `picture`, `price`, `quantity`, `date_added`, `weight`, `url_slug`, `status`) VALUES ('$name', '$description','$picture->fileName','$price', '$quantity', '$date_added', '$weight', '$url_slug', '$status')";
    if (mysqli_query($connect, $sql) === true) {
        $class = "success";
        $message = "The entry below was successfully created <br>
            <table class='table w-50'><tr>
            <td> $name </td>
            <td> $description </td>
            <td> $price </td>
            <td> $quantity </td>
            <td> $date_added </td>
            <td> $weight </td>
            <td> $url_slug </td>
            <td> $status </td>
            </tr></table><hr>";
        $uploadError = ($picture->error !=0)? $picture->ErrorMessage :'';
        header("refresh:3;url= ../index.php");
    } else {
        $class = "danger";
        $message = "Error while creating record. Try again: <br>" . $connect->error;
        $uploadError = ($picture->error !=0)? $picture->ErrorMessage :'';
    }
    mysqli_close($connect);
} else {
    header("location: ../error.php");
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Product</title>
    <?php require_once '../../components/boot.php' ?>
</head>

<body>
    <div class="container">
        <div class="mt-3 mb-3">
            <h1>Create request response</h1>
        </div>
        <div class="alert alert-<?= $class; ?>" role="alert">
            <p><?php echo ($message) ?? ''; ?></p>
            <p><?php echo ($uploadError) ?? ''; ?></p>
            <a href='../index.php'><button class="btn btn-primary" type='button'>Home</button></a>
        </div>
    </div>
</body>

</html>