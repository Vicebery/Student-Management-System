<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Stu_Grade.aspx.cs" Inherits="aspx_Student_stu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="/css/stu_grade.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div class="goto_main"><a href="/aspx/Student/stu_main.aspx">返回</a></div>
    <div class="stu_grade">
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>已有成绩课程</asp:ListItem>
            <asp:ListItem>未有成绩课程</asp:ListItem>
        </asp:DropDownList>
    
        <asp:GridView ID="gv_grade" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" style="margin-top: 0px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Cno" HeaderText="课程号" SortExpression="Cno" />
                <asp:BoundField DataField="Cname" HeaderText="课程名" SortExpression="Cname" />
                <asp:BoundField DataField="Credit" HeaderText="学分" SortExpression="Credit" />
                <asp:BoundField DataField="Ctime" HeaderText="课时" SortExpression="Ctime" />
                <asp:BoundField DataField="Grade1" HeaderText="平时成绩" SortExpression="Grade1" />
                <asp:BoundField DataField="Grade2" HeaderText="考核成绩" SortExpression="Grade2" />
                <asp:BoundField DataField="Grade" HeaderText="最终成绩" SortExpression="Grade" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <EmptyDataTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text="平时成绩"></asp:TextBox>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="select tb_SC.Cno,tb_SC.Cname,Credit,Ctime,Grade1,Grade2,Grade
from tb_SC,tb_Course
where tb_SC.Cno=tb_Course.Cno"></asp:SqlDataSource>
    
    </div>
</asp:Content>

