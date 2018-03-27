SET NAMES UTF8;
DROP DATABASE IF EXISTS orange;
CREATE DATABASE orange CHARSET=UTF8;
USE orange;

/**用户信息表**/
CREATE TABLE or_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32),
    upwd VARCHAR(32),
    email VARCHAR(64),
    phone VARCHAR(16),

    avatar VARCHAR(128),        #头像图片路径
    user_name VARCHAR(32),      #用户名, 如王小明
    gender INT                   #性别 0-女 1-男
);

/**收获地址信息表**/
CREATE TABLE or_receiver_address(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,                     #用户编号
    receiver VARCHAR(16),           #接收人姓名
    province VARCHAR(16),           #省
    city VARCHAR(16),               #市
    country VARCHAR(16),            #县
    address VARCHAR(128),           #详细地址
    cellphone VARCHAR(16),          #手机
    fixedphone VARCHAR(16),         #固定电话
    postcode CHAR(6),                #邮编
    tag VARCHAR(16),                #标签名
    is_default BOOLEAN               #是否为当前用户地址
);

/**购物车条目表**/
CREATE TABLE or_shoppingcart_item(
    iid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,                #用户编号
    product_id INT,             #商品编号
    count INT,                  #购买数量
    is_checked BOOLEAN          #是否已勾选
);

/**用户订单表**/
CREATE TABLE or_order(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id int,
    address_id INT,
    status INT,                #订单状态  1-等待发货  3-运输中  4-已签收  5-已取消
    order_time BIGINT,          #下单时间
    pay_time BIGINT,            #付款时间
    deliver_time BIGINT,        #发货时间
    receiver_time BIGINT       #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单详情表**/
CREATE TABLE or_order_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,             #订单编号
    product_id INT,           #产品编号
    count INT                 #购买数量
);

/**首页轮播广告商品**/
CREATE TABLE or_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),
    title VARCHAR(64),
    href VARCHAR(128)
);

/**首页商品表**/
CREATE TABLE or_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),
    pic VARCHAR(128),
    price DECIMAL(10,2),
    href VARCHAR(126),
    floor_index TINYINT
);

/**商品详情表**/
CREATE TABLE or_product(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128),                        #产品名称
    price DECIMAL(10,2),                       #原价
    sale_price DECIMAL(10,2),                  #促销价
    taste VARCHAR(16),                         #口味
    type VARCHAR(16),                          #产品类型
    materials_original_place VARCHAR(16),      #原料产地
    place VARCHAR(16),                         #产地
    burden_sheet VARCHAR(64),                  #配料表
    product_standard VARCHAR(64),              #产品规格
    expiration_date VARCHAR(16),               #保质期
    product_standard_num VARCHAR(64),          #产品标准号
    production_licence VARCHAR(64),            #生产许可证编号
    storage_method VARCHAR(128),               #储存方法
    edible_methods  VARCHAR(64)                #食用方法
);

/*******************/
/******数据导入******/
/*******************/
#用户信息
INSERT INTO or_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

#购物车条目标
INSERT INTO or_shoppingcart_item VALUES(NULL,1,1,2,FALSE);
INSERT INTO or_shoppingcart_item VALUES(NULL,1,2,4,FALSE);
INSERT INTO or_shoppingcart_item VALUES(NULL,1,3,3,FALSE);
INSERT INTO or_shoppingcart_item VALUES(NULL,1,4,5,FALSE);

#首页轮播广告商品
INSERT INTO or_index_carousel VALUES(NULL,'images/ad1.jpg','商品1','introduction.html');
INSERT INTO or_index_carousel VALUES(NULL,'images/ad2.jpg','商品2','introduction.html');
INSERT INTO or_index_carousel VALUES(NULL,'images/ad3.jpg','商品3','introduction.html');
INSERT INTO or_index_carousel VALUES(NULL,'images/ad4.jpg','商品4','introduction.html');

#首页商品表
INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',1);
INSERT INTO or_index_product VALUES(NULL,'桂圆','images/2.jpg',24.9,'introduction.html',1);
INSERT INTO or_index_product VALUES(NULL,'鲜橙','images/5.jpg',24.9,'introduction.html',1);
INSERT INTO or_index_product VALUES(NULL,'美味甜点','images/3.jpg',24.9,'introduction.html',1);
INSERT INTO or_index_product VALUES(NULL,'蓝莓','images/4.jpg',24.9,'introduction.html',1);
INSERT INTO or_index_product VALUES(NULL,'鲜美橙','images/5.jpg',24.9,'introduction.html',1);
INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',1);

