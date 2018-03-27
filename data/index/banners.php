<?php
    require_once("../init.php");
    $sql = "SELECT * FROM or_index_carousel";
    echo json_encode(sql_excute($sql));