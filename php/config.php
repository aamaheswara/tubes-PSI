<?php
   $host = 'localhost';
   $username = 'root';
   $password = '';
   $database = 'tubes-psi';
   $kon = mysqli_connect($host,$username,$password,$database);

   if (!$kon){
      die("Koneksi gagal:".mysqli_connect_error());
 }
?>