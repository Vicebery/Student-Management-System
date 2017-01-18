<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="../../css/adminlogin.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/jquery.js"></script>
<script src="../../js/cloud.js" type="text/javascript"></script>
<script src="../../js/test_admin_pwd.js" type="text/javascript"></script>

<script language="javascript">
    $(function () {
        $('.loginbox').css({ 'position': 'absolute', 'left': ($(window).width() - 692) / 2 });
        $(window).resize(function () {
            $('.loginbox').css({ 'position': 'absolute', 'left': ($(window).width() - 692) / 2 });
        })
    });
</script> 

</head>

    <form runat="server">
<body style="background-color:#1c77ac; background-image:url(../../images/background/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="../index.aspx">回首页</a>
        </li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <ul>
    <li><asp:TextBox runat="server" id="user_input" class="loginuser" value="请输入您的管理账号" onfocus="admin_onfocus(this)" onblur="admin_onblur(this,error_user)" /></li>
    <li><div style="height:30px;"><asp:label id="error_user" runat="server" style="color:red;"></asp:label></div> </li>
    <li><asp:TextBox runat="server" id="pwd_input" class="loginpwd" value="请输入您的密码"  TextMode="Password" onfocus="admin_onfocus(this)" onblur="admin_onblur(this,error_pwd)"/></li>
    <li><div style="height:30px;"><asp:label id="error_pwd" runat="server" style="color:red;"></asp:label></div> </li>
    <li><asp:Button runat="server" class="loginbtn" Text="登录"  ID="btn_Submit" OnClick="btn_Submit_Click" OnClientClick= "return login_button_click()" />
        <label><input name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>

    </ul>
    
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm">版权所有:湖北大学2014级计算机科学与技术专业小兄弟团队　　
			联系电话：12345678 &nbsp&nbsp&nbsp&nbsp 邮箱：1343194370@qq.com
			&nbsp&nbsp&nbsp&nbsp 邮编：430062</div>
</body>
        </form>
</html>
