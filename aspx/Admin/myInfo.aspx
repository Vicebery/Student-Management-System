<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="myInfo.aspx.cs" Inherits="aspx_myInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
      <link href="/css/MyInformation.css" rel="stylesheet" type="text/css" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
   <div class="center1_information_management">
        <div class="title_r">
            <a href="####">个人中心</a>
            <em>></em>
            我的信息
         
        </div>

        <div class="personal_info">
            <ul>
                <li>
                    <blockquote>登录名</blockquote>
                    <asp:TextBox ID="tbx_admin_name" class="input_text" runat="server"></asp:TextBox>
                   
                </li>

                <li>
                    <blockquote>职位</blockquote>
                    <asp:TextBox ID="tbx_admin_title" class="input_text" runat="server"></asp:TextBox>
                   
                </li>

                <li>
                    <blockquote>联系电话</blockquote>
                    <asp:TextBox ID="tbx_admin_tel" class="input_text" runat="server"></asp:TextBox>
                   
                </li>

                <li>
                    <blockquote>电子邮箱</blockquote>
                    <asp:TextBox ID="tbx_admin_email" class="input_text" runat="server"></asp:TextBox>
                   
                </li>
            </ul>
            
        </div>
    </div>
</asp:Content>

