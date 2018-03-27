(()=>{
    //未查询列表绑定单击事件
    $("#search-main .theme-popover .select .select-list .li-right>ul").on('click','a',(e)=>{
        e.preventDefault();
        $(e.target).addClass('select-active').parent().siblings().children().removeClass('select-active');
    });
    //加载查询数据
    //分页查询商品信息
    function loadUserByPage(pno){
        //1:发送 ajax请求 data/user_list.php
        $.ajax({
            type:"GET",
            url:"data/search.php",
            data:{pno:pno},
            success:function(pager){
                var html = "";
                for(var p of pager.data){
                    html += `
                        <li>
                            <div>
                                <a href="introduction.html">
                                    <img src="images/imgsearch1.jpg" alt=""/>
                                    <p class="title">${p.title}</p>
                                    <p class="price">
                                        <b>￥</b>
                                        <strong>${p.price}</strong>
                                    </p>
                                </a>
                            </div>
                        </li>
                    `;
                }
                html += '<div class="clear"></div>';
                $("#search-list-main").html(html);
                //7:获取总页数  pager.pageCount
                //8:拼接字符串动态创建页码
                var html = "";
                //上一页
                if(pager.pno>1){
                    html += `<li><a href="${pager.pno-1}">上一页</a></li>`
                }
                //判断是否显示上上一页
                if(pager.pno-2>0){
                    html += `<li><a href="${pager.pno-2}">${pager.pno-2}</a></li>`;
                }
                //判断是否显示上一页
                if(pager.pno-1>0){
                    html += `<li><a href="${pager.pno-1}">${pager.pno-1}</a></li>`;
                }
                html += `<li class="active"><a href="${pager.pno}">${pager.pno}</a></li>`;
                //判断是否显示下一页
                if(pager.pno+1<=pager.pageCount){
                    html += `<li><a href="${pager.pno+1}">${pager.pno+1}</a></li>`;
                }
                //判断是否显示下下一页
                if(pager.pno+2<=pager.pageCount){
                    html += `<li><a href="${pager.pno+2}">${pager.pno+2}</a></li>`;
                }
                //下一页
                if(pager.pno<pager.pageCount){
                    html += `<li><a href="${pager.pno+1}">下一页</a></li>`
                }
                $("#pagination").html(html);
            },
            error:function(){
                alert("网络出现故障，请检查");
            }
        });

    }
    loadUserByPage(1);
    //为不同页码绑定点击事件获取不同页中用户信息
    $("#pagination").on("click","li a",function(e){
        e.preventDefault();
        //b:获取当前页码
        var pno = $(this).attr("href");
        //c:调用函数
        loadUserByPage(pno);
    });
})();
