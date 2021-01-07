<?php
    $con = mysqli_connect('localhost','prasaneet','Prasaneet@2000','Job_Search');

    if(!$con)
	{
		echo json_encode("Connection Failed");
	}
?>