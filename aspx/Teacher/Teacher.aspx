<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Teacher.aspx.cs" Inherits="aspx_Teacher_Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="/css/MasterPage.css" rel="stylesheet" type="text/css" />
      <script src="../js/Teacher.js"> </script>
     <link href="/css/tea_grade.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server" >
    <div class="goto_main"><a href="/aspx/Teacher/tea_main.aspx">返回</a></div>
    <div class="tea_grade">
    <asp:DropDownList ID="select_course" runat="server" Height="30px" Width="215px" AutoPostBack="True" OnSelectedIndexChanged="select_course_SelectedIndexChanged"  >

    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="平时成绩比例"></asp:Label>
    <asp:DropDownList ID="normal_grade" runat="server" AutoPostBack="True" OnSelectedIndexChanged="normal_grade_SelectedIndexChanged">
        <asp:ListItem Value="0">0%</asp:ListItem>
        <asp:ListItem Value="1">10%</asp:ListItem>
        <asp:ListItem Value="2">20%</asp:ListItem>
        <asp:ListItem Value="3">30%</asp:ListItem>
        <asp:ListItem Selected="True" Value="4">40%</asp:ListItem>
        <asp:ListItem Value="5">50%</asp:ListItem>
        <asp:ListItem Value="6">60%</asp:ListItem>
        <asp:ListItem Value="7">70%</asp:ListItem>
        <asp:ListItem Value="8">80%</asp:ListItem>
        <asp:ListItem Value="9">90%</asp:ListItem>
        <asp:ListItem Value="10">100%</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="Label1" runat="server" Text="考试成绩比例"></asp:Label>
    <asp:DropDownList ID="exam_grade" runat="server" AutoPostBack="True" OnSelectedIndexChanged="exam_grade_SelectedIndexChanged">
        <asp:ListItem Value="0">0%</asp:ListItem>
        <asp:ListItem Value="1">10%</asp:ListItem>
        <asp:ListItem Value="2">20%</asp:ListItem>
        <asp:ListItem Value="3">30%</asp:ListItem>
        <asp:ListItem Value="4">40%</asp:ListItem>
        <asp:ListItem Value="5">50%</asp:ListItem>
        <asp:ListItem Selected="True" Value="6">60%</asp:ListItem>
        <asp:ListItem Value="7">70%</asp:ListItem>
        <asp:ListItem Value="8">80%</asp:ListItem>
        <asp:ListItem Value="9">90%</asp:ListItem>
        <asp:ListItem Value="10">100%</asp:ListItem>
    </asp:DropDownList>
    <asp:GridView ID="StudentGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="346px" Width="556px" AutoGenerateColumns="False" AllowPaging="True" HorizontalAlign="Center"  
          OnRowDataBound="StudentGridView_RowDataBound">
        <AlternatingRowStyle BackColor="White" />
       
        <Columns>
            <asp:BoundField DataField="Sno" HeaderText="编号" ReadOnly="True" >
          
            </asp:BoundField>
            <asp:BoundField HeaderText="学号" DataField="Sno"  ReadOnly="True" SortExpression="Sno">
            <HeaderStyle  HorizontalAlign="Center"  />
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField HeaderText="姓名" DataField="Sname"  ReadOnly="True" SortExpression="Sname">
            <HeaderStyle  HorizontalAlign="Center" />
            </asp:BoundField>

          

                            <asp:TemplateField HeaderText="平时成绩">
                                <ItemTemplate><asp:TextBox ID="TextBox2" runat="server" Width="44px" AutoPostBack="True" ReadOnly="True" OnTextChanged="TextBox2_TextChanged"></asp:TextBox></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="期末成绩">
                <ItemTemplate><asp:TextBox ID="TextBox3" runat="server" Height="16px" Width="44px" AutoPostBack="True" ReadOnly="True" OnTextChanged="TextBox3_TextChanged" ></asp:TextBox></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="总成绩">
                <ItemTemplate><asp:Label ID="Label3" runat="server"></asp:Label></ItemTemplate>
            </asp:TemplateField>
        </Columns>
       
        <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#1E90ff" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1E90ff" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Width="20px" Height="5px" />
                    <PagerStyle BackColor="#1e90ff" ForeColor="White" HorizontalAlign="Center" Font-Bold="False" Font-Size="Larger" Font-Underline="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:Button ID="submit" runat="server" OnClick="submit_Click" Text="提交" Width="104px" />
    <asp:Button ID="change" runat="server" Text="修改" Width="104px" OnClick="change_Click" />
    <asp:Button ID="Save_grade" runat="server" OnClick="Save_grade_Click" Text="保存" Width="104px" />
    </div>

    </asp:Content>

