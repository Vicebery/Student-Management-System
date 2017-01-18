<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="student_grade.aspx.cs" Inherits="aspx_Admin_student_grade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
     <link href="/css/student_grade.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
       <%--查看、编辑学生成绩--%>
     <div class="sg_content">
         <div class="sg_content_top">
             <asp:Label ID="lbl_back1" runat="server" Text=">>" CssClass="course_top_lbl"></asp:Label>
            <asp:linkButton ID="btn_back1" runat="server" Text="学生成绩信息" CssClass="top_btn"/>
         </div>
         <div class="sg_content_tb">

             <asp:GridView ID="grdv_sg" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Sno,Cno,Tno" DataSourceID="SqlDataSource1"  GridLines="None" >
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="Sno" HeaderText="学号" ReadOnly="True" SortExpression="Sno" />
                     <asp:BoundField DataField="Sname" HeaderText="姓名" SortExpression="Sname" />
                     <asp:BoundField DataField="Cno" HeaderText="课程号" ReadOnly="True" SortExpression="Cno" />
                     <asp:BoundField DataField="Cname" HeaderText="课程名" SortExpression="Cname" />
                     <asp:BoundField DataField="Tno" HeaderText="教师号" ReadOnly="True" SortExpression="Tno" />
                     <asp:BoundField DataField="Grade1" HeaderText="平时成绩" SortExpression="Grade1" />
                     <asp:BoundField DataField="Grade2" HeaderText="期末成绩" SortExpression="Grade2" />
                     <asp:BoundField DataField="Grade" HeaderText="总成绩" SortExpression="Grade" />
                     <asp:CommandField ShowEditButton="True" />
                 </Columns>
                 <EditRowStyle BackColor="#2461BF" />
                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#1E90ff" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#1E90ff" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#aeccf1" />
                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="SELECT [Sno], [Sname], [Cno], [Cname], [Tno], [Grade1], [Grade2], [Grade] FROM [tb_SC]"></asp:SqlDataSource>

         </div>
         <div class="sg_cotent_bottom"></div>
    </div>
</asp:Content>

