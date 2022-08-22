<?php
session_start();
$error = false;
$message = "";

$tbody="";
require_once 'components/db_connect.php';
if (isset($_SESSION['adm'])) {
    header("Location: dashboard.php");
    exit;
}
if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
    header("Location: homepage.php");
    exit;
}

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
}

if ($_SESSION['cart']) {

    $res = mysqli_query($connect, "SELECT * FROM `products` WHERE id IN (" . implode(',', $_SESSION['cart']) . ")");

    $rows = $res->fetch_all(MYSQLI_ASSOC);
    $total = 0;
    $user = $_SESSION['user'];
    $qty_array = $_SESSION['qty_array'];
    $i = 0;

    foreach ($rows as $val) {
        $product_cost = $val['price'] * $qty_array[$i];
        $total = $total + $product_cost;
        $sql = "INSERT INTO shoppingcart(
            quantity,
            total,
            fk_products,
            fk_user)
            VALUES
            ('{$qty_array[$i]}',
            '{$product_cost}',
            '{$val['id']}',
            '{$user}'
            )
        ";
        mysqli_query($connect, $sql);

        $i++;
    }

    $sql_ins = "INSERT INTO `order`(fk_user, total) VALUES ($user,$total)";
    $res_ins = mysqli_query($connect, $sql_ins);

    if ($res_ins) {
        unset($_SESSION['cart']);
        $class = "success";
        $message = "Thank you for buying this product";
        header("refresh:3;url= home.php");
        $tbody .= "
        <div>
          <img src='picture/thanks.png' class='img-fluid d-flex align-content-center flex-wrap thanks' alt='Responsive image'>
        </div>

        <div>
             <p class='thanks_txt_second my-2'>your order was completed successfully.</p>
         </div>
        
       ";
    }
}else {
    $class = "danger";
    $message = "You dont have anything in your cart <br>";
    header("refresh:5;url= home.php");
    $tbody .= "
         <div>
              <img src='picture/cross.png' class='img-fluid d-flex align-content-center flex-wrap thanks' alt='Responsive image'>
        </div>

        <div>
            <p class='thanks_txt_second my-2'>your order was not successful.</p>
         </div>
        
       ";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once 'components/boot.php'?>
    <link rel="stylesheet" href="style.css">
    <title>Thank you</title>
</head>
<body>
<?php require_once 'components/navbar.php'?>
    <!-- <div>
        <img src="picture/thanks.png" class="img-fluid d-flex align-content-center flex-wrap thanks"    alt="Responsive image">
    </div> -->





    <!-- <div>
        <p class="thanks_txt_second my-2">your order was completed successfully.</p>
    </div> -->

    
    
    
    <div class="alert alert-<?php echo $class; ?>" role="alert">
        <p><?php echo $tbody; ?></p>
        
    </div>


    <?php require_once 'components/footer.php'?>
</body>

</html>