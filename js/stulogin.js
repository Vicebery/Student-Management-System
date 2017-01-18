/*Author: Vicebery
*Date: 20161013
*About: studentlogin
*/


//mouseup解决click与blur冲突
$("loginId_stu").on("mouseup",function(){
    alert("鼠标离开")
});

//登陆文本框处理
function slogin_pwd_onblur(this_input) {
    if (!this_input.value) {
        this_input.style.color = "#ccc";
        this_input.value = "请输入您的密码";
    } else if (this_input.value == "请输入您的密码") {
        this_input.style.color = "#ccc";
    }
    else {
        this_input.style.color = "black";
        var error = document.getElementById("tip_Error_s2");
        error.innerHTML = "";
    }
}
function slogin_pwd_onfocus(this_input) {
    this_input.style.color = "black";
    if (this_input.value == "请输入您的密码") {
        this_input.value = "";
    }
}
function slogin_text_onblur(this_input){
    if (!this_input.value ) {
        this_input.style.color = "#ccc";
        this_input.value = "请填写您的学号";
    } else if (this_input.value == "请填写您的学号") {
        this_input.style.color = "#ccc";
    }	
    else {
        this_input.style.color="black";
        //ar reg = new RegExp("^\d{5}$");
        // var reg = new RegExp("/^[a-zA-Z0-9_]+$/");
        var reg=/^\d{16}$/; 
        var error =  document.getElementById("tip_Error_s1");
        if(!reg.test(this_input.value)){
            error.innerHTML="请输入正确的学号!";
        }else error.innerHTML="";
    }
}

function slogin_text_onfocus(this_input) {
    this_input.style.color = "black";
    if (this_input.value == "请填写您的学号") {
        this_input.value='';
    }
}


//验证不合法情况，
//登陆按钮

//焦点从文本框过来时，鼠标按下时的判断
function login_s_button_mousedown(){  
    var tip1 =  document.getElementById("tip_Error_s1"); 
    var tip2 =  document.getElementById("tip_Error_s2"); 
    var tip3 =  document.getElementById("tip_Error_s_yzm"); 
    var user =  document.getElementById("loginId_stu"); 
    var pwd =  document.getElementById("pwd_stu");
    var yzm =  document.getElementById("stu_authcode");
    if(yzm.value=="")
        tip3.innerHTML="验证码不能为空!";
    if (user.value == "" || user.value == "请填写您的学号")
        tip1.innerHTML="用户名不能为空!";
    if (pwd.value == "" || pwd.value == "请输入您的密码")
        tip2.innerHTML="密码不能为空!";
}
//完成click事件时判断是否将数据交转后台处理
function login_s_button_click(){  
    var tip1 =  document.getElementById("tip_Error_s1"); 
    var tip2 =  document.getElementById("tip_Error_s2"); 
    var tip3 =  document.getElementById("tip_Error_s_yzm"); 
    if(tip1.innerHTML==""&&tip2.innerHTML==""&&tip3.innerHTML=="")
    {
        //alert("成功跳转");
        return true;
    }
    return false;
}


//验证码处理
function GetRandomNum(Min,Max)
{   
    var Range = Max - Min;   
    var Rand = Math.random();   
    return(Min + Math.round(Rand * Range));   
}   

function newAutoCode(){
    var num = GetRandomNum(1000,9999); 
    var yzm_stu_text =  document.getElementById("yzm_stu");
    yzm_stu_text.innerHTML=num;
}
function yzm_s_focus(){
    var error =  document.getElementById("tip_Error_s_yzm");
    error.innerHTML="";
}
function IsEqu_stu(this_s_yzm){
    var yzm_stu_text =  document.getElementById("yzm_stu").innerHTML;
    if(this_s_yzm.value!=""&&this_s_yzm.value!=yzm_stu_text)
    {
        var error1 =  document.getElementById("tip_Error_s_yzm");
        error1.innerHTML="验证码输入错误！";
    }
    this_s_yzm.style.color="black";
}
