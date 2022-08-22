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
    $weight = $_POST['weight'];
    $url_slug = $_POST['url_slug'];
    $status = $_POST['status'];
    $id = $_POST['id'];

    $uploadError = '';

    $picture = file_upload($_FILES['picture']); 
    if ($picture->error === 0) {
        ($_POST["picture"] == "picshopping.png") ?: unlink("../../picture/$_POST[picture]");
        $sql = "UPDATE products SET name = '$name', description = '$description', picture = '$picture->fileName', price = '$price', quantity = '$quantity', weight = '$weight', url_slug = '$url_slug', status = '$status'  WHERE id = {$id}";
    } else {
        $sql = "UPDATE products SET name = '$name', description = '$description', price = '$price', quantity = '$quantity', weight = '$weight', url_slug = '$url_slug', status = '$status'  WHERE id = {$id}";
    }
    if (mysqli_query($connect, $sql) === TRUE) {
        $class = "success";
        $message = "The record was successfully updated";
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
        header("refresh:3;url= ../index.php");
    } else {
        $class = "danger";
        $message = "Error while updating record : <br>" . mysqli_connect_error();
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
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
    <title>Update</title>
    <?php require_once '../../components/boot.php' ?>
</head>

<body>
    <div class="container">
        <div class="mt-3 mb-3">
            <h1>Update request response</h1>
        </div>
        <div class="alert alert-<?php echo $class; ?>" role="alert">
            <p><?php echo ($message) ?? ''; ?></p>
            <p><?php echo ($uploadError) ?? ''; ?></p>
            <a href='../update.php?id=<?= $id; ?>'><button class="btn btn-warning" type='button'>Back</button></a>
            <a href='../index.php'><button class="btn btn-success" type='button'>Home</button></a>
        </div>
    </div>
</body>

</html>