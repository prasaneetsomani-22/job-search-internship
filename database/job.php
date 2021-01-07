<?php
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();
        $id = $_POST['id'];
        $company_name = $_POST['company_name'];
        $role = $_POST['role'];
        $job_location = $_POST['job_location'];
        $last_date = $_POST['last_date'];
        $description = $_POST['description'];

        $query = mysqli_query($con,"INSERT INTO Job(user_id,company_name,role,job_location,last_date,description) VALUE('$id','$company_name','$role','$job_location','$last_date','$description')");
        if(isset($query)){
            $data['status'] = 1;
            $data['msg'] = 'Job Posted Successfully';
            echo json_encode($data);
        }
        else{
            $data['status'] = 0;
            $data['msg'] = 'Something went wrong';
            echo json_encode($data);
        }
    }
?>