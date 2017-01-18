/*Author: Vicebery
*Date: 20161013
*About: userlogin
*/
//登陆界面切换用户
function swith_title_left(){
	var li1 =  document.getElementById("login_tab1");
	var div_left =  document.getElementById("login_t1");
	div_left.style.display = "block";
	li1.className = "login_hota";
	var li2 =  document.getElementById("login_tab2");
	var div_right =  document.getElementById("login_t2");
	div_right.style.display = "none";
	li2.className = "login_hotb";
}
function swith_title_right(){
	var li1 =  document.getElementById("login_tab1");
	var div_left =  document.getElementById("login_t1");
	div_left.style.display = "none";
	li1.className = "login_hotb";
	var li2 =  document.getElementById("login_tab2");
	var div_right =  document.getElementById("login_t2");
	div_right.style.display = "block";
	li2.className = "login_hota";
}

//登陆文本框处理
function login_text_onblur(this_input){
	if(!this_input.value){
		this_input.style.color="#ccc";
		this_input.value=this_input.defaultValue;
		// var error =  document.getElementById("tip_Error_s");
		// error.innerHTML="";
	}
	else {
			this_input.style.color="black";
			if(this_input.id=="loginId_stu"){
		 		//var reg = new RegExp("^\d{5}$");
		 		// var reg = new RegExp("/^[a-zA-Z0-9_]+$/");
		 		 var reg=/^\d{16}$/; 
		 		var error =  document.getElementById("tip_Error_s");
		  		if(!reg.test(this_input.value)){
        			error.innerHTML="请输入正确的学号!";
    			}else error.innerHTML="";
			}
			else if(this_input.id=="loginId_teacher"){
		 		 var reg=/^\d{16}$/; 
		 		var error =  document.getElementById("tip_Error_t");
		  		if(!reg.test(this_input.value)){
        			error.innerHTML="请输入正确的账号!";
    			}else error.innerHTML="";
			}if(this_input.id=="pwd_stu"){
		 		var error =  document.getElementById("tip_Error_s");
		 		var id_stu =  document.getElementById("loginId_stu");
		  		if(id_stu.length==16){
        			error.innerHTML="";
    			}
    		}if(this_input.id=="pwd_teacher"){
		 		var error =  document.getElementById("tip_Error_t");
		 		var id_tea =  document.getElementById("loginId_teacher");
		  		if(id_tea.length==16){
        			error.innerHTML="";
    			}
    		}
		}
}

function login_text_onfocus(this_input){
	if(this_input.value==this_input.defaultValue){
		this_input.style.color="black";
		this_input.value='';
	}
}


//验证不合法情况，
//登陆按钮

function login_s_button_click(){  
	var tip1 =  document.getElementById("tip_Error_s"); 
	var tip2 =  document.getElementById("tip_Error_s_yzm"); 
	var user =  document.getElementById("loginId_stu"); 
	var pwd =  document.getElementById("pwd_stu");
	var yzm =  document.getElementById("stu_authcode");
	if(yzm.value=="")
		tip2.innerHTML="验证码不能为空!";
	if(user.value==""||pwd.value==""||user.value==user.defaultValue||pwd.value==pwd.defaultValue)
		tip1.innerHTML="用户名或密码不能为空!";
	if(tip1.innerHTML==""&&tip2.innerHTML=="")
		return true;
	return false;
} 
function login_t_button_click(){  
	var tip11 =  document.getElementById("tip_Error_t"); 
	var tip22 =  document.getElementById("tip_Error_t_yzm"); 
	var user1 =  document.getElementById("loginId_teacher"); 
	var pwd1 =  document.getElementById("pwd_teacher");
	var yzm1 =  document.getElementById("tea_authcode");
	if(yzm1.value=="")
		tip22.innerHTML="验证码不能为空！";
	if(user1.value==""||pwd1.value==""||user1.value==user1.defaultValue||pwd1.value==pwd1.defaultValue)
		tip11.innerHTML="用户名或密码不能为空！";
	if(tip11.innerHTML==""&&tip22.innerHTML==""){
	 //   alert("sss");
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
	var yzm_tea_text =  document.getElementById("yzm_tea");
	yzm_tea_text.innerHTML = num;
}
function yzm_s_focus(){
	var error =  document.getElementById("tip_Error_s_yzm");
		error.innerHTML="";
}
function yzm_t_focus(){
	var error =  document.getElementById("tip_Error_t_yzm");
		error.innerHTML="";
}
function IsEqu_stu(this_s_yzm){
	//if(this_yzm.id=="stu_authcode"){
		var yzm_stu_text =  document.getElementById("yzm_stu").innerHTML;
		if(this_s_yzm.value!=""&&this_s_yzm.value!=yzm_stu_text)
		{
			var error1 =  document.getElementById("tip_Error_s_yzm");
			error1.innerHTML="验证码输入错误！";
		}
	//}
}
function IsEqu_tea(this_t_yzm){
		var yzm_tea_text =  document.getElementById("yzm_tea").innerHTML;
		if(this_t_yzm.value!=""&&this_t_yzm.value!=yzm_tea_text)
		{
			var error2 =  document.getElementById("tip_Error_t_yzm");
			error2.innerHTML="验证码输入错误！";
		}
}