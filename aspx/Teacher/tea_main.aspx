<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tea_main.aspx.cs" Inherits="aspx_Teacher_tea_main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="/css/tea_main.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div>
        <div class="header">
            登录成功！<asp:Label ID="tea_name" runat="server" Text="某某"></asp:Label>老师，欢迎您。
        </div>

        <div class="nav">
            <div class="guide_info">
                <a href="/aspx/Teacher/teacher_myinfo.aspx"><img src="/images/guide/guide_info.png"/></a>
            </div>

            <div class="guide_psw">
                 <a href="/aspx/Teacher/tea_pwd.aspx"><img src="/images/guide/guide_psw.png"/></a>
            </div>

            <div class="guide_course">
                 <a href="/aspx/Teacher/tea_couse.aspx""><img src="/images/guide/guide_course.png"/></a>
            </div>

            <div class="guide_grade">
                 <a href="/aspx/Teacher/Teacher.aspx"><img src="/images/guide/guide_grade.png"/></a>
            </div>

            <div class="guide_exit">
                 <a href="/aspx/index.aspx"><img src="/images/guide/guide_exit.png"/></a>
            </div>
        </div>
    </div>

</asp:Content>

