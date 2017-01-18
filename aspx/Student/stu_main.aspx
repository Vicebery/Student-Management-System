<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="stu_main.aspx.cs" Inherits="aspx_Student_stu_main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/stu_main.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div>
        <div class="header">
            <asp:Label ID="stu_name" runat="server" Text=""></asp:Label>同学，欢迎登录！
        </div>

        <div class="nav_stu">
             <div class="guide_info">
                <a href="/aspx/Student/student_myinfo.aspx"><img src="/images/guide/stu_info.png"/></a>
            </div>

            <div class="guide_psw">
                 <a href="/aspx/Student/stu_pwd.aspx"><img src="/images/guide/stu_psw.png"/></a>
            </div>

            <div class="guide_course">
                 <a href="/aspx/Student/Stu_Chose_course.aspx"><img src="/images/guide/stu_course.png"/></a>
            </div>

            <div class="guide_grade">
                 <a href="/aspx/Student/Stu_Grade.aspx"><img src="/images/guide/stu_grade.png"/></a>
            </div>

            <div class="guide_exit">
                 <a href="/aspx/index.aspx"><img src="/images/guide/stu_exit.png"/></a>
            </div>
        </div>
    </div>
</asp:Content>

