$("#login-btn").click(function(){
    var uname = $("#uname").val();
    var upwd = $("#upwd").val();
    var nReg = /^\w{3,8}$/;
    var pReg = /^[a-zA-Z0-9]{3,8}$/;

    if(!nReg.test(uname)){
        alert('用户名格式不正确,字母数字或下划线3到8位');
        return;
    }
    if(!pReg.test(upwd)){
        alert('密码格式不正确,字母或数字3到8位');
        return;
    }

    $.ajax({
        type:'POST',
        url:'data/index/login.php',
        data:{uname:uname,upwd:upwd},
        success:function(data){
            if(data.code>0){
                sessionStorage.setItem('uname',uname);
                location.href = 'index.html';
            }else{
                alert(data.msg);
            }
        },
        error:function(){
            alert('您的网络出现故障,请检查!');
        }
    })
})