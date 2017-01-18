<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="noticeChange.aspx.cs" Inherits="aspx_Admin_noticeChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="/css/MasterPage.css" rel="stylesheet" type="text/css" />
    <link href="/css/admin_content.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div style="height: 629px">
        <div style="height: 41px">
         <asp:Button ID="change" runat="server" Text="修改" Height="32px" Width="81px" style="position:relative;left:10px;" OnClick="change_Click"/>
         <asp:Button ID="submmit" runat="server" Text="提交" Height="32px" Width="81px" style="position:relative;left:40px;" OnClick="submmit_Click" />
    </div>
  <div style="height: 45px ;margin:20px 20px;" >
         <asp:Label ID="Label1" runat="server" Text="第一条通知" ></asp:Label>
        <asp:TextBox ID="notice1" runat="server" Height="32px" Width="881px" Font-Size="25px" ReadOnly="True"></asp:TextBox>
    </div>
          <div style="height: 45px ;margin:20px 20px;">
         <asp:Label ID="Label2" runat="server" Text="第二条通知"></asp:Label>
        <asp:TextBox ID="notice2" runat="server" Height="32px" Width="881px" Font-Size="25px" ReadOnly="True"></asp:TextBox>
    </div>   
          <div style="height: 45px ;margin:20px 20px;">
         <asp:Label ID="Label3" runat="server" Text="第三条通知"></asp:Label>
        <asp:TextBox ID="notice3" runat="server" Height="32px" Width="881px" Font-Size="25px" ReadOnly="True"></asp:TextBox>
    </div>   
          <div style="height: 45px; margin:20px 20px;">
         <asp:Label ID="Label4" runat="server" Text="第四条通知"></asp:Label>
        <asp:TextBox ID="notice4" runat="server" Height="32px" Width="881px" Font-Size="25px" ReadOnly="True"></asp:TextBox>
    </div>   
          <div style="height: 45px ;margin:20px 20px;">
         <asp:Label ID="Label5" runat="server" Text="第五条通知"></asp:Label>
        <asp:TextBox ID="notice5" runat="server" Height="32px" Width="881px" Font-Size="25px" ReadOnly="True"></asp:TextBox>
    </div>   
          <div style="height: 45px ;margin:20px 20px;">
         <asp:Label ID="Label6" runat="server" Text="第六条通知"></asp:Label>
        <asp:TextBox ID="notice6" runat="server" Height="32px" Width="881px" Font-Size="25px" ReadOnly="True"></asp:TextBox>
    </div>   
          <div style="height: 45px ;margin:20px 20px;">
         <asp:Label ID="Label7" runat="server" Text="第七条通知"></asp:Label>
        <asp:TextBox ID="notice7" runat="server" Height="32px" Width="881px" Font-Size="25px" ReadOnly="True"></asp:TextBox>
    </div> 
          <div style="height: 45px ;margin:20px 20px;">
         <asp:Label ID="Label8" runat="server" Text="第八条通知"></asp:Label>
        <asp:TextBox ID="notice8" runat="server" Height="32px" Width="881px" Font-Size="25px" ReadOnly="True"></asp:TextBox>
    </div>  
               
    </div>
</asp:Content>

