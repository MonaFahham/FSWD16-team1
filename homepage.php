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
if (isset($_SESSION['ban']) != "") {
    header("Location: banned.php"); 
}


$sql = "SELECT * FROM products WHERE status = 'Available'";
$result = mysqli_query($connect, $sql);
$tbody = ''; 
if (mysqli_num_rows($result)   > 0) {
    while ($rowp = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $tbody .= "

        <div class='card mb-3' style='max-width: 300px; margin-right:15px;'>
        <a href='details.php?id=" . $rowp['id'] . "'><img src='picture/" . $rowp['picture'] . "' class='card-img-top'style='width:280px; height:300px' alt='...'></a>
             <div class='card-body'>
             <h5 class='card-title'>" . $rowp['name'] . "</h5>
             <p class='card-text'> Price: " . $rowp['price'] . " €</p>
             <p class='card-text'> Weight: " . $rowp['weight'] . "</p>
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
    <title>Welcome!</title>
    <?php require_once 'components/boot.php' ?>
    <link rel="stylesheet" href="style.css">
    <style>
    .userImage {
        width: 200px;
        height: 200px;
    }

    
    </style>
</head>

<body>
<?php require_once 'components/navbar.php' ?>
    <div class="hero">
        <img src="picture/hero.jpg" alt="" srcset="" style="width:100%">
        <h2>MTM</h2>

    <p style="font-size:1rem"><i>Make your life easier with few clicks and fast delivery</i></p>
    </div>
    <section class="d-flex icons" style="margin-top:-5% ; margin-bottom:-5% ;">
    <div class="row">
    <div class="feature-box col-lg-4 col-sm-12">
        <i class="icon-decor fa-solid fa-euro-sign fa-4x"></i> 
    <h3 class="icon-heading">Quality = Price</h3><hr>
    <p id="icon">Guaranteed quality, and pay-back policy</p>
</div>
<div class="feature-box col-lg-4 col-sm-12">
    <i class="icon-decor fa-solid fa-users fa-4x"></i>
    <h3 class="icon-heading">24/7 customer support</h3><hr>
    <p id="icon">Around the clock customer support for you!</p>
</div>
<div class="feature-box col-lg-4 col-sm-12">
    <i class="icon-decor fa-solid fa-truck-fast fa-4x"></i>
    <h3 class="icon-heading">Safe and fast shipping</h3><hr>
    <p id="icon">Your orders will be shipped fast and arrive in perfect condition</p>
</div>
</div>
    </section>
    <div class="container">
    <p class="title mt-3 text-center display-5 " style="color:#A58F6F; margin-bottom:10%">All Products</p>
            <div class="container">
                <div class="row">
                <?= $tbody; ?>
                </div>
            </div>
    </div>
    <?php require_once 'components/footer.php' ?>
</body>

</html>