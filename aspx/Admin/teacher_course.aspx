<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="teacher_course.aspx.cs" Inherits="aspx_Admin_teacher_course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
        <link href="/css/teacher_course.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
            <%--头部信息栏--%>
            <div class="tc_top">
                <asp:Label ID="lbl_back1" runat="server" Text=">>" CssClass="top_lbl" ></asp:Label>
                <asp:LinkButton ID="btn_back1" runat="server" Text="课程分配首页" CssClass="top_btn" />
            </div>
    <div class="content">

        <%--教师信息表--%>
            <div class="teaTable">

                <asp:GridView ID="grdv_tc" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Tno" DataSourceID="SqlDataSource1"  GridLines="None" AllowPaging="True" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Tno" HeaderText="职位号" ReadOnly="True" SortExpression="Tno" />
                        <asp:BoundField DataField="Tname" HeaderText="教师名" SortExpression="Tname" />
                        <asp:BoundField DataField="Ttitle" HeaderText="职称" SortExpression="Ttitle" />
                        <asp:BoundField DataField="Ccollege" HeaderText="所属学院" SortExpression="Ccollege" />
                        <%--分配课程按钮--%>
                        <asp:TemplateField HeaderText="分配课程">   
                            <ItemTemplate>   
                                  <asp:Button ID="btn_assignCourseInfo"  runat="server" style="background-color:white;"   OnClick="btn_assignCourseInfo_Click"   Text="前往"    />   
                             </ItemTemplate>   
                             <ControlStyle CssClass="btn_assignCourseInfo" />
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
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="SELECT [Tno], [Tname], [Ttitle], [Ccollege] FROM [tb_Teacher]"></asp:SqlDataSource>

            </div>
        <%--底部--%>
        <div class="tc_bottom"></div>
        </div>
</asp:Content>

