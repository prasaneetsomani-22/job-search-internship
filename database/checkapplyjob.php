<?php
    require "connect.php";
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $data = array();

        $user_id = $_POST['user_id'];
        $job_id = $_POST['job_id'];

        $query = mysqli_query($con,"SELECT * FROM Jobs_Applied WHERE user_id='$user_id' AND job_id='$job_id'");
        $cek = mysqli_fetch_array($query);

        if($cek!=null){
            $data['status'] = 1;
            echo json_encode($data);
        }
        else{
            $data['status'] = 0;
            echo json_encode($data);
        }
    }
?>