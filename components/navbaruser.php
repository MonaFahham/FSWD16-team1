<nav class="navbar navbar-expand-lg navbar-light ">
  <div class="container-fluid">
    <a class="navbar-brand" href="" style="color:white; font-weight:bold;margin-right:35%; height:60px; margin-top:20px">MTM</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-3 mb-lg-0">
        <li class="nav-item">
          <a class="nav-item"  href="homepage.php">Home</a>
        </li>
        <li class="nav-item">
        <a href="home.php">Products</a>
        </li>
        <li class="nav-item">
        <a href="update.php?id=<?php echo $_SESSION['user'] ?>">Update your profile</a>
        </li>
        
        
        <li class="nav-item">
        <a href="logout.php?logout">Sign Out</a>
        </li>
        <li class="nav-item">
        <a href="view_cart.php"><?php echo count($_SESSION['cart']); ?> <i class="fa-solid fa-cart-shopping"></i></a>
        </li>
      </ul>
      <div class="dropdown col-auto m-4">
        <button class="btn dropdown-toggle text-light"  type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        Categories
        </button>
        <ul class="dropdown-menu"  aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="categories.php">All</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Book">Book</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Phone">Phone</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Clothes">Clothes</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Electronics">Electronics</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Baby">Baby</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Kitchen">Kitchen</a></li>
                    <li><a class="dropdown-item" href="categories.php?name=Decoration">Decoration</a></li>
                </ul>
        </ul>
        </div>
    </div>
  </div>

  
</nav>