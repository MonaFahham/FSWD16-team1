<?php

session_start();

require_once 'components/db_connect.php';
if ($_POST) {
    $message = $_POST['message'];
    $message_rate = "INSERT INTO review (fk_product, fk_user, message) VALUES ({$_GET['id']} , {$_SESSION['user']}, '{$message}')";
    // var_dump($message);
    // var_dump($message_rate);
    $rate = mysqli_query($connect, $message_rate);
}

$sql = "SELECT * FROM products WHERE id = $_GET[id]";
$result = mysqli_query($connect, $sql);

// $review = "SELECT * FROM review WHERE fk_product = $_GET[id]";
$review= "SELECT review.message, user.picture , user.first_name, user.last_name FROM review JOIN user ON review.fk_user = user.id WHERE fk_product = $_GET[id]";
$result_review = mysqli_query($connect, $review);
// $review_fetch = mysqli_fetch_all($result_review);
// var_dump($review);



$tbody="";
$tbody_review="";

if(mysqli_num_rows($result)>0){
    while($row = mysqli_fetch_assoc($result)){
        $tbody .= "
        
        <div class='card mb-3' style='max-width: 1000px; margin:8% auto;'>
        <div class='row g-0'>
          <div class='col-md-4'>
          <a href='details.php?id=" . $row['id'] . "'><img src='picture/" . $row['picture'] . "' class='img-fluid ' alt='...'></a>
          </div>
          <div class='col-md-8'>
            <div class='card-body'>
              <h5 class='card-title'>" . $row['name'] . "</h5>
              <p class='card-text'><span class = 'fw-bold'>Description : </span>" . $row['description'] . "</p>
              <p class='card-text'> Price: " . $row['price'] . " €</p>
              <p class='card-text'> Weight: " . $row['weight'] . "</p>
              <p class='card-text'type='number'><span class = 'fw-bold'>Quantity : </span>" . $row['quantity'] . "</p>
              <p class='card-text'><span class = 'fw-bold'>URL : </span>" . $row['url_slug'] . "</p>
                    <a href='home.php?id=" . $row['id'] . "' class='btn' style='background-color:#A58F6F; color:white'>Back to all products</a>
            </div>
          </div>
        </div>
      </div>
      </div>
        
       ";
    };
}else {
    $tbody="
        <tr>
        <td> colspan='5' class='text-center'>Not Data </td>
        </tr>
    ";
}





if(mysqli_num_rows($result_review)>0){
    while($row = mysqli_fetch_assoc($result_review)){
        $tbody_review .= "
        
        <div class='card mt-4 mx-auto' style='max-width: 1000px; '>
        <div class='row g-0'>
          <div class='col-md-4'>
          <h5 class='card-title'>" .$row['first_name'] . " " . $row['last_name'] . "</h5>
        <p style='font-size:1.1rem; font-weight:normal'><i>" . $row['message'] . "</i><p>
          </div>
      </div>
      </div>
       ";
    };
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
    <title>Details</title>
</head>
<body>
<?php require_once 'components/navbar.php'?>
    <div class="container">   
        <?php  
            echo $tbody;
        ?>   
    </div>
    
    <div class="container">   
        <h3 style="margin:5%;"> Customer reviews for this product: </hr>
        <?php  
            echo $tbody_review;
        ?>   
        <div >
        <p class="title mt-5 text-center display-5 " style="color:#A58F6F; margin-bottom:10%">Leave a review for the selected product:  </p>
    <form method="post" enctype="multipart/form-data" style="text-align:center;margin:auto; justify-content:center; ">
        <input type="text" name="message" placeholder="Leave a review here..." style="font-size:1rem; width:75%; padding:40px; margin-bottom:10%">
        <input type="submit" name="submit" class="btn " style='background-color:#A58F6F; color:white'>
    </form>
    </div>
    </div>

    

    <?php require_once 'components/footer.php'?>
</body>
</html>
