<?php
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "GET"){
        $data = array();

        $cek = mysqli_query($con,"SELECT * FROM Job");
        $result = array();

        while($fetchData = mysqli_fetch_assoc($cek)){
            $result[] = $fetchData;
        }
    
        echo json_encode($result);
    }
?>