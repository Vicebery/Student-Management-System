<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="admin_right_student.aspx.cs" Inherits="admin_right_student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
     <link href="/css/admin_right_student.css" rel="stylesheet" type="text/css" />
     <link href="/css/admin_content.css" rel="stylesheet" type="text/css" />
    <link href="/css/MasterPage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <%--展示学生信息列表界面--%>
    <%--学生信息管理顶部搜索--%>
    <div class="ars_top">
         <asp:Label ID="lbl_back1" runat="server" Text=">>" CssClass="top_lbl"></asp:Label>
         <asp:linkButton ID="btn_back1" runat="server" Text="学生信息列表" CssClass="top_btn"/>
    </div>
    <div class="ars_content">
    <%--学生信息列表--%>
    <div class="infolist">

        <asp:GridView ID="grdv_ars" runat="server" AllowPaging="True" AutoGenerateColumns="False"  DataKeyNames="Sno" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Sno" HeaderText="学号" ReadOnly="True" SortExpression="Sno" />
                <asp:BoundField DataField="Sname" HeaderText="姓名" SortExpression="Sname" />
                <asp:BoundField DataField="Ssex" HeaderText="性别" SortExpression="Ssex" />
                <asp:BoundField DataField="SentranceTime" HeaderText="入学日期" SortExpression="SentranceTime" />
                <asp:BoundField DataField="Stel" HeaderText="联系方式" SortExpression="Stel" />
               <%-- <asp:ButtonField HeaderText="查看详情" Text="更多" >
                <ControlStyle CssClass="btn_ars_detail" />
                </asp:ButtonField>--%>
                <%--更改详情按钮1102-vicebery--%>
                <asp:TemplateField HeaderText="更多">   
                     <ItemTemplate>   
                             <asp:Button ID="btn_moreInfo"  runat="server" style="background-color:white;"   OnClick="btn_moreInfo_Click"   Text="查看详情"    />   
                     </ItemTemplate>   
                     <ControlStyle CssClass="btn_ars_detail" />
                </asp:TemplateField>   
 
                 <%--更改详情按钮1102-vicebery--%>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="SELECT [Sno], [Sname], [Ssex], [SentranceTime], [Stel] FROM [tb_Student]"></asp:SqlDataSource>

    </div>
    </div>
</asp:Content>

