<?php
    session_start();
    require_once 'components/db_connect.php';

    if(!isset($_SESSION['cart'])){
        $_SESSION['cart'] = array();
    }
    if (isset($_SESSION['adm'])) {
        header("Location: dashboard.php");
        exit;
    }
    if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
        header("Location: homepage.php");
        exit;
    }

    unset($_SESSION['qty_array']);
    $res = mysqli_query($connect, "SELECT * FROM user WHERE id=" . $_SESSION['user']);
    $row = mysqli_fetch_array($res, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - <?php echo $row['first_name']; ?></title>

    <link rel="stylesheet" href="style.css">
    <?php require_once 'components/boot.php' ?>
    <style>
    .userImage {
        width: 200px;
        height: 200px;
    }
    .hero {
        background-color: white;
    }
    </style>
</head>
<body>
<?php require_once 'components/navbaruser.php' ?>
<div class="container-fluid m-0 p-0 text-center">
<p class="title mt-3 text-center display-5 " style="color:#A58F6F;"><strong class = "text">&nbsp; 
                        <?php echo $row['first_name'] . " " . $row['last_name']; ?></strong> </p>
        <div class="hero p-4 mb-3">
            
            <div class ="row">
                
                <div class ="col-12">
                    <img class="userImage rounded-circle" src="picture/<?php echo $row['picture']; ?>" alt="<?php echo $row['first_name']; ?>">
                    
                </div>
            </div>
            
        </div>
        
    </div>
    <div class="container">
                <div class="row">
    <?php
        //info message
        if(isset($_SESSION['message'])){
            ?>
            <div class="row">
                <div>
                    <div class="alert text-center" style=" color:white; background-color:#A58F6F">
                        <?php echo $_SESSION['message']; ?>
                    </div>
                </div>
            </div>
            <?php
            unset($_SESSION['message']);
        }
        //end info message
        //fetch our products   
        //connection
        $sql = "SELECT * FROM products";
        $query = $connect->query($sql);
        while($row = $query->fetch_assoc()){
            ?>
            
                    <div class ="col-lg-3 col-md-6 col-sm-10">
                        <div class='card mb-3'  style='max-width: 300px; margin-right:15px;'>
                        <a href="details.php?id=<?php echo $row['id']; ?>" ><img src="picture/<?php echo $row['picture'] ?>" class='img-fluid'alt='...' style='width:280px; height:320px'></a>
                                <div class='card-body'>
                                    <h5 class='card-title'><?php echo $row['name']; ?></h5>
                                    <p class='card-text'> Price: <?php echo $row['price']; ?> €</p>
                                    <span class=""><a href="add_cart.php?id=<?php echo $row['id']; ?>" class="btn w-100 mx-auto " style='color: white; background-color:#A58F6F'><span class="glyphicon glyphicon-plus"></span> Add to cart</a></span>
                                    
                            </div>
                        </div>
                    </div>


            <?php
        }

    ?>
                    </div>
            </div>

<?php require_once 'components/footer.php' ?>

</body>

</html>