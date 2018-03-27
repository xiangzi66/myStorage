<?php
    require_once("../init.php");
    @$uname = $_REQUEST["uname"];
    @$upwd = $_REQUEST["upwd"];
    @$email = $_REQUEST["email"];
    @$phone = $_REQUEST["phone"];

    $sql = "INSERT INTO or_user VALUES(NULL,'$uname','$upwd','$email','$phone','','',NULL)";
    $result = mysqli_query($conn,$sql);
    if($result){
        echo '{"code":1,"msg":"注册成功"}';
    }else{
        echo '{"code":0,"msg":"注册失败"}';
    }