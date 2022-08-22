<?php
session_start();
require_once 'components/db_connect.php';


if (isset($_SESSION['adm'])) {
    header("Location: dashboard.php");
    exit;
}

if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: index.php");
    exit;
}

$res = mysqli_query($connect, "SELECT * FROM user WHERE id=" . $_SESSION['user']);
$rowp = mysqli_fetch_array($res, MYSQLI_ASSOC);




if (isset($_GET["name"])) {
    $name = $_GET["name"];




    $sql = "SELECT products.id, products.name, products.price, products.weight, products.picture FROM products
    INNER JOIN products_categories ON products.id = products_categories.fk_products
    INNER join categories ON categories.id = products_categories.fk_categories
    WHERE categories.name = '$name'";

    $result = mysqli_query($connect, $sql);
    $body = "";
    if (mysqli_num_rows($result) == 0) {
        $body = "No results";
    } else {
        while ($row = mysqli_fetch_assoc($result)) {
            $body .= "
            <div class='card mb-3' style='max-width: 400px; margin-right:15px;'>
            <div class='row g-0'>
              <div class='col-md-4'>
              <a href='details.php?id=" . $row['id'] . "'><img src='picture/" . $row['picture'] . "' class='img-fluid ' style='width:110%; height:160px' alt='...'></a>
              </div>
              <div class='col-md-8'>
                <div class='card-body'>
                  <h5 class='card-title'>" . $row['name'] . "</h5>
                  <p class='card-text'> Price: " . $row['price'] . " €</p>
                  <p class='card-text'> Weight: " . $row['weight'] . "</p>
                  <a href='add_cart.php?id=" . $row['id'] . "' class='btn' style='background-color:#A58F6F; color:white'>Add to cart</a>
                  
                </div>
              </div>
            </div>
          </div>";
        }
    }
} else {


    $sql = "SELECT * FROM products
    INNER JOIN products_categories ON products.id = products_categories.fk_products
    INNER join categories ON categories.id = products_categories.fk_categories";
    $result = mysqli_query($connect, $sql);
    $body = "";
    if (mysqli_num_rows($result) == 0) {
        $body = "No results";
    } else {
        while ($row = mysqli_fetch_assoc($result)) {
            $body .= "
            <div class='card mb-3' style='max-width: 400px; margin-right:15px;'>
            <div class='row g-0'>
              <div class='col-md-4'>
              <a href='details.php?id=" . $row['id'] . "'><img src='picture/" . $row['picture'] . "' class='img-fluid ' style='width:110%; height:160px' alt='...'></a>
              </div>
              <div class='col-md-8'>
                <div class='card-body'>
                  <h5 class='card-title'>" . $row['name'] . "</h5>
                  <p class='card-text'> Price: " . $row['price'] . " €</p>
                  <p class='card-text'> Weight: " . $row['weight'] . "</p>
                  
                </div>
              </div>
            </div>
          </div>";
        }
    }
}

?>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sort</title>
    <?php require_once 'components/boot.php'?>
    <style>
    .userImage {
        width: 200px;
        height: 200px;
    }

    .hero {
        background-color:#A58F6F;
    }
    </style>
</head>

<body>

<div class="container-fluid m-0 p-0  ">
        <div class="hero p-4 mb-3 ">
            <div class ="row row-cols-4 ">
                <div class ="col text-end">
                    <img class="userImage rounded-circle" src="picture/<?php echo $rowp['picture']; ?>" alt="<?php echo $rowp['first_name']; ?>">
                </div>
                <div class = "col">
                <h2 class="text-light mt-4">&nbsp; <?php echo $rowp['first_name'] ?> <?php echo $rowp['last_name'] ?>
                        </h2>
                </div>
            </div>
        </div>
    </div>
<div class="container p-5">
    <div class = 'row'>
        <div class='mb-3 col-auto mr-auto'>
            <a href= "index.php"><button class='btn ' style='color: white; background-color:#A58F6F'type="button" > Back Home</button></a>
        </div>
        <div class="dropdown col-auto">
            <button class="btn  dropdown-toggle" style='color: white; background-color:#A58F6F' type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
            </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="categories.php">All</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Book">Book</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Phone">Phone</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Clothes">Clothes</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Electronics">Electronics</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Baby">Baby</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Kitchen">Kitchen</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Decoration">Decoration</a></li>
                </ul>
        </div>
    </div>
</div>


<div class="container">
<p class="title mt-2 text-center display-5 " style="color:#A58F6F; margin-bottom:5%">Sorted by categories </p>
            <div class="container">
                <div class="row">
                <?= $body; ?>
                </div>
            </div>
    </div>

</body>

</html>