<?php
    require "connect.php";
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $data = array();

        $user_id = $_POST['user_id'];

        $query = mysqli_query($con,"SELECT * FROM Job WHERE user_id='$user_id'");
        $result = array();

        while($fetchdata = mysqli_fetch_assoc($query)){
            $result[] = $fetchdata;
        }
        echo json_encode($result);
    }
?>