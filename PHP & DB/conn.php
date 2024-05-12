<?php
$connect = new mysqli("localhost", "coba", "#2019HarusSukses", "coba_xyz_mystore");
if($connect){
	// echo "Success";
}else{
	echo "Failed";
	exit();
}