<?php
    require "connect.php";
    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();

        $user_id = $_POST['user_id'];
        $job_id = $_POST['job_id'];
       

        $query = mysqli_query($con,"INSERT INTO Jobs_Applied(user_id,job_id) VALUE('$user_id','$job_id')");

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