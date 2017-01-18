<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="student_info.aspx.cs" Inherits="aspx_Admin_student_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
     <link href="/css/student_info.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div class="si_top">
         <asp:Label ID="lbl_back1" runat="server" Text=">>" CssClass="top_lbl" ></asp:Label>
         <asp:linkButton ID="btn_back1" runat="server" Text="学生信息列表" CssClass="top_btn" OnClick="btn_back1_Click"/>
        <asp:Label ID="lbl_back2" runat="server" Text=">>" CssClass="top_lbl"></asp:Label>
         <asp:linkButton ID="btn_back2" runat="server"  CssClass="top_btn" />
    </div>
    <div class="infoborder">
    <div class="SInfo">
        <div class="infotop">
            <div class="idnamesexbir">
                <div class="infobox">
                    <asp:Label ID="lbl_id" runat="server" Text="学号："></asp:Label>
                    <asp:TextBox ID="tbox_id" runat="server" Width="220px"  Enabled="False"></asp:TextBox>
                 </div>
                 <div class="infobox">
                    <asp:Label ID="lbl_name" runat="server" Text="姓名："></asp:Label>
                    <asp:TextBox ID="tbox_name" runat="server" Width="216px" Enabled="False"></asp:TextBox>
                </div>
                 <div class="infobox">
                    <asp:Label ID="lbl_sex" runat="server" Text="性别：" style="float:left;"></asp:Label>
                    <asp:RadioButtonList ID="tblist_sex" runat="server" RepeatDirection="Horizontal" style="float:left; margin-left:15px;" Enabled="False">
                        <asp:ListItem style=" margin-right:15px;">男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                 <div class="infobox">
                    <asp:Label ID="lbl_birthday" runat="server" Text="出生日期："></asp:Label>
                    <asp:TextBox ID="tbox_birthday" runat="server" Enabled="False"></asp:TextBox>
                </div>
                 <div class="infobox">
                    <asp:Label ID="lbl_politicalface" runat="server" Text="政治面貌："></asp:Label>
                    <asp:TextBox ID="tbox_politicalface" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="infobox">
                    <asp:Label ID="lbl_nation" runat="server" Text="民 族 ："></asp:Label>
                    <asp:TextBox ID="tbox_nation" runat="server" style="margin-left:22px;" Enabled="False"></asp:TextBox>
                </div>
            </div>
            <div class="picture">
                 <asp:Image ID="imgStu" runat="server" />
            </div>
       </div>
       <div class="infobottom">
           <div class="infobottom_left">
                <div class="infobox">
                    <asp:Label ID="lbl_native" runat="server" Text="籍  贯  ："></asp:Label>
                    <asp:TextBox ID="tbox_native" runat="server" style="margin-left:22px;" Enabled="False" Width="245px"></asp:TextBox>
                </div>
                <div class="infobox">
                    <asp:Label ID="lbl_entrancedate" runat="server" Text="入学日期："></asp:Label>
                    <asp:TextBox ID="tbox_entrancedate" runat="server" Enabled="False"></asp:TextBox>
               </div>
                 <div class="infobox">
                    <asp:Label ID="lbl_address" runat="server" Text="家庭住址："></asp:Label>
                    <asp:TextBox ID="tbox_address" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="infobox">
                    <asp:Label ID="lbl_idnum" runat="server" Text="身份证号："></asp:Label>
                    <asp:TextBox ID="tbox_idnum" runat="server" Enabled="False"></asp:TextBox>
                </div>
            </div>
           <div class="infobottom_right">
                 <div class="infobox">
                    <asp:Label ID="lbl_phone" runat="server" Text="个人电话："></asp:Label>
                    <asp:TextBox ID="tbox_phone" runat="server" Enabled="False"></asp:TextBox>
                 </div>
                <div class="infobox">
                    <asp:Label ID="lbl_email" runat="server" Text="电子邮箱："></asp:Label>
                    <asp:TextBox ID="tbox_email" runat="server" Enabled="False"></asp:TextBox>
               </div> 
                <div class="infobox">
                    <asp:Label ID="lbl_note" runat="server" Text="备 注 ："></asp:Label>
                    <asp:TextBox ID="tbox_note" runat="server" style="margin-left:22px;" Enabled="False"></asp:TextBox>
                </div>
           </div>
       </div>

        </div>
    </div>
</asp:Content>

