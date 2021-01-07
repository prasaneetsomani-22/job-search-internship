<?php
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();
        
        $user_id = $_POST['user_id'];
        $fullname = $_POST['fullname'];
        $city = $_POST['city'];
        $mobile_no = $_POST['mobile_no'];
        $email = $_POST['email'];
        $about = $_POST['about'];

        
        $query = mysqli_query($con,"INSERT INTO Application(user_id,fullname,city,mobile_no,email_id,about) VALUE('$user_id','$fullname','$city','$mobile_no','$email','$about')");
        if(isset($query)){
            $data['status'] = 1;
            echo json_encode($data);
        }
        else{
            $data['status'] = 2;
            echo json_encode($data);
        }
    }
?>