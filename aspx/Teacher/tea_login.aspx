<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tea_login.aspx.cs" Inherits="aspx_Teacher_tea_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <title>学生管理系统登陆</title>
<link rel="stylesheet" type="text/css" href="../../css/user_login.css" />
<script type="text/javascript" src="/js/tealogin.js"></script>
</head>

<body onload="newAutoCode()">

    <form runat="server">
<div class="login_bg">
	<div class="login_content">
		<div class="login_logo">
			<a href="http://www.hubu.edu.cn/">
				<!--<img src="images/logo.png"  width="187" height="110">-->
				<img src="../../images/logo/logo.png"  width="255" height="76" />
			</a>
		</div>
		<div class="login_detailed">
			<div class="login_tab">教师登陆</div>
			<!--教师登陆开始-->
			<div id="login_t1" class="login_tab_left" style="display: block;">
				<div class="login_user">
					<div class="login_user_content f1">
						<ul>
									<li><asp:TextBox  class="login_text" ID="loginId_tea" value="请填写您的帐号" runat="server" onfocus="tlogin_text_onfocus(this)" onblur="tlogin_text_onblur(this)" ></asp:TextBox></li>
									<li><asp:Label id="tip_Error_t1" runat="server"></asp:Label></li>
                                    <li><asp:TextBox class="login_text"  ID="pwd_tea" value="请输入您的密码" onfocus="tlogin_pwd_onfocus(this)" onblur="tlogin_pwd_onblur(this)" runat="server" TextMode="Password"></asp:TextBox></li>
									<li><asp:Label id="tip_Error_t2" runat="server"></asp:Label></li>
									<li>
										<div class="login_user_yam">
											<ul>
												<li><input class="login_text_yzm" ID="tea_authcode" name="tea_authcode" value="" type="text" onfocus="yzm_t_focus()" onblur="IsEqu_tea(this)" /></li>
												<li><div id="yzm_tea" class="login_user_yzm_img" onclick="newAutoCode()"></div></li>
												<li><i onclick="newAutoCode();">看不清，换一张</i></li>
											</ul>
										</div></li>
									<li><asp:Label id="tip_Error_t_yzm" runat="server"></asp:Label></li>
                            
								  <li>  <asp:Button  class="button_blue"  runat="server" Text="登 录" ID="btn_Submit_Tea" OnClick="btn_Submit_Tea_Click" onmousedown="login_t_button_mousedown()" OnClientClick="return login_t_button_click()"/> </li>
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