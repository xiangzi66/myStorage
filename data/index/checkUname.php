<?php
    require_once("../init.php");
    @$uname = $_REQUEST["uname"];

    $sql = "SELECT * FROM or_user WHERE uname = '$uname'";
    $result = mysqli_query($conn,$sql);
    $row = mysqli_fetch_row($result);
    if($row){
        echo '{"code":1,"msg":"用户名已存在"}';
    }else{
        echo '{"code":0,"msg":"通过"}';
    }