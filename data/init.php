<?php
    header("Content-Type:application/json;charset=UTF-8");
    $conn = mysqli_connect("127.0.0.1","root","","orange",3306);
    mysqli_query($conn,"SET NAMES UTF8");
    function sql_excute($sql){
        global $conn;
        $result = mysqli_query($conn,$sql);

        if($result){
            return $rowlist = mysqli_fetch_all($result,MYSQLI_ASSOC);
        }else{
            return "查询执行失败, 请检查SQL语法: $sql";
        }
    }