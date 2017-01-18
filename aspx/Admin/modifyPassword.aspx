<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="modifyPassword.aspx.cs" Inherits="aspx_Admin_modifyPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
    <link href="/css/modifyPassword.css" rel="stylesheet" type="text/css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
      <div class="center1_password_management">
        <div class="title_r">
            <a href="####">个人中心</a>
            <em>></em>
            修改密码
        </div>

        <div class="token_process">
            <ul>
                <li>
                    <blockquote>请重新设置您的账户密码</blockquote>
                </li>

                <li>
                    <blockquote><b class="necessary">*</b>当前密码：</blockquote>
                    <asp:TextBox ID="tbx_pswOld" class="input_text" runat="server" TextMode="Password"></asp:TextBox>
                   <asp:Label id="psw_old_hint" runat="server" class="tips_info" style=""></asp:Label>
   
 
                </li>
            
                <li>
                    <blockquote><b class="necessary">*</b>新密码：</blockquote>
                    <asp:TextBox ID="tbx_pswNew" class="input_text" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Label id="psw_sgh_hint" runat="server" class="tips_info" style=""></asp:Label>
          
                </li>
               
               
                <li>
                    <blockquote><b class="necessary">*</b>确认新密码：</blockquote>
                    <asp:TextBox ID="tbx_pswAck" class="input_text" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Label id="psw_ack_hint" runat="server" class="tips_info" style=""></asp:Label>

                </li>
            </ul>
            <br />
            <div class="btn">
                <asp:Button ID="btn_submit" runat="server" Text="确定" OnClick="btn_submit_Click" />
                　　　<asp:Button ID="btn_cancel" runat="server" Text="取消" />
            </div>
            
        </div>
     </div>
</asp:Content>

