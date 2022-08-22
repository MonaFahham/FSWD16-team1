<?php
session_start();
require_once '../components/db_connect.php';
$res = mysqli_query($connect, "SELECT * FROM products WHERE id IN (".implode(',',$_SESSION['cart']).")");
mysqli_close($connect);
$i = 0;
$total = 0;
?>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Paypal Payment</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <main id="cart-main">
            <div class="site-title text-center">
                <h1 class="font-title" style="color: #A58F6F">Checkout Form</h1>
            </div>
            <?php
                while($row = $res->fetch_assoc()){
                    
                //    array_push($newcart->product_id, ["product_id"=> $row['id']]);
            ?>
        <div class="container">
            <div class="grid">
                <div class="col-1">
                    <div class="flex item justify-content-between">
                        <div class="flex">
                            <div class="img text-center">
                                <img src="<?php echo $row['picture'] ?>" alt="">
                            </div>
                            <div class="title">
                                <h3><?php echo $row['name']; ?></h3>
                                <span>Book</span>
                                <div class="buttons">
                                    <button type="submit"><i class="fas fa-chevron-up"></i> </button>
                                    <input type="text" class="font-title" value="<?php echo $_SESSION['qty_array'][$i] ?>">
                                    <button type="submit"><i class="fas fa-chevron-down"></i> </button>
                                </div>
                                <a href="#">Save for later</a> |
                                <a href="../clear_cart.php" class="btn btn-danger">Delete From Cart</a>
                            </div>
                           
                            
                        </div>
                        <div class="price">
                            <h4 class="text-red"><?php echo number_format($_SESSION['qty_array'][$i]*$row['price'], 2); ?>
</h4>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                    <div class="subtotal text-center">
                        <h3>Price Details</h3>
                        <ul>
                            <li class="flex justify-content-between">
                                <label for="price">Products ( <?php $_SESSION['qty_array'][$i]; ?> items ) : </label>
                                <span><?php echo number_format($_SESSION['qty_array'][$i]*$row['price'], 2); ?>
</span>
                            </li>
                            <li class="flex justify-content-between">
                                <label for="price">Delivery Charges : </label>
                                <span>Free</span>
                            </li>
                            <hr>
                            <li class="flex justify-content-between">
                                <label for="price">Amount to pay : </label>
                                <span class="text-red font-title"><?php echo number_format($_SESSION['qty_array'][$i]*$row['price'], 2); ?>
</span>
                            </li>
                            <li class="flex justify-content-between">
                                <label>Total: </label>
                                <span class="text-red font-title"><?php $total += $_SESSION['qty_array'][$i]*$row['price']; ?>

</span>
<p><?php echo $total ; ?></p>

                            </li>
                        </ul>
                        <div id="paypal-payment-button">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php
    $i++;
     }

    //  var_dump($newcart);
     echo "<br>";
    //  $new_cart_string = json_encode($newcart);
     ?>

    <a href="../checkout.php" style="text-decoration:none; font-size:2.5rem; color: #A58F6F; text-align:center; justify-content:center; margin-left:44%; font-weight:bold; ">CHECK OUT </a>
    </main>
    <!-- <script src="https://www.paypal.com/sdk/js?client-id=AX30nvmN3M1CV7XHQO0kbvN0v8MZ-KzslIR6Ed1osDlKTrZZmEiXY5t8HZfSRWvGk2FGWQiKiFDz5YPd&disable-funding=credit,card"></script> -->
    <script src="https://www.paypal.com/sdk/js?client-id=sb-6jd4t17806431@personal.example.com&disable-funding=credit,card"></script>
    <script src="index.js"></script>
</body>
</html>