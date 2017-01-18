<%@ Page Title="" Language="C#" MasterPageFile="~/admin_content.master" AutoEventWireup="true" CodeFile="assignCourse.aspx.cs" Inherits="aspx_Admin_assignCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_chirld" Runat="Server">
    <link href="/css/assignCourse.css" rel="stylesheet" type="text/css" />
    <%--<script src="/js/assignCourse.js" type="text/javascript"></script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <div id="ac_main">
        <div class="aC_top">
             <asp:Label ID="lbl_back1" runat="server" Text=">>" CssClass="top_lbl" ></asp:Label>
             <asp:LinkButton ID="btn_back1" runat="server" Text="课程分配首页" CssClass="top_btn" OnClick="btn_back1_Click" />
            <asp:Label ID="lbl_back2" runat="server" Text=">>" CssClass="top_lbl"></asp:Label>
            <asp:linkButton ID="btn_back2" runat="server"  CssClass="top_btn" />
        </div>
        <div class="content">
            <div class="info">
                <div class="box_info">
                    <asp:Label  runat="server" Text="教师职号："></asp:Label>
                    <asp:Label ID="lbl_id" runat="server" ></asp:Label>
                </div>
                <div class="box_info">
                    <asp:Label  runat="server" Text="姓  名  ："></asp:Label>
                    <asp:Label ID="lbl_name" runat="server" style="margin-left:20px"></asp:Label>
                </div>
                <%--查出该教师所在院开的课--%>
                 <div class="box_info">
                    <asp:Label  runat="server" Text="选择课程："></asp:Label>
                    <asp:dropdownlist id="ddlist_Cno" runat="server" DataSourceID="SqlDataSource1" DataTextField="Cname" DataValueField="Cno" style="width:150px"></asp:dropdownlist>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentServer_cs_course %>" SelectCommand="SELECT [Cno], [Cname] FROM [tb_Course] WHERE ([Coid] = @Coid)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lbl_coid" DefaultValue="0" Name="Coid" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
               <%-- 不可见，仅为查询提供参数--%>
                <asp:Label ID="lbl_coid" runat="server" Visible="False" ></asp:Label>
                <div class="box_info">
                    <asp:Label  runat="server" Text="上课时间："></asp:Label>
                    <asp:dropdownlist id="ddlist_week" runat="server">
                        <asp:ListItem>周一</asp:ListItem>
                        <asp:ListItem>周二</asp:ListItem>
                        <asp:ListItem>周三</asp:ListItem>
                        <asp:ListItem>周四</asp:ListItem>
                        <asp:ListItem>周五</asp:ListItem>
                        <asp:ListItem>周六</asp:ListItem>
                        <asp:ListItem>周日</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:dropdownlist id="ddlist_jie" runat="server">
                        <asp:ListItem>1-2</asp:ListItem>
                        <asp:ListItem>3-4</asp:ListItem>
                        <asp:ListItem>3-5</asp:ListItem>
                        <asp:ListItem>6-7</asp:ListItem>
                        <asp:ListItem>8-9</asp:ListItem>
                        <asp:ListItem>10-11</asp:ListItem>
                        <asp:ListItem>10-12</asp:ListItem>
                    </asp:dropdownlist>
                     <asp:Label  runat="server" Text="节"></asp:Label>
                 </div>
                <div class="box_info">
                      <asp:Label  runat="server" Text="上课地点："></asp:Label>
                      <asp:textbox id="tbox_add" runat="server"></asp:textbox>
                      <asp:Label ID="error_add" runat="server" style="color:red;"></asp:Label>
                </div>
                <div class="box_info">
                      <asp:Label  runat="server" Text="上课周次："></asp:Label>
                    <asp:Label  runat="server" Text="第"></asp:Label>
                    <asp:dropdownlist id="week1" runat="server"  >
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                      </asp:dropdownlist>
                    <asp:Label  runat="server" Text="周——第"></asp:Label>
                    <asp:dropdownlist id="week2" runat="server" >
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                      </asp:dropdownlist>
                    <asp:Label  runat="server" Text="周"></asp:Label>
                    <asp:Label ID="error_msg2" runat="server" style="color:red;"></asp:Label>
                      <asp:RadioButtonList ID="rbList_week" runat="server" RepeatDirection="Horizontal" style="margin-left:100px;" DataValueField="ddd">
                          <asp:ListItem>单周</asp:ListItem>
                          <asp:ListItem>双周</asp:ListItem>
                          <asp:ListItem>单双周</asp:ListItem>
                      </asp:RadioButtonList>
                </div>

            </div>
            <asp:button id="btn_submit" runat="server" text="提交信息" class="btn_submit" OnClick="btn_submit_Click"/>
            <asp:Label ID="DBerror_info" runat="server" style="color:red;"></asp:Label>
        </div>
        <div class="aC_bottom"></div>
    </div>
</asp:Content>

