<?php
    require_once("../init.php");
    $output = [];
    $sql = "SELECT * FROM or_index_product WHERE floor_index = 1 LIMIT 6";
    $output["f1"] = sql_excute($sql);
    $sql = "SELECT * FROM or_index_product WHERE floor_index = 2 LIMIT 6";
    $output["f2"] = sql_excute($sql);
    $sql = "SELECT * FROM or_index_product WHERE floor_index = 3 LIMIT 6";
    $output["f3"] = sql_excute($sql);
    $sql = "SELECT * FROM or_index_product WHERE floor_index = 4 LIMIT 6";
    $output["f4"] = sql_excute($sql);
    $sql = "SELECT * FROM or_index_product WHERE floor_index = 5 LIMIT 6";
    $output["f5"] = sql_excute($sql);
    $sql = "SELECT * FROM or_index_product WHERE floor_index = 6 LIMIT 6";
    $output["f6"] = sql_excute($sql);
    echo json_encode($output);