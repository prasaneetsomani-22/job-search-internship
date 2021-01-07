<?php
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();

        $email = $_POST['email'];
        $password = $_POST['password'];

        $query = mysqli_query($con,"SELECT * FROM User_Auth WHERE email='$email' AND password='$password'");
        $cek = mysqli_fetch_array($query);

        if(isset($cek) && $cek != null){
            $data['status'] = 1;
            $data['msg'] = "successsfully logged in";
            $data['id'] = $cek['id'];
            echo json_encode($data);
        }
        else{
            $data['status'] = 0;
            $data['msg'] = "email or password doesn't match.Also make sure that you have an account";
            echo json_encode($data);
        }
    }
?>