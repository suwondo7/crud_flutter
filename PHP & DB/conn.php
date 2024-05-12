<?php
$connect = new mysqli("localhost", "[nama USER]]", "[password DB]", "[nama DB]");
if($connect){
	// echo "Success";
}else{
	echo "Failed";
	exit();
}