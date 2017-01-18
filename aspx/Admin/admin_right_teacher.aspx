<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="admin_right_teacher.aspx.cs" Inherits="aspx_Admin_admin_right_teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
     <link href="/css/admin_right_teacher.css" rel="stylesheet" type="text/css" />
     <link href="/css/admin_content.css" rel="stylesheet" type="text/css" />
    <link href="/css/MasterPage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
     <%--展示教师信息列表界面--%>
        <%--教师信息管理顶部搜索--%>
    <div class="art_top">
         <asp:Label ID="lbl_back1" runat="server" Text=">>" CssClass="top_lbl"></asp:Label>
         <asp:linkButton ID="btn_back1" runat="server" Text="教师信息列表" CssClass="top_btn"/>
    </div>
    <div class="art_content">

    <%--教师信息列表--%>
    <div class="infolist">

        <asp:gridview ID="grdv_art" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Tno" DataSourceID="SqlDS_teacher"  GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Tno" HeaderText="职位号" ReadOnly="True" SortExpression="Tno" />
                <asp:BoundField DataField="Tname" HeaderText="教师姓名" SortExpression="Tname" />
                <asp:BoundField DataField="Tsex" HeaderText="性别" SortExpression="Tsex" />
                <asp:BoundField DataField="Ttitle" HeaderText="职称" SortExpression="Ttitle" />
                <asp:BoundField DataField="Ccollege" HeaderText="所属学院" SortExpression="Ccollege" />
                <%--详情按钮--%>
                <asp:TemplateField HeaderText="更多">   
                     <ItemTemplate>   
                             <asp:Button ID="btn_moreInfo"  runat="server" style="background-color:white;"   OnClick="btn_moreInfo_Click"   Text="查看详情"    />   
                     </ItemTemplate>   
                     <ControlStyle CssClass="btn_art_detail" />
                </asp:TemplateField>   
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
        </asp:gridview>
        <asp:sqldatasource ID="SqlDS_teacher" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="SELECT [Tno], [Tname], [Tsex], [Ttitle], [Ccollege] FROM [tb_Teacher]"></asp:sqldatasource>
    </div>
    </div>
</asp:Content>