INSERT INTO or_index_product VALUES(NULL,'甜粒球','images/6.jpg',24.9,'introduction.html',2);
INSERT INTO or_index_product VALUES(NULL,'美味拌面','images/7.jpg',24.9,'introduction.html',2);
INSERT INTO or_index_product VALUES(NULL,'风之恋和雪大福','images/10.jpg',24.9,'introduction.html',2);
INSERT INTO or_index_product VALUES(NULL,'美味巧克力','images/8.jpg',24.9,'introduction.html',2);
INSERT INTO or_index_product VALUES(NULL,'巧酥脆','images/9.jpg',24.9,'introduction.html',2);
INSERT INTO or_index_product VALUES(NULL,'风之恋和雪大福','images/10.jpg',24.9,'introduction.html',2);
INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',2);

INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',3);
INSERT INTO or_index_product VALUES(NULL,'桂圆','images/2.jpg',24.9,'introduction.html',3);
INSERT INTO or_index_product VALUES(NULL,'鲜橙','images/5.jpg',24.9,'introduction.html',3);
INSERT INTO or_index_product VALUES(NULL,'美味甜点','images/3.jpg',24.9,'introduction.html',3);
INSERT INTO or_index_product VALUES(NULL,'蓝莓','images/4.jpg',24.9,'introduction.html',3);
INSERT INTO or_index_product VALUES(NULL,'鲜美橙','images/5.jpg',24.9,'introduction.html',3);
INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',3);

INSERT INTO or_index_product VALUES(NULL,'甜粒球','images/6.jpg',24.9,'introduction.html',4);
INSERT INTO or_index_product VALUES(NULL,'美味拌面','images/7.jpg',24.9,'introduction.html',4);
INSERT INTO or_index_product VALUES(NULL,'风之恋和雪大福','images/10.jpg',24.9,'introduction.html',4);
INSERT INTO or_index_product VALUES(NULL,'美味巧克力','images/8.jpg',24.9,'introduction.html',4);
INSERT INTO or_index_product VALUES(NULL,'巧酥脆','images/9.jpg',24.9,'introduction.html',4);
INSERT INTO or_index_product VALUES(NULL,'风之恋和雪大福','images/10.jpg',24.9,'introduction.html',4);
INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',4);

INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',5);
INSERT INTO or_index_product VALUES(NULL,'桂圆','images/2.jpg',24.9,'introduction.html',5);
INSERT INTO or_index_product VALUES(NULL,'鲜橙','images/5.jpg',24.9,'introduction.html',5);
INSERT INTO or_index_product VALUES(NULL,'美味甜点','images/3.jpg',24.9,'introduction.html',5);
INSERT INTO or_index_product VALUES(NULL,'蓝莓','images/4.jpg',24.9,'introduction.html',5);
INSERT INTO or_index_product VALUES(NULL,'鲜美橙','images/5.jpg',24.9,'introduction.html',5);
INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',5);

INSERT INTO or_index_product VALUES(NULL,'甜粒球','images/6.jpg',24.9,'introduction.html',6);
INSERT INTO or_index_product VALUES(NULL,'美味拌面','images/7.jpg',24.9,'introduction.html',6);
INSERT INTO or_index_product VALUES(NULL,'风之恋和雪大福','images/10.jpg',24.9,'introduction.html',6);
INSERT INTO or_index_product VALUES(NULL,'美味巧克力','images/8.jpg',24.9,'introduction.html',6);
INSERT INTO or_index_product VALUES(NULL,'巧酥脆','images/9.jpg',24.9,'introduction.html',6);
INSERT INTO or_index_product VALUES(NULL,'风之恋和雪大福','images/10.jpg',24.9,'introduction.html',6);
INSERT INTO or_index_product VALUES(NULL,'诱人樱桃','images/1.jpg',24.9,'introduction.html',6);



#商品详情表
INSERT INTO or_product VALUES(NULL,'良品铺子 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'良品铺子 薄壳松子 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 进口零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 有机零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 东北松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 巴西松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');

INSERT INTO or_product VALUES(NULL,'良品铺子 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'良品铺子 薄壳松子 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 进口零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 有机零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 东北松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 巴西松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');

INSERT INTO or_product VALUES(NULL,'良品铺子 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'良品铺子 薄壳松子 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 进口零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 有机零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 东北松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 巴西松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');

INSERT INTO or_product VALUES(NULL,'良品铺子 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'良品铺子 薄壳松子 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 进口零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 有机零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 东北松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 巴西松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');

INSERT INTO or_product VALUES(NULL,'良品铺子 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'良品铺子 薄壳松子 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'百草味 进口零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'新农哥 有机零食 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'楼兰蜜语 东北松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'口水娃 巴西松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');
INSERT INTO or_product VALUES(NULL,'考拉兄弟 手剥松子218克 坚果炒货 巴西松子',96.00,56.90,'原味','烘炒类','巴基斯坦','湖北省武汉市','进口松子、食用盐','210g','180天','GB/T 22165',' QS4201 1801 0226',' 请放置于常温、阴凉、通风、干燥处保存','开袋去壳即食');