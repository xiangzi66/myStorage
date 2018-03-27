//轮播图
(()=> {
    var $bannerImgs = $("[data-load=bannerImgs]"),
        $bannerInds = $("[data-load=bannerInds]"),
        $left = $("[data-move=left]"),
        $right = $("[data-move=right]"),
        LIWIDTH = $("ul.banner-image").css("width").slice(0,-2),
        n = 0, TRANS = 300, INTERVAL = 2000,
        timer = null, canMove = true, WAIT = 1000;
    $.get("data/index/banners.php")
    .then(data=>{
        var banners = [...data];
        banners.push(banners[0]);
        var strImgs = "";
        for(var img of banners){
            strImgs +=
                `<li>
                    <a href="${img.href}">
                      <img src="${img.img}">
                    </a>
                </li>`;
        }
        $bannerImgs.html(strImgs);
        $bannerImgs.css("width",LIWIDTH * banners.length);
        var strInds = "<li></li>".repeat(banners.length - 1);
        $bannerInds.html(strInds);
        $bannerInds.children().first().addClass("hover");
        return new Promise(resolve=>resolve());
    })
    .then(()=> {
        function moveOnce() {
            n++;
            var left = LIWIDTH * n;
            $bannerImgs.css("left",-left);
            $bannerInds.children(":eq("+(n-1)+")").removeClass("hover");
            if (n == $bannerImgs.children().length - 1) {
                $bannerInds.children().first().addClass("hover");
                setTimeout(()=> {
                    $bannerImgs.css("transition","");
                    $bannerImgs.css("left",0);
                    n = 0;
                    setTimeout(()=> {
                        $bannerImgs.css("transition","all ." + TRANS / 100 + "s linear");
                    }, 100);
                }, TRANS);
            } else{
                $bannerInds.children(":eq("+n+")").addClass("hover");
            }
        }

        timer = setInterval(moveOnce, INTERVAL + TRANS);

        //鼠标进入图片时, 停止滑动, 离开时继续滑动
        $bannerImgs.mouseover(function () {
            clearInterval(timer);
            timer = null;
        });
        $bannerImgs.mouseout(function () {
            timer = setInterval(moveOnce, INTERVAL + TRANS);
        });
        //为小圆点绑定单击事件
        for (let i = 0; i < $bannerInds.children().length; i++) {
            $bannerInds.children(":eq("+i+")").click(function () {
                n = i;
                $bannerImgs.css("left",-n * LIWIDTH);
                $(this).addClass("hover").siblings().removeClass("hover");
            })
        }
        //左侧按钮
        $("[data-move=left]").click((e)=>{
            e.preventDefault();
            if (n > 0) {
                n--;
                $bannerImgs.css("left",-n * LIWIDTH)
                $bannerInds.children(":eq("+(n+1)+")").removeClass("hover");
                $bannerInds.children(":eq("+n+")").addClass("hover");
            } else {
                $bannerImgs.css("transition","");
                n = $bannerInds.children().length;
                $bannerImgs.css("left",-n * LIWIDTH)
                setTimeout(()=> {
                    $bannerImgs.css("transition","all ." + TRANS / 100 + "s linear");
                    n--;
                    $bannerImgs.css("left",-n * LIWIDTH)
                    $bannerInds.children().first().removeClass("hover");
                    $bannerInds.children().last().addClass("hover");
                }, 100)
            }
        });
        //右侧按钮
        $("[data-move=right]").click((e)=>{
            e.preventDefault();
            if (n < $bannerInds.children().length - 1) {
                n++;
                $bannerImgs.css("left",-n * LIWIDTH);
                $bannerInds.children(":eq("+(n-1)+")").removeClass("hover");
                $bannerInds.children(":eq("+n+")").addClass("hover");
            } else {
                n++;
                $bannerImgs.css("left",-n*LIWIDTH);
                $bannerInds.children().last().removeClass("hover");
                $bannerInds.children().first().addClass("hover");
                setTimeout(()=> {
                    $bannerImgs.css("transition","");
                    $bannerImgs.css("left",0);
                    n = 0;
                    setTimeout(()=> {
                        $bannerImgs.css("transition","all ." + TRANS / 100 + "s linear");
                    }, 100)
                }, TRANS)
            }
        } );
            return new Promise(resolve=>resolve(moveOnce));
    })
})();
//动态加载首页商品
(()=>{
    $.ajax({
        type:'GET',
        url:'data/index/floors.php',
        success:function(data){
            var html = '';
            for(var key in data){
                html += `
                    <div id="${key}" class="flo">
                        <div class="shopTitle">
                            <h4>甜品</h4>
                            <h3>每一道甜品都有一个故事</h3>
                        </div>
                        <div class="flood one">
                            <div class="fl text-one">
                                <div class="word">
                                    <ul class="outer">
                                        <li>核桃</li>
                                        <li>核桃</li>
                                        <li>核桃</li>
                                        <li>核桃</li>
                                        <li>核桃</li>
                                        <li>核桃</li>
                                        <div class="clear"></div>
                                    </ul>
                                </div>
                                <a href="javascript:">
                                    <div class="auter-con">
                                        <div class="title">开抢啦!</div>
                                        <div class="sub-title">零食大礼包</div>
                                    </div>
                                    <img src="images/act1.png" alt="">
                                </a>
                                <div class="triangle"></div>
                            </div>
                            <div class="fl text-two sig">
                                <div class="up">
                                    <div class="outer-con">
                                        <div class="title">${data[key][0].title}</div>
                                        <div class="sub-title">￥${data[key][0].price}</div>
                                        <i></i>
                                    </div>
                                    <a href="introduction.html">
                                        <img src="${data[key][0].pic}" alt=""/>
                                    </a>
                                </div>
                                <div class="down">
                                    <div class="outer-con">
                                        <div class="title">${data[key][1].title}</div>
                                        <div class="sub-title">￥${data[key][1].price}</div>
                                        <i></i>
                                    </div>
                                    <a href="introduction.html">
                                        <img src="${data[key][1].pic}" alt=""/>
                                    </a>
                                </div>
                            </div>
                            <div class="fl text-three dou">
                                <div class="cen">
                                    <div class="outer-con">
                                        <div class="title">${data[key][2].title}</div>
                                        <div class="sub-title">￥${data[key][2].price}</div>
                                        <i></i>
                                    </div>
                                    <a href="introduction.html">
                                        <img src="${data[key][2].pic}" alt=""/>
                                    </a>
                                </div>
                            </div>
                            <div class="fl text-four sig">
                                <div class="up">
                                    <div class="outer-con">
                                        <div class="title">${data[key][3].title}</div>
                                        <div class="sub-title">￥${data[key][3].price}</div>
                                        <i></i>
                                    </div>
                                    <a href="introduction.html">
                                        <img src="${data[key][3].pic}" alt=""/>
                                    </a>
                                </div>
                                <div class="down">
                                    <div class="outer-con">
                                        <div class="title">${data[key][4].title}</div>
                                        <div class="sub-title">￥${data[key][4].price}</div>
                                        <i></i>
                                    </div>
                                    <a href="introduction.html">
                                        <img src="${data[key][4].pic}" alt=""/>
                                    </a>
                                </div>
                            </div>
                            <div class="fl text-five dou">
                                <div>
                                    <div class="outer-con">
                                        <div class="title">${data[key][5].title}</div>
                                        <div class="sub-title">￥${data[key][5].price}</div>
                                        <i></i>
                                    </div>
                                    <a href="introduction.html">
                                        <img src="${data[key][5].pic}" alt=""/>
                                    </a>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                `
            }
            html += '<div class="clear"></div>';
            $(".floor0").html(html);
        },
        error:function(){
            alert('网络出现故障,请检查');
        }
    })
})();
