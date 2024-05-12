<?php
include "conn.php";
$itemcode	= @$_REQUEST['itemcode'];
$itemname	= @$_REQUEST['itemname'];
$price		= @$_REQUEST['price'];
$stock		= @$_REQUEST['stock'];
$connect->query("INSERT INTO tb_item (item_code, item_name, price, stock) VALUES ('$itemcode', '$itemname', '$price', '$stock')");
?>