
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
        <a href="index.php?logout">My Account</a>
        </li>
      </ul>
      
    </div>
  </div>

  
</nav>
        
<script>
        document.getElementById("search").addEventListener("input", searchForInfo);

        function searchForInfo(e) {
            e.preventDefault(); //this prevents the page from refreshing after submitting

            let data = document.getElementById("search").value; //saving the firstname value
            // let params = `search=${data}`; //creating the parameters for the POST method
            if(data != ""){
                // console.log("in")
                let request = new XMLHttpRequest(); //creating new request
            request.open("GET", "search.php?search=" + data); //connecting to the process.php file
            // request.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); //setting header for POST method
            request.onload = function () {
                if (this.status == 200) {
                    document.getElementById("result").innerHTML = this.responseText;
                    // console.log(this.responseText);
                }
            };
            request.send(); //send parameters to be further processed by php
            }else{
                document.getElementById("result").innerHTML = "";
            }
            
        }
    </script>
