<?php

$dbname = 'dbtoko1';
$dsn = 'mysql:dbname ='.$dbname.';host:localhost';
$user = 'root'; $password = '';

try {
     $dbh = new PDO($dsn, $user, $password);
     $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     // echo "Koneksi Sukses";
} catch (PDOException $e){
     echo 'Database tidak terhubung'.$e->getMessage();
}




?>

