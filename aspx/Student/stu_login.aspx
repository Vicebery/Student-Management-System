<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="stu_login.aspx.cs" Inherits="user_login" %>

<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title>学生管理系统登陆</title>
<link rel="stylesheet" type="text/css" href="../../css/user_login.css">
<script type="text/javascript" src="../../js/stulogin.js"></script>
</head>

<body onload="newAutoCode()">

    <form runat="server">
<div class="login_bg">
	<div class="login_content">
		<div class="login_logo">
			<a href="http://www.hubu.edu.cn/">
				<!--<img src="images/logo.png"  width="187" height="110">-->
				<img src="../../images/logo/logo.png"  width="255" height="76">
			</a>
		</div>
		<div class="login_detailed">
			<div class="login_tab">学生登陆</div>
			<!--学生登陆开始-->
			<div id="login_t1" class="login_tab_left" style="display: block;">
				<div class="login_user">
					<div class="login_user_content f1">
						<ul>
									<li><asp:TextBox  class="login_text" ID="loginId_stu" value="请填写您的学号" runat="server" onfocus="slogin_text_onfocus(this)" onblur="slogin_text_onblur(this)" ></asp:TextBox></li>
									<li><asp:Label id="tip_Error_s1" runat="server"></asp:Label></li>
                                    <li><asp:TextBox class="login_text"  ID="pwd_stu" value="请输入您的密码" onfocus="slogin_pwd_onfocus(this)" onblur="slogin_pwd_onblur(this)" runat="server" TextMode="Password"></asp:TextBox></li>
									<li><asp:Label id="tip_Error_s2" runat="server"></asp:Label></li>
									<li>
										<div class="login_user_yam">
											<ul>
												<li><input class="login_text_yzm" ID="stu_authcode" name="stu_authcode" value="" type="text" onfocus="yzm_s_focus()" onblur="IsEqu_stu(this)"></li>
												<li><div id="yzm_stu" class="login_user_yzm_img" onclick="newAutoCode()"></div></li>
												<li><i onclick="newAutoCode();">看不清，换一张</i></li>
											</ul>
										</div></li>
									<li><asp:Label id="tip_Error_s_yzm" runat="server"></asp:Label></li>
                            
								  <li>  <asp:Button  class="button_blue"  runat="server" Text="登 录" ID="btn_Submit_Stu" OnClick="btn_Submit_Stu_Click" onmousedown="login_s_button_mousedown()" OnClientClick="return login_s_button_click()"/> </li>
							    <li class="mt25"><a href="mailto:Vicebery@163.com" class="to-animate">忘记密码</a><b>|</b><a href="http://wpa.qq.com/msgrd?v=3&uin=1275323490&site=qq&menu=yes" class="to-animate">联系管理员</a></li>
	                   </ul>    
					</div>	
				</div>
			</div>
		</div>
	</div>
</div>
        </form>
</body>
</html>
