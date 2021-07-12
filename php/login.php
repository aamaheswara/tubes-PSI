<?php
session_start();

include "config.php";

$username = $_POST["username"];
$p = $_POST["password"];



$sql = "select * from manajer where email='".$username."' and password='".$p."' limit 1";
$hasil = mysqli_query ($kon,$sql);
$jumlah = mysqli_num_rows($hasil);
      



if ($jumlah>0) {
    $row = mysqli_fetch_assoc($hasil);
    $_SESSION["id"]=$row["id"];
    $_SESSION["username"]=$row["username"];
    $_SESSION["nama"]=$row["nama"];
    $_SESSION["email"]=$row["email"];
    $_SESSION["toko"]=$row["id_toko"];


    header("Location:../index.php");
    
}else {
    echo "Username atau password salah <br><a href='../pages/examples/login-v2.html'>Kembali</a>";
}

?>
