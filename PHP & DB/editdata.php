<?php
include "conn.php";
$id			= @$_REQUEST['id'];
$itemcode	= @$_REQUEST['itemcode'];
$itemname	= @$_REQUEST['itemname'];
$price		= @$_REQUEST['price'];
$stock		= @$_REQUEST['stock'];
$connect->query("UPDATE tb_item SET item_code = '$itemcode', item_name = '$itemname', price = '$price', stock = '$stock' WHERE id = '$id'");
?>