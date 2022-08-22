<?php
session_start();

if (isset($_SESSION['user']) != "") {
    header("Location: ../home.php");
    exit;
}

if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: ../homepage.php");
    exit;
}

require_once '../components/db_connect.php';

if ($_GET['id']) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM products WHERE id = {$id}";
    $result = mysqli_query($connect, $sql);
    $data = mysqli_fetch_assoc($result);
    if (mysqli_num_rows($result) == 1) {
        $name = $data['name'];
        $description = $data['description'];
        $price = $data['price'];
        $quantity = $data['quantity'];
        $date_added = $data['date_added'];
        $weight = $data['weight'];
        $url_slug = $data['url_slug'];
        $status = $data['status'];
        $picture = $data['picture'];
    } else {
        header("location: error.php");
    }
    mysqli_close($connect);
} else {
    header("location: error.php");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete</title>
    <?php require_once '../components/boot.php' ?>
    <style type="text/css">
    fieldset {
        margin: auto;
        margin-top: 100px;
        width: 70%;
    }

    .img-thumbnail {
        width: 70px !important;
        height: 70px !important;
    }
    </style>
</head>

<body>
    <fieldset >
    <p class="title mt-3 text-center display-5 " style="color:#A58F6F; margin-bottom:5%">Delete the product</p>
        <h5 class="text-center">You have selected the data below:</h5>
        <table class="table w-75 mx-auto">
            <tr class="mx-auto">
                <td>
                    <h3 class=" text-light text-center p-2 rounded" style="background-color:#A58F6F"><?php echo $name ?></h3>
                </td>
            </tr>
        </table>

        <h3 class="mb-4 text-center">Do you really want to delete this product?</h3>
        <form action="actions/a_delete.php" method="post" class="mb-4 text-center">
            <input type="hidden" name="id" value="<?php echo $id ?>" />
            <input type="hidden" name="picture" value="<?php echo $picture ?>" />
            <button class="btn btn-danger" type="submit">Yes, delete it!</button>
            <a href="index.php"><button class="btn btn-warning" type="button">No, go back!</button></a>
        </form>
    </fieldset>
</body>

</html>