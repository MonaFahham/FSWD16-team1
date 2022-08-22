<?php
session_start();
require_once '../components/db_connect.php';

if (isset($_SESSION['user']) != "") {
    header("Location: ../home.php");
    exit;
}


if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: ../homepage.php");
    exit;
}



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once '../components/boot.php' ?>
    <title>Add Products</title>
    <style>
    fieldset {
        margin: auto;
        margin-top: 100px;
        width: 60%;
    }
    </style>
</head>

<body>
    <fieldset>
        <legend class='h2'>Add Products</legend>
        <form action="actions/a_create.php" method="post" enctype="multipart/form-data">
            <table class='table'>
                <tr>
                    <th>Name</th>
                    <td><input class='form-control' type="text" name="name" placeholder="Name" /></td>
                </tr>
                <tr>
                    <th>Price</th>
                    <td><input class='form-control' type="number" name="price" placeholder="price"/></td>
                </tr>
                <tr>
                    <th>Quantity</th>
                    <td><input class='form-control' type="number" name="quantity" placeholder="quantity"/></td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td><input class='form-control' type="text" name="description"/></td>
                </tr>
                <tr>
                    <th>URL</th>
                    <td><input class='form-control' type="text" name="url_slug"/></td>
                </tr>
                <tr>
                    <th>Weight</th>
                    <td><input class='form-control' type="text" name="weight" placeholder="weight"/></td>
                </tr>
                <tr>
                    <th>Picture</th>
                    <td><input class='form-control' type="file" name="picture" /></td>
                </tr>
                <th>Status</th>
                <td> <select name="status">
                        <option value="Available">Available</option>
                        <option value="Not Available">Not Available</option>
                    </select>
                </td>
                <tr>
                    <td><button class='btn btn-success' type="submit">Add To List</button></td>
                    <td><a href="index.php"><button class='btn btn-warning' type="button">Home</button></a></td>
                </tr>
            </table>
        </form>
    </fieldset>
</body>

</html>