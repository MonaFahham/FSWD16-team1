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
$res = mysqli_query($connect, "SELECT * FROM user WHERE id=" . $_SESSION['adm']);
$rowd = mysqli_fetch_array($res, MYSQLI_ASSOC);


$sql = "SELECT * FROM products ";
$result = mysqli_query($connect, $sql);
$tbody = '';
if (mysqli_num_rows($result)  > 0) {
    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $tbody .= "
        <div class='card mb-3' style='max-width: 300px; margin-right:15px;'>
        <img src='../picture/" . $row['picture'] . "' class='card-img-top'style='width:280px; height:300px' alt='...'>
             <div class='card-body'>
             <h5 class='card-title'>" . $row['name'] . "</h5>
             <p class='card-text'> Price: " . $row['price'] . " €</p>
             <p class='card-text'> Weight: " . $row['weight'] . "</p>
             <a href='update.php?id=" . $row['id'] . "'><button class='btn btn-primary btn-sm' type='button'>Edit</button></a>
             <a href='delete.php?id=" . $row['id'] . "'><button class='btn btn-danger btn-sm' type='button'>Delete</button></a>
        </div>
    </div>
        
    
        
        
        
        ";
    };
} else {
    $tbody =  "<tr><td colspan='5'><center>No Data Available </center></td></tr>";
}

mysqli_close($connect);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <?php require_once '../components/boot.php' ?>
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
        background-color:#A58F6F; 


    }
    </style>
</head>

<body>

<div class="hero p-4 mb-3 text-center">
    <img class="userImage" src="../picture/picadmin.png" alt="picadmin">
    <p class="text-light" style="font-size:1.5rem;margin:40px auto 20px auto"><strong>Logged in as Administrator: </strong><?php echo $rowd['first_name'] . " " . $rowd['last_name']; ?></p>
</div>

    
    <div class="container">

    <div class="manageProduct w-100 mt-5">
        <div class='m-4' style="justify-content:center; text-align:center">
            <a href="create.php"><button class='btn ' style='color: white; background-color:#A58F6F' type="button">Add a new Product </button></a>
            <a href="../dashboard.php"><button class='btn ' style='color: white; background-color:#A58F6F' type="button">Back to Dashboard</button></a>
        </div>
    </div>

    <p class="title mt-3 text-center display-5 " style="color:#A58F6F; margin-bottom:3%">All Products</p>
            <div class="container">
                <div class="row">
                <?= $tbody; ?>
                </div>
            </div>
    </div>
</body>

</html>