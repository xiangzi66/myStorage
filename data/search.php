<?php
    //搜索分页查询;
    //1:修改响应头格式;创建数据库连接;设置编码
    require("init.php");
    //2:获取参数码  pno 当前页数
    @$pno = $_REQUEST["pno"];
    @$kw = $_REQUEST["kw"];//搜索关键字:用户名一部分 t
    //3:判断如果当前没有参数pno=1
    if(!$pno){
     $pno = 1;
    }else{
     $pno = intval($pno);  //当前页数
    }
    //4:创建变量一页中数据条数  10:42--10:47
    $pageSize = 16;
    //5:创建数组:总记录数 总页数 当前页码 当页数据 页大小
    $output = ["recodeCount"=>0,     //总记录数
              "pageCount"=>0,        //总页数
              "pno"=>$pno,           //当前页数
              "data"=>null,          //当前页数据
              "pageSize"=>$pageSize];//页大小(记录数)
   //6:启始记录数,查询记录条数
   $start = ($output["pno"]-1)*$output["pageSize"];
   $count = $output["pageSize"];
   //7:查询总页数
   $sql = "SELECT COUNT(*) FROM or_product";
   //添加一个搜索条件
   if($kw){
     $sql .= " WHERE uname LIKE '%$kw%'";
   }
   $result = mysqli_query($conn,$sql);
   $row = mysqli_fetch_row($result);
   $output["recodeCount"]=$row[0];//总记录数
   $output["pageCount"]=ceil($row[0]/$pageSize);
   //8:查询当前页内容
   $sql = "SELECT id,title,price ";
   $sql .= " FROM or_product WHERE 1=1 ";
   if($kw){
     $sql .= " AND  title LIKE '%$kw%'";
   }
   $sql .= " LIMIT $start,$count";
   $result = mysqli_query($conn,$sql);
   $output["data"]=mysqli_fetch_all($result,MYSQLI_ASSOC);
   //x:转换json输出
   echo json_encode($output);
?>