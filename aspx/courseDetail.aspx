<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="courseDetail.aspx.cs" Inherits="courseDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/courseDetail.css" rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div class="returnLink">
        >><a href="/aspx/index.aspx">返回</a>
    </div>
    <asp:Table class="courseDetails" runat="server">
        <asp:TableRow runat="server">

            <asp:TableCell class="Cdescrible" runat="server">
                <div class="courseTitle">
                    <asp:Label ID="courseTitle" runat="server" Font-Bold="true"></asp:Label>
                </div>
                <div class="courseBody">
                    <asp:Label ID="courseBody" runat="server"></asp:Label>
                </div>
            </asp:TableCell>

            <asp:TableCell class="Cinforamtion" runat="server">
                <asp:Image ID="img" runat="server" Height="200px" ImageAlign="Middle" Width="200px" />
                <div class="Ctext">
                    <ul>
                        <li>课程名：<asp:Label ID="CName" runat="server"></asp:Label>
                        </li>
                        <li>课程类型：<asp:Label ID="CType" runat="server"></asp:Label>
                        </li>
                        <li>学分：<asp:Label ID="CScore" runat="server"></asp:Label>
                        </li>
                        <li>学时：<asp:Label ID="CTime" runat="server"></asp:Label>
                        </li>
                        <li>所属学院：<asp:Label ID="CAcademey" runat="server"></asp:Label>
                        </li>   
                    </ul>
                </div>
        </asp:TableCell>

        </asp:TableRow>

    </asp:Table>
</asp:Content>

