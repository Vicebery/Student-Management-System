<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="teacher_grade.aspx.cs" Inherits="aspx_Admin_teacher_grade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
    <link href="/css/teacher_grade.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div class="tg_top"></div>
    <div class="tg_content">
        <div class="tg_content_info">
            <asp:Label ID="lbl_info1" runat="server" Text="此按钮将会开启录分系统，所有授权教师将获得录分权限！"></asp:Label>
        </div>
        <div class="tg_content_info">
            <asp:Label ID="lbl_info2" runat="server" Text="请慎重开启！" style="color:red;"></asp:Label>
         </div>
        <div class="tg_content_btn">
            <asp:Button ID="btn_start" runat="server" Text="开启录分系统" OnClick="btn_start_Click" />
        </div>
    </div>
    <div class="tg_bottom"></div>
</asp:Content>

