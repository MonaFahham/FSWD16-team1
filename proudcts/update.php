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
    if (mysqli_num_rows($result) == 1) {
        $data = mysqli_fetch_assoc($result);
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
<html>

<head>
    <title>Edit </title>
    <?php require_once '../components/boot.php' ?>
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
    <fieldset>
    <p class="title mt-3 text-center display-5 " style="color:#A58F6F; margin-bottom:5%">Update the product</p>
        <form action="actions/a_update.php" method="post" enctype="multipart/form-data">
            <table class="table">
                <tr>
                    <th>Name</th>
                    <td><input class="form-control" type="text" name="name" value="<?php echo $name ?>" /></td>
                </tr>
                <tr>
                    <th>Price</th>
                    <td><input class="form-control" type="number" name="price"   value="<?php echo $price ?>" /></td>
                </tr>
                <tr>
                    <th>Quantity</th>
                    <td><input class="form-control" type="number" name="quantity"   value="<?php echo $quantity ?>" /></td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td><input class="form-control" type="text" name="description"   value="<?php echo $description ?>" /></td>
                </tr>
                <tr>
                    <th>Weight</th>
                    <td><input class='form-control' type="text" name="weight" value="<?php echo $weight ?>"/></td>
                </tr>
                <tr>
                    <th>URL</th>
                    <td><input class='form-control' type="text" name="url_slug" value="<?php echo $url_slug ?>"/></td>
                </tr>
                <tr>
                <th>Status</th>
                <td> <select name="status">
                        <option <?php if($status == "Available") { echo "selected";}  ?> value="Available">Available</option>
                        <option <?php if($status == "Not Available") { echo "selected";}  ?> value="Not Available">Not Available</option>
                    </select>
                </td>
                </tr>
                <tr>
                    <th>Picture</th>
                    <td><input class="form-control" type="file" name="picture" value="<?php echo $picture ?>"/></td>
                </tr>

                <tr>
                    <input type="hidden" name="id" value="<?php echo $data['id'] ?>" />
                    <input type="hidden" name="picture" value="<?php echo $data['picture'] ?>" />
                    <td><button class="btn btn-success" type="submit">Save Changes</button></td>
                    <td><a href="index.php"><button class="btn btn-warning" type="button">Back</button></a></td>
                </tr>
            </table>
        </form>
    </fieldset>
</body>

</html>