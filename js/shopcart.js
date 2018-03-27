(()=>{
    //多选按钮
    var $check = $(".shopcart .cart-body :checkbox");
    var $checkAll = $(".shopcart .cart-footer .left :checkbox")
    $checkAll.click(function(){

        if($(this).prop('checked')){
            $check.prop('checked',true);
        }else{
            $check.prop('checked',false);
        }
    });
    $check.click(function(){
        if(!$(this).prop('checked')){
            $checkAll.prop('checked',false);
        }
    })
    //单项删除
    $(".shopcart .cart-body .tr .td-oper>a").click((e)=>{
        e.preventDefault();
        $(e.target).parent().parent().remove();
    })
    //多项删除
    $(".shopcart .cart-footer .left .del>a").click((e)=> {
        e.preventDefault();
        $(".shopcart .cart-body :checkbox:checked").parent().parent().parent().remove();
    })
    //数量加按钮
    $(".shopcart .cart-body .tr .td-count>.add").click(function(){
        var count = $(this).prev().val();
        $(this).prev().val(++count);
        var price = Number($(this).parent().prev().html().slice(1)).toFixed(2);
        $(this).parent().next().html("￥"+(price*count).toFixed(2));
        total();
    })
    //数量减按钮
    $(".shopcart .cart-body .tr .td-count>.reduce").click(function(){
        var count = $(this).next().val();
        if(count>0){
            $(this).next().val(--count);
        }
        var price = Number($(this).parent().prev().html().slice(1)).toFixed(2);
        $(this).parent().next().html("￥"+Number(price*count).toFixed(2));
        total();
    })
    //计算商品数量以及总额
    function total(){
        //计算商品总数量
        var $count = $(".shopcart .cart-body .tr .td-count>input");
        var counts = 0;
        for(var count of $count){
            counts += Number(count.value);
        }
        $("#select-count").html(counts);
        //计算商品总金额
        var $productPrice = $(".shopcart .cart-body .tr .td-total");
        var totalPrice = 0.00;
        for(var price of $productPrice){
            totalPrice += Number(price.innerHTML.slice(1));
        }
        $("#total-price").html("¥"+totalPrice.toFixed(2));
    }
    total();
})();