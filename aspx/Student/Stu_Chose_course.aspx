<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Stu_Chose_course.aspx.cs" Inherits="aspx_Student_stu_choiceCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/student_course.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div>
        <div class="goto_main"><a href="/aspx/Student/stu_main.aspx">返回</a></div>
        <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" Text="选课" />
        
        <asp:Button ID="btn_back" runat="server" OnClick="btn_back_Click" Text="退课" />
        <br />
        <asp:Table ID="chooseCourse" runat="server">
        <asp:TableRow>
            <asp:TableCell CssClass="noChoice">
            <div class="noChoiceCourse">
                <asp:Label ID="Label1" runat="server" Text="选课表："></asp:Label>
    
                <asp:GridView ID="gv_nochoose" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Cno" HeaderText="课程号" SortExpression="Cno" />
                        <asp:BoundField DataField="Cname" HeaderText="未选课程名" SortExpression="Cname" />
                        <asp:BoundField DataField="Tname" HeaderText="任课教师" SortExpression="Tname" />
                        <asp:BoundField DataField="Credit" HeaderText="学分" SortExpression="Credit" />
                        <asp:BoundField DataField="Cnature" HeaderText="课程性质" SortExpression="Cnature" />
                        <asp:BoundField DataField="Ctime" HeaderText="课时" SortExpression="Ctime" />
                        <asp:TemplateField HeaderText="选择">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Tno" HeaderText="Tno" SortExpression="Tno" >
                        <ControlStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataTemplate>
                        <asp:CheckBox ID="cbNotChose" runat="server" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="SELECT tb_Course.Cno, tb_Course.Cname, tb_Course.Credit, tb_Course.Cnature, tb_Course.Ctime, tb_TC.Tno, tb_TC.Tname FROM tb_Course INNER JOIN tb_TC ON tb_Course.Cno = tb_TC.Cno"></asp:SqlDataSource>
            </div>
            </asp:TableCell>
            <asp:TableCell CssClass="choiced">
            <div class="choicedCourse">
                <asp:Label ID="Label2" runat="server" Text="已选课表："></asp:Label>
                <asp:GridView ID="gv_choiced" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Cno" HeaderText="课程号" SortExpression="Cno" />
                        <asp:BoundField DataField="Cname" HeaderText="已选课程名" SortExpression="Cname" />
                        <asp:BoundField DataField="Tname" HeaderText="任课教师" SortExpression="Tname" />
                        <asp:BoundField DataField="Credit" HeaderText="学分" SortExpression="Credit" />
                        <asp:BoundField DataField="Cnature" HeaderText="课程性质" SortExpression="Cnature" />
                        <asp:BoundField DataField="Ctime" HeaderText="课时" SortExpression="Ctime" />
                        <asp:TemplateField HeaderText="退选">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Tno" HeaderText="Tno" SortExpression="Tno" >
                        <ControlStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" />
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
        
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="SELECT * FROM [view_SC] WHERE ([Sno] = @Sno)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="Sno" Name="Sno" SessionField="Sno" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            </asp:TableCell>
        </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>

