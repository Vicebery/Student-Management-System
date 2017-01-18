/*Author: Vicebery
*Date: 20161013
*About: studentlogin
*/


//mouseup解决click与blur冲突
$("loginId_stu").on("mouseup", function () {
    alert("鼠标离开")
});

//登陆文本框处理
function tlogin_pwd_onblur(this_input) {
    if (!this_input.value) {
        this_input.style.color = "#ccc";
        this_input.value = "请输入您的密码";
    } else if (this_input.value == "请输入您的密码") {
        this_input.style.color = "#ccc";
    }
    else {
        this_input.style.color = "black";
        var error = document.getElementById("tip_Error_t2");
        error.innerHTML = "";
    }
}
function tlogin_pwd_onfocus(this_input) {
    this_input.style.color = "black";
    if (this_input.value == "请输入您的密码") {
        this_input.value = "";
    }
}
function tlogin_text_onblur(this_input) {
    if (!this_input.value) {
        this_input.style.color = "#ccc";
        this_input.value = "请填写您的帐号";
    } else if (this_input.value == "请填写您的帐号") {
        this_input.style.color = "#ccc";
    }
    else {
        this_input.style.color = "black";
        //var reg = new RegExp("^\d{5}$");
        // var reg = new RegExp("/^[a-zA-Z0-9_]+$/");
        var reg = /^\d{16}$/;
        var error = document.getElementById("tip_Error_t1");
        if (!reg.test(this_input.value)) {
            error.innerHTML = "请填写正确的帐号!";
        } else error.innerHTML = "";
    }
}

function tlogin_text_onfocus(this_input) {
    this_input.style.color = "black";
    if (this_input.value == "请填写您的帐号") {
        this_input.value = "";
    }
}


//验证不合法情况，
//登陆按钮

//焦点从文本框过来时，鼠标按下时的判断
function login_t_button_mousedown() {
    var tip1 = document.getElementById("tip_Error_t1");
    var tip2 = document.getElementById("tip_Error_t2");
    var tip3 = document.getElementById("tip_Error_t_yzm");
    var user = document.getElementById("loginId_tea");
    var pwd = document.getElementById("pwd_tea");
    var yzm = document.getElementById("tea_authcode");
    if (yzm.value == "")
        tip3.innerHTML = "验证码不能为空!";
    if (user.value == "" || user.value == "请填写您的帐号")
        tip1.innerHTML = "用户名不能为空!";
    if (pwd.value == "" || pwd.value == "请输入您的密码")
        tip2.innerHTML = "密码不能为空!";
}
//完成click事件时判断是否将数据交转后台处理
function login_t_button_click() {
    var tip1 = document.getElementById("tip_Error_t1");
    var tip2 = document.getElementById("tip_Error_t2");
    var tip3 = document.getElementById("tip_Error_t_yzm");
    if (tip1.innerHTML == "" && tip2.innerHTML == "" && tip3.innerHTML == "") {
        //alert("成功跳转");
        return true;
    }
    return false;
}
////////////////////////////////////

////登陆文本框处理
//function tlogin_text_onblur(this_input) {
//    if (!this_input.value) {
//        this_input.style.color = "#ccc";
//        this_input.value = this_input.defaultValue;
//        // var error =  document.getElementById("tip_Error_s");
//        // error.innerHTML="";
//    }
//    else {
//        this_input.style.color = "black";
//        if (this_input.id == "loginId_tea") {
//            //var reg = new RegExp("^\d{5}$");
//            // var reg = new RegExp("/^[a-zA-Z0-9_]+$/");
//            var reg = /^\d{16}$/;
//            var error = document.getElementById("tip_Error_t1");
//            if (!reg.test(this_input.value)) {
//                error.innerHTML = "请输入正确的学号!";
//            } else error.innerHTML = "";
//        } else if (this_input.id == "pwd_tea") {
//            var error = document.getElementById("tip_Error_t2");
//            error.innerHTML = "";
//        }
//    }
//}

//function tlogin_text_onfocus(this_input) {
//    if (this_input.value == this_input.defaultValue) {
//        this_input.style.color = "black";
//        this_input.value = '';
//    }
//}


////验证不合法情况，
////登陆按钮

////焦点从文本框过来时，鼠标按下时的判断
//function login_t_button_mousedown() {
//    var tip1 = document.getElementById("tip_Error_t1");
//    var tip2 = document.getElementById("tip_Error_t2");
//    var tip3 = document.getElementById("tip_Error_t_yzm");
//    var user = document.getElementById("loginId_tea");
//    var pwd = document.getElementById("pwd_tea");
//    var yzm = document.getElementById("tea_authcode");
//    if (yzm.value == "")
//        tip3.innerHTML = "验证码不能为空!";
//    if (user.value == "" || user.value == user.defaultValue)
//        tip1.innerHTML = "用户名不能为空!";
//    if (pwd.value == "" || pwd.value == pwd.defaultValue)
//        tip2.innerHTML = "密码不能为空!";
//}
////完成click事件时判断是否将数据交转后台处理
//function login_t_button_click() {
//    var tip1 = document.getElementById("tip_Error_t1");
//    var tip2 = document.getElementById("tip_Error_t2");
//    var tip3 = document.getElementById("tip_Error_t_yzm");
//    if (tip1.innerHTML == "" && tip2.innerHTML == "" && tip3.innerHTML == "") {
//        //alert("成功跳转");
//        return true;
//    }
//    return false;
//}


//验证码处理
function GetRandomNum(Min, Max) {
    var Range = Max - Min;
    var Rand = Math.random();
    return (Min + Math.round(Rand * Range));
}

function newAutoCode() {
    var num = GetRandomNum(1000, 9999);
    var yzm_tea_text = document.getElementById("yzm_tea");
    yzm_tea_text.innerHTML = num;
}
function yzm_t_focus() {
    var error = document.getElementById("tip_Error_t_yzm");
    error.innerHTML = "";
}
function IsEqu_tea(this_t_yzm) {
    var yzm_tea_text = document.getElementById("yzm_tea").innerHTML;
    if (this_t_yzm.value != "" && this_t_yzm.value != yzm_tea_text) {
        var error1 = document.getElementById("tip_Error_t_yzm");
        error1.innerHTML = "验证码输入错误！";
    }
    this_t_yzm.style.color = "black";
}