/**
 * Created by Administrator on 2017/10/11 0011.
 */
(()=>{
    if(sessionStorage.getItem('uname') != null){
        $(".message-l").html(`
            <li class="menu-hd">
                欢迎:${sessionStorage.getItem('uname')}
            </li>
            <li class="logout">
                <a href="index.html">退出</a>
            </li>
        `);
        $(".logout").click(()=>{
            sessionStorage.clear();
        })
        $("#header .message-r .cart").click(()=>{
            location = 'shopcart.html';
        })
    }else{
        $("#header .message-r").on('click','.person,.cart,.favorite',()=>{
            location = 'login.html';
        })
    }
})();