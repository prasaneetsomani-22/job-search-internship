<?php
    require "connect.php";
    if($_SERVER["REQUEST_METHOD"] == "POST"){

        $user_id = $_POST['user_id'];

        $query = mysqli_query($con,"SELECT * FROM Job WHERE job_id IN (SELECT job_id FROM Jobs_Applied WHERE user_id='$user_id')");
        $results = array();

        while($fetchdata = mysqli_fetch_assoc($query)){
            $results[] = $fetchdata; 
        }

        echo json_encode($results);
    }
?>