/*Author: Vicebery
*Date: 20161014
*About: login_button
*验证不合法情况，
*/

function login_button_click(){  
	var tip1 =  document.getElementById("error_user"); 
	var tip2 =  document.getElementById("error_pwd"); 
	var user =  document.getElementById("user_input"); 
	var pwd =  document.getElementById("pwd_input");
	if (user.value == "" || user.value == "请输入您的管理账号")
		tip1.innerHTML="用户名不能为空！";
	if(pwd.value==""||pwd.value==pwd.defaultValue)
		tip2.innerHTML="密码不能为空！";
	if(tip1.innerHTML==""&&tip2.innerHTML=="")
	{
	    //alert("成功跳转");
	    return true;
	}
	//alert("ddddddddd成功跳转");
	return false;
} 
// function user_onblur(this_input){
// 	if(!this_input.value){
// 		this_input.style.color="#ccc";
// 		this_input.value=this_input.defaultValue;
// 	}else{
// 			this_input.style.color="black";
// 			var tip1 =  document.getElementById("error_user"); 
// 			tip1.innerHTML="";
// 		}

// }
function admin_onblur(this_input,id_label){
	if(!this_input.value){
		this_input.style.color="#ccc";
		this_input.value=this_input.defaultValue;
	}else{
			this_input.style.color="black";
			id_label.innerHTML="";
		}
}
function admin_onfocus(this_input){
	this_input.value="";
	this_input.style.color="#000";
}