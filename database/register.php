<?php

	require "connect.php";

	if($_SERVER['REQUEST_METHOD'] == "POST"){
		$data = array();

		$email = $_POST['email'];
		$password = $_POST['password'];
		

		$cek = mysqli_query($con, "SELECT * FROM User_Auth WHERE email='$email' AND password='$password'");
		$cekData = mysqli_fetch_array($cek);

		if(isset($cekData)){
			$data['status'] = 1;
			$data['msg'] = "already exists";
			echo json_encode($data);
		}else{
			$query = mysqli_query($con, "INSERT INTO User_Auth(email,password) VALUE('$email', '$password')");
		
			if(isset($query)){
				$data['status'] = 2;
				$data['msg'] = "registered succesfully ";
				echo json_encode($data);
			}else{
				$data['status'] = 3;
				$data['msg'] = "something went wrong";
				echo json_encode($data);
			}
		}
    }
?>