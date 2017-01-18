<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="courseList.aspx.cs" Inherits="courseList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/courseList.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div class="searchCourse">
        <div class="returnLink">
            >><a href="/aspx/index.aspx">返回</a>
        </div>
        <br />
        <asp:DropDownList ID="ddlSearch" runat="server" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
            
        </asp:DropDownList>
        <asp:TextBox ID="txtSearchCourse" runat="server" onClientfocus="" OnTextChanged="txtSearchCourse_TextChanged" AutoPostBack="true"></asp:TextBox>    
    </div>
    <div id="tabCouseMess">
        <asp:Repeater ID="repCourseList" runat="server">
            <ItemTemplate>
                <div id="oneCourse">
                    <div class="coursePic"><a href="courseDetail.aspx?page=<%# Eval("Cname") %>"><asp:Image ID="coursePic" runat="server" Width="150" Height="150" src='<%# Eval("Cpicture") %>'></asp:Image></a></div>
                    <div class="courseNa"><a href="courseDetail.aspx?page=<%# Eval("Cname") %>">课程名称：<%# Eval("Cname") %></a></div>
                    <div class="courseNat"><a href="courseDetail.aspx?page=<%# Eval("Cname") %>">课程性质：<%# Eval("Cnature") %></a></div>
                    <div class="courseCol"><a href="courseDetail.aspx?page=<%# Eval("Cname") %>">所属学院：<%# Eval("Ccollege") %></a></div>
                </div>
            </ItemTemplate>
            <%--<FooterTemplate>  
                <div class="pageTurning">
                <tr>  
                    <td colspan="2" style="font-size:12pt;color:#0099ff; background-color:#e6feda;">  
                    共<asp:Label ID="lblpc" runat="server" Text="Label"></asp:Label>页 当前为第  
                    <asp:Label ID="lblp" runat="server" Text="Label"></asp:Label>页  
                    <asp:HyperLink ID="hlfir" runat="server" Text="首页"></asp:HyperLink>  
                    <asp:HyperLink ID="hlp" runat="server" Text="上一页"></asp:HyperLink>  
                    <asp:HyperLink ID="hln" runat="server" Text="下一页"></asp:HyperLink>  
                    <asp:HyperLink ID="hlla" runat="server" Text="尾页"></asp:HyperLink>  
                     跳至第<asp:DropDownList ID="ddlp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlp_SelectedIndexChanged" ></asp:DropDownList>页  
                    </td>  
                </tr>
                </div>  
            </FooterTemplate>--%>

        </asp:Repeater>


    </div>
    <%--<div class="pageTurning">
        
    </div>--%>
</asp:Content>

