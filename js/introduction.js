(()=>{
    //获取数据信息
    $.ajax({
        type:'GET',
        url:'data/details.php',
        //data: {id:1},
        success:function(data){
            console.log(data);
            var html = `
                <div class="title">
                    <b>${data.title}</b>
                </div>
                <div class="detail-list">
                    <!--价格-->
                    <div class="price">
                        <div>
                            <b>原价:</b>
                            <s>¥${data.price}</s>
                        </div>
                        <div>
                            <b>促销价:</b>
                            <em>¥${data.sale_price}</em>
                        </div>
                    </div>
                    <!--口味-->
                    <div class="taste lis">
                        <div class="tit">口味</div>
                        <div class="ul">
                            <div class="sku-line selected">原味<i></i></div>
                            <div class="sku-line">奶油<i></i></div>
                            <div class="sku-line">炭烧<i></i></div>
                            <div class="sku-line">咸香<i></i></div>
                            <i class="clear"></i>
                        </div>
                        <i class="clear"></i>
                    </div>
                    <!--包装-->
                    <div class="packaging lis">
                        <div class="tit">包装</div>
                        <div class="ul">
                            <div class="sku-line selected">手袋单人份<i></i></div>
                            <div class="sku-line">礼盒双人份<i></i></div>
                            <div class="sku-line">全家福礼包<i></i></div>
                            <i class="clear"></i>
                        </div>
                        <i class="clear"></i>
                    </div>
                    <!--数量-->
                    <div class="count lis">
                        <div class="tit">数量</div>
                        <div class="count-group">
                            <button class="reduce">-</button>
                            <input type="text" value="1"/>
                            <button class="add">+</button>
                            <!--<span>库存1000件</span>-->
                        </div>
                        <i class="clear"></i>
                    </div>
                </div>
                <div class="pay">
                    <button class="buy">立即购买</button>
                    <button class="cart">加入购物车</button>
                </div>
            `;
            $(".main .item-info .right").html(html);

            html = `
                <ul>
                    <li>产品类型: ${data.type}</li>
                    <li>原料产地: ${data.materials_original_place}</li>
                    <li>产地: ${data.place}</li>
                    <li>配料表: ${data.burden_sheet}</li>
                    <li>产品规格: ${data.product_standard}</li>
                    <li>保质期: ${data.expiration_date}</li>
                    <li>产品标准号: ${data.product_standard_num}</li>
                    <li>生产许可证编号： ${data.production_licence}</li>
                    <li>储存方法： ${data.storage_method} </li>
                    <li>食用方法： ${data.edible_methods}</li>
                    <i class="clear"></i>
                </ul>
            `;
            $(".main .detail .right .parameter .ul>.sku-line").html(html);

            //口味和包装的选取
            $(".item-info .right .detail-list .lis .ul>.sku-line").on('click',function(){
                $(this).addClass('selected').siblings().removeClass('selected');
            })

            //数量加按钮
            $(".item-info .right .detail-list .count .count-group>.add").click(function(){
                var count = $(this).prev().val();
                $(this).prev().val(++count);
            })
            //数量减按钮
            $(".item-info .right .detail-list .count .count-group>.reduce").click(function(){
                var count = $(this).next().val();
                if(count>1){
                    $(this).next().val(--count);
                }
            })
        },
        error:function(){
            alert('网络出现故障,请检查');
        }
    })

})();