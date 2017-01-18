<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="course_add.aspx.cs" Inherits="aspx_Admin_course_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
    <title>管理员添加课程界面</title>
     <link href="/css/course_add.css" rel="stylesheet" type="text/css" />
    <link href="/css/admin_content.css" rel="stylesheet" type="text/css" />
    <link href="/css/MasterPage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div class="addC_top">
        <asp:Label ID="lbl_back1" runat="server" Text=">>" CssClass="top_lbl" ></asp:Label>
       <asp:LinkButton ID="btn_back1" runat="server" Text="课程信息首页" CssClass="top_btn" OnClick="btn_back1_Click"  />
    </div>
    <div class="add">
        <%--<a href="/aspx/Admin/admin_right_course.aspx" >返回</a>--%>
        <h2>课程管理</h2>

        <div class="add_text">
        <ul>
        <li><asp:Label ID="lblCname" runat="server" Text="课程名"></asp:Label>
            　<asp:TextBox ID="tbxCname" runat="server"></asp:TextBox>
            </li>
       
        <li>　</li>
        
        <li><asp:Label ID="lblCscore" runat="server" Text="课程学分"></asp:Label>
            <asp:TextBox ID="tbxCscore" runat="server"></asp:TextBox>
            </li>
        
        
        <li><asp:Label ID="lblCclass" runat="server" Text="课程学时"></asp:Label>
            <asp:TextBox ID="tbxCclass" runat="server" TextMode="Number"></asp:TextBox>
            </li>
       
        <li><asp:Label ID="lblCtype" runat="server" Text="课程类型"></asp:Label>
            <asp:DropDownList ID="ddlCtype" runat="server">
                <asp:ListItem>必修</asp:ListItem>
                <asp:ListItem>专选</asp:ListItem>
                <asp:ListItem>公选</asp:ListItem>
            </asp:DropDownList>
            </li>
       
        <li><asp:Label ID="lblCacademy" runat="server" Text="所属学院"></asp:Label>
            <asp:DropDownList ID="ddlCacademy" runat="server" DataSourceID="SDS_college" DataTextField="Ccollege" DataValueField="Coid">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SDS_college" runat="server"  ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>"  SelectCommand="SELECT [Coid], [Ccollege] FROM [tb_College]"></asp:SqlDataSource>
            </li>
            <li>
            </li>
            <li>

                <asp:Label ID="lbl_errormsg" runat="server" ForeColor="Red"></asp:Label>

            </li>
       </ul>
        </div>

        <div class="add_picture">
            　　<asp:Label ID="lblCpress" runat="server" Text="课程封面"></asp:Label>
            
            <br />
            
            <asp:Image ID="imgCpicture" runat="server" Height="200px" Width="200px" ImageUrl="~/courseImages/提示.png" BorderStyle="None" />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            　　

         
            <asp:Button ID="btn_load" runat="server" OnClick="btn_load_Click" Text="上传" />
            <asp:Label ID="lbl_picturemsg" runat="server"></asp:Label>

        </div>
        <div class="Submit">
            <asp:Button ID="btnSubmit" runat="server" Text="提交" OnClick="btnSubmit_Click" />
        </div>
       
    </div>
</asp:Content>

