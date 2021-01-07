<?php
    require "connect.php";

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        $data = array();

        $id = $_POST['id'];
        // $id = (int)$id;

        $query = mysqli_query($con,"SELECT * FROM Application WHERE user_id='$id'");
        $cek = mysqli_fetch_array($query);

        if($cek!=null){
            $data['result'] = $cek;
            echo json_encode($data);
        }
        else{
            $data['result'] = null;
            echo json_encode($data);
        }
    }
?>