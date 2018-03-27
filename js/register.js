(()=>{
    var uname = $("#uname"), upwd = $("#upwd"), upwd1 = $("#upwd1"),
        email = $("#email"), phone = $("#phone");
    var phoneReg=/^1[3|4|5|7|8][0-9]{9}$/;
    $("#uname").on('blur',()=>{
        $.ajax({
            type:"GET",
            url:'data/index/checkUname.php',
            data:{uname:uname.val()},
            success:function(data){
                if(data.code == 1){
                    alert(data.msg);
                }
            },
            error:function(){
                alert('网络出现故障,请检查');
            }
        })
    })
    $("#register-btn").click(function(e){
        e.preventDefault();
        if(upwd.val() != upwd1.val()){
            alert('两次密码输入不一致');
            upwd1.focus();
            return;
        }
        if(!phoneReg.test(phone.val())){
            alert('手机号格式不正确');
            phone.focus();
            return;
        }
        $.ajax({
            type:"POST",
            url:'data/index/register.php',
            data:{uname:uname.val(),upwd:upwd.val(),email:email.val(),phone:phone.val()},
            success:function(data){
                if(data.code>0){
                    alert('注册成功,请登录!');
                    location.href = 'login.html';
                }
            },
            error:function(){
                alert('网络出现故障,请检查!');
            }
        })
    })
})();
