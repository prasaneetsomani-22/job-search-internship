<?php
    require "connect.php";
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $data = array();

        $text = $_POST['text'];
        $query = mysqli_query($con,"SELECT * FROM Job WHERE role LIKE '$text%'");

        $result = array();
        while($fetchdata = mysqli_fetch_assoc($query)){
            $result[] = $fetchdata; 
        }
        echo json_encode($result);
    }
?>