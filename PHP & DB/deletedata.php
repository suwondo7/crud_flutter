<?php
include "conn.php";
$id = @$_REQUEST['id'];
$connect->query("DELETE FROM tb_item WHERE id = '$id'");
?>