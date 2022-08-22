<?php
    session_start();
    require_once 'components/db_connect.php';
    if (isset($_SESSION['adm'])) {
        header("Location: dashboard.php");
        exit;
    }
    if (!isset($_SESSION['adm']) && !isset($_SESSION['user'])) {
        header("Location: homepage.php");
        exit;
    }
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Shopping Cart</title>
    <?php require_once 'components/boot.php' ?>
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <nav class="navbar" style="background-color:#A58F6F; padding:10px">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <!-- left nav here -->
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="view_cart.php"><span class="badge" style="background-color: white; color: black"><?php echo count($_SESSION['cart']); ?></span><i class="fa-solid fa-cart-shopping"></i></a></li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container-fluid">
    <p class="title mt-3 text-center display-3 " style="color:#A58F6F; margin-bottom:5%">Your Cart</p>
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <?php
            if(isset($_SESSION['message'])){
                ?>
                <div class="alert alert-info text-center">
                    <?php echo $_SESSION['message']; ?>
                </div>
                <?php
                unset($_SESSION['message']);
            }
            ?>
            <form method="POST" action="save_cart.php">
            <table class="table table-bordered">
                <thead style="color:#A58F6F; font-size:2rem">
                    <th></th>
                    <th>Name</th>
                    <th>Picture</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </thead>
                <tbody>
                    <?php
                        //initialize total
                        $total = 0;
                        if(!empty($_SESSION['cart'])){
                        //create array of initail qty which is 1
                        $index = 0;
                        if(!isset($_SESSION['qty_array'])){
                            $_SESSION['qty_array'] = array_fill(0, count($_SESSION['cart']), 1);
                        }
                        $sql = "SELECT * FROM products WHERE id IN (".implode(',',$_SESSION['cart']).")";
                        // echo $sql;
                        $query = $connect->query($sql);
                            while($row = $query->fetch_assoc()){
                                ?>
                                <tr>
                                    <td>
                                        <a href="delete_item.php?id=<?php echo $row['id']; ?>&index=<?php echo $index; ?>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a>
                                    </td>
                                    <td style="font-weight:bold; font-size:2rem"><?php echo $row['name']; ?></td>
                                    <td><img src="picture/<?php echo $row['picture'] ?>" width="30%" height="auto"></td>
                                    <td><?php echo number_format($row['price'], 2); ?> €</td>
                                    <input type="hidden" name="indexes[]" value="<?php echo $index; ?>">
                                    <td><input type="text" class="form-control" value="<?php echo $_SESSION['qty_array'][$index]; ?>" name="qty_<?php echo $index; ?>"></td>
                                    <td><?php echo number_format($_SESSION['qty_array'][$index]*$row['price'], 2); ?> €</td>
                                    <?php $total += $_SESSION['qty_array'][$index]*$row['price']; ?> 
                                </tr>
                                <?php
                                $index ++;
                            }
                        }
                        else{
                            ?>
                            <tr>
                                <td colspan="4" class="text-center">No Item in Cart</td>
                            </tr>
                            <?php
                        }
                    ?>
                    <tr>
                        <td colspan="4" align="right" style="color:#A58F6F; font-size:1.8rem"><b>Total</b></td>
                        <td><b><?php echo number_format($total, 2); ?> €</b></td>
                    </tr>
                </tbody>
            </table>
            <a href="index.php" class="btn btn-primary mb-5 mt-5"><span class="glyphicon glyphicon-arrow-left"></span> Back</a>
            <button type="submit" class="btn btn-success mb-5 mt-5" name="save">Save Changes</button>
            <a href="clear_cart.php" class="btn btn-danger mb-5 mt-5"><span class="glyphicon glyphicon-trash"></span> Clear Cart</a>
            <a href="checkout.php" class="btn btn-success mb-5 mt-5"><span class="glyphicon glyphicon-check"></span>Checkout</a>
            </form>
        </div>
    </div>
</div>

</body>
</html>