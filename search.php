<?php

require_once 'components/db_connect.php';

$search = $_GET["search"];

$sql = "SELECT * FROM products where name LIKE '$search%'";

$result = mysqli_query($connect, $sql);


if (mysqli_num_rows($result) == 0) {
    echo "No Result";
} else {
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<p> {$row["name"]}</p>";
    }
}