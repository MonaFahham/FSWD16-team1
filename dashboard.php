<?php
session_start();
require_once 'components/db_connect.php';

if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: homepage.php");
    exit;
}

if (isset($_SESSION["user"])) {
    header("Location: home.php");
    exit;
}


$res = mysqli_query($connect, "SELECT * FROM user WHERE id=" . $_SESSION['adm']);
$rowd = mysqli_fetch_array($res, MYSQLI_ASSOC);

$id = $_SESSION['adm'];
$status = 'adm';
$sql = "SELECT * FROM user WHERE status != '$status'";
$result = mysqli_query($connect, $sql);

$tbody = '';
if ($result->num_rows > 0) {
    while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
        $tbody .= "<tr>
            <td class ='text-center'><img class='img-thumbnail rounded-circle' src='picture/" . $row['picture'] . "' alt=" . $row['first_name'] . "></td>
            <td class ='text-center'>" . $row['first_name'] . " " . $row['last_name'] . "</td>
            <td class ='text-center'>" . $row['date_of_birth'] . "</td>
            <td class ='text-center'>" . $row['email'] . "</td>
            <td class ='text-center'><a href='admin_edit.php?id=" . $row['id'] . "'><button class='btn btn-sm' style='color: white; background-color:#253423' type='button'>Edit</button></a>
            <a href='delete.php?id=" . $row['id'] . "'><button class='btn  btn-sm' style='color: white; background-color:#253423'type='button'>Delete</button></a></td>
            </tr>";
    }
} else {
    $tbody = "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}

mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator</title>
    <?php require_once 'components/boot.php' ?>
    <style type="text/css">
    .img-thumbnail {
        width: 70px !important;
        height: 70px !important;
    }

    td {
        text-align: left;
        vertical-align: middle;
    }

    tr {
        text-align: center;
    }

    .userImage {
        width: 100px;
        height: auto;
    }
    .hero {
        background-color: #A58F6F

    }
    </style>
</head>

<body>
<div class="hero p-4 mb-3 text-center">
    <img class="userImage" src="picture/picadmin.png" alt="picadmin">
    <p class="text-light" style="font-size:1.5rem; margin-top:3%"><strong>Logged in as Administrator : <?php echo $rowd['first_name'] . " " . $rowd['last_name']; ?></strong></p>
    <a href="proudcts/index.php" class="btn btn-outline-light m-4">Products</a>
    <a href="logout.php?logout" class="btn btn-outline-light m-4">Logout</a>
</div>
<div class="container">
    <div class="mt-1">
    <p class="title mt-3 text-center display-5 " style="color:#A58F6F; margin-bottom:5%">All Users</p>
        <table class='table table-hover'>
            <thead class='table' style="background-color: #A58F6F; color:white">
                <tr>
                    <th>Picture</th>
                    <th>Name</th>
                    <th>Date of birth</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?= $tbody ?>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>