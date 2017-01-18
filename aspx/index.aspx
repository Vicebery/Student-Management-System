 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/MasterPage.css" rel="stylesheet" type="text/css" />
    <link href="/css/index.css" rel="stylesheet" type="text/css" />
    <script src="/js/index.js"> </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div class="guide">

       <div class="g1"> 
           <a>网站首页 </a>
           </div>

        <div class="g2">
            <a>新闻动态 </a>
            </div>

        <div class="g3">
            <a>院系设置 </a>
            </div>

        <div class="g4">
            <a>教学教育 </a>
            </div>

        <div class="g5">
            <a>文化生活 </a>
            </div>

        <div class="g6"> 
            <a>联系我们 </a>
           </div>

         </div>

   <div id="container">
    <div id="list" style="left: -1200px;">
        <img src="../images/background/showPicture5.jpg" alt="1"/>
        <img src="../images/background/showPicture1.jpg" alt="1"/>
        <img src="../images/background/showPicture2.jpg" alt="2"/>
        <img src="../images/background/showPicture3.jpg" alt="3"/>
        <img src="../images/background/showPicture4.jpg" alt="4"/>
        <img src="../images/background/showPicture5.jpg" alt="5"/>
        <img src="../images/background/showPicture1.jpg" alt="5"/>
    </div>
    <div id="buttons">
        <span index="1" class="on"></span>
        <span index="2"></span>
        <span index="3"></span>
        <span index="4"></span>
        <span index="5"></span>
    </div>
    <a href="javascript:;" id="prev" class="arrow">&lt;</a>
    <a href="javascript:;" id="next" class="arrow">&gt;</a>
</div>


    <div class="keyInform">
        <div class="nav">
            重要通知
        </div>
        <div id="keyInfo">
            <div id="leftMessage">
                <ul>
			       <li><a>
                        <asp:Label id="notice1" runat="server" Text=""></asp:Label></a></li>
			        <li><a >
                        <asp:Label id="notice2" runat="server" Text=""></asp:Label></a></li>
			        <li><a  >
                        <asp:Label id="notice3" runat="server" Text=""></asp:Label></a></li>
			        <li><a >
                        <asp:Label id="notice4" runat="server" Text=""></asp:Label></a></li>
			        <li><a >
                        <asp:Label  id="notice5" runat="server" Text=""></asp:Label></a></li>
			        <li><a  >
                        <asp:Label id="notice6" runat="server" Text=""></asp:Label></a></li>
			        <li><a >
                        <asp:Label id="notice7" runat="server" Text=""></asp:Label></a></li>
			        <li><a >
                        <asp:Label  id="notice8" runat="server" Text=""></asp:Label></a></li> 
		        </ul>
            </div>
            <div id="centerMessage">
                <img src="../images/background/right2.jpg" height="280"/>
            </div>
            <div id="rightMessage">
                <ul>
                   <li><a>
                        <asp:Label id="news1" runat="server" Text=""></asp:Label></a></li>
			        <li><a  >
                        <asp:Label id="news2" runat="server" Text=""></asp:Label></a></li>
			        <li><a  >
                        <asp:Label id="news3" runat="server" Text=""></asp:Label></a></li>
			        <li><a >
                        <asp:Label id="news4" runat="server" Text=""></asp:Label></a></li>
			        <li><a >
                        <asp:Label  id="news5" runat="server" Text=""></asp:Label></a></li>
			        <li><a  >
                        <asp:Label id="news6" runat="server" Text=""></asp:Label></a></li>
			        <li><a  >
                        <asp:Label id="news7" runat="server" Text=""></asp:Label></a></li>
			        <li><a >
                        <asp:Label  id="news8" runat="server" Text=""></asp:Label></a></li> 
                </ul>
            </div>
        </div>
    </div>

    <div class="newCourse">
        <div class="showCourse">最新课程</div>
        <asp:Repeater ID="rptNewCourse" runat="server">
            <ItemTemplate>
                <div id="aCourse">
                    <div class="courseImg"><a href="courseDetail.aspx?page=<%# Eval("Cname") %>"><asp:Image ID="courseImg" runat="server" Width="150" Height="150" src='<%# Eval("Cpicture") %>'></asp:Image></a></div>
                    <div class="courseNam"><a href="courseDetail.aspx?page=<%# Eval("Cname") %>"><%# Eval("Cname") %></a></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="gotoNewCourseList"><a href="/aspx/newCourseList.aspx">更多...</a></div>
    </div>
    <div class="allCourse">
        <div class="showCourse">全部课程</div>
        <asp:Repeater ID="rptAllCourse" runat="server">
            <ItemTemplate>
                <div id="aCourse">
                    <div class="courseImg"><a href="courseDetail.aspx?page=<%# Eval("Cname") %>"><asp:Image ID="courseImg" runat="server" Width="150" Height="150" src='<%# Eval("Cpicture") %>'></asp:Image></a></div>
                    <div class="courseNam"><a href="courseDetail.aspx?page=<%# Eval("Cname") %>"><%# Eval("Cname") %></a></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="gotoAllCourseList"><a href="/aspx/CourseList.aspx">更多...</a></div>
    </div>
   

</asp:Content>

