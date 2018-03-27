<?php
    /**
    * 根据产品编号oid查询商品的所有信息
    * 参数： oid
    * 返回：{
    *     "details":{ ..., "picList":[{},...] }
    *     "family":{ "fid":.., "fname":.., "laptopList":[ {"lid":..,"spec":..},... ]}
    *  }
    */
    require_once('init.php');

    @$oid = $_REQUEST['oid'];
    if(!$oid){
      $oid = 1;
    }
    //读取商品的信息
    $sql = "SELECT * FROM or_product WHERE id = $oid";
    $result = mysqli_query($conn, $sql);

    echo json_encode(mysqli_fetch_assoc($result));