<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="admin_right_course.aspx.cs" Inherits="admin_right_course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
    <link href="/css/admin_right_course.css" rel="stylesheet" type="text/css" />
    <link href="/css/admin_content.css" rel="stylesheet" type="text/css" />
    <link href="/css/MasterPage.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div id="course_main">
        <%--回退按钮--%>
        <div id="course_top">

            <asp:Label ID="lbl_back1" runat="server" Text=">>" CssClass="course_top_lbl"></asp:Label>
            <asp:linkButton ID="btn_back1" runat="server" Text="课程列表" CssClass="course_top_btn"/>

        </div>
        <div id="course_content">
            <%--搜索栏和添加新课程按钮--%>
            <div class="course_content_header">
                <div id="search">
                     <asp:DropDownList ID="ddlist_search" runat="server" CssClass="ddlist" AutoPostBack="True" OnSelectedIndexChanged="ddlist_search_SelectedIndexChanged">
                         <asp:ListItem>全部</asp:ListItem>
                     </asp:DropDownList>
                    <asp:TextBox ID="txtbox_search" runat="server" CssClass="txtbox_search" AutoPostBack="True" OnTextChanged="txtbox_search_TextChanged"></asp:TextBox>
                    <asp:Button ID="btn_search" runat="server" Text="查询" CssClass="btn_search" OnClick="btn_search_Click"/>
                </div> 
                <asp:Button ID="btn_add" runat="server" Text="添加新课程" CssClass="btn_add" OnClick="btn_add_Click"/>

            </div>
            <%--查询出来的数据表位置--%>
            <div class="course_content_table" style="border: thin dotted #00FFFF">

                <asp:GridView ID="grdvCourseList" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Cno" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="None"
                     OnSelectedIndexChanged="grdvCourseList_SelectedIndexChanged" OnRowCommand="GridView_OnRowCommand" OnRowDataBound="grdvCourseList_RowDataBound" OnRowDeleting="grdvCourseList_RowDeleting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField ControlStyle-CssClass="bfd" DataField="Cno" HeaderText="课程号" ReadOnly="True" SortExpression="Cno" >
                        <ControlStyle CssClass="bfd" />
                        </asp:BoundField>
                        <asp:BoundField ControlStyle-CssClass="bfd" DataField="Cname" HeaderText="课程名" SortExpression="Cname" >
                        <ControlStyle CssClass="bfd" />
                        </asp:BoundField>
                        <asp:BoundField ControlStyle-CssClass="bfd" DataField="Credit" HeaderText="学分" SortExpression="Credit" >
                        <ControlStyle CssClass="bfd" />
                        </asp:BoundField>
                        <asp:BoundField ControlStyle-CssClass="bfd" DataField="Cnature" HeaderText="课程性质" SortExpression="Cnature" >
                        <ControlStyle CssClass="bfd" />
                        </asp:BoundField>
                        <asp:BoundField ControlStyle-CssClass="bfd" DataField="Ctime" HeaderText="课时" SortExpression="Ctime" >
                        <ControlStyle CssClass="bfd" />
                        </asp:BoundField>
                        <asp:BoundField ControlStyle-CssClass="bfd" DataField="Ccollege" HeaderText="所属学院" SortExpression="Ccollege" >
                        <ControlStyle CssClass="bfd" />
                        </asp:BoundField>
                        <asp:BoundField ControlStyle-CssClass="bfd" DataField="Ccreatedate" HeaderText="创建时间" SortExpression="Ccreatedate" DataFormatString="{0:yyyy-MM-dd}" >
                        <ControlStyle CssClass="bfd" />
                        </asp:BoundField>
                        <asp:ImageField ControlStyle-CssClass="ifd" DataImageUrlField="Cpicture" HeaderText="课程图片" SortExpression="Cpicture" >
<ControlStyle CssClass="ifd"></ControlStyle>
                        </asp:ImageField>
                       <asp:ButtonField CommandName="btn_cmd_modify" Text="修改" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#1E90ff" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1E90ff" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#1e90ff" ForeColor="white" HorizontalAlign="Center" Font-Bold="False" Font-Size="Larger" Font-Underline="True" />
                    <RowStyle BackColor="#aeccf1" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="SELECT [Cno], [Cname], [Credit], [Cnature], [Ctime], [Ccollege], [Ccreatedate], [Cpicture] FROM [tb_Course] ORDER BY [Cno] DESC"></asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

