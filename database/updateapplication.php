<?php
    require "connect.php";
    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();
        
        $id = $_POST['id'];
        $fullname = $_POST['fullname'];
        $city = $_POST['city'];
        $mobile_no = $_POST['mobile_no'];
        $email = $_POST['email'];
        $description = $_POST['description'];

        $query = mysqli_query($con,"UPDATE Application SET fullname='$fullname', city='$city',mobile_no='$mobile_no',email_id='$email',about='$description' WHERE user_id='$id'");
        
        if(isset($query)){
            $data['status'] = 1;
            echo json_encode($data);
        }
        else{
            $data['status'] = 0;
            echo json_encode($data);
        }
    }
?>