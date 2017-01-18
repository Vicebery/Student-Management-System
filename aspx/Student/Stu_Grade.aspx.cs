using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Student_stu : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            id = Session["userID"].ToString();
            SqlDataSource1.SelectCommand = "select tb_SC.Cno,tb_SC.Cname,Credit,Ctime,Grade1,Grade2,Grade from tb_SC,tb_Course where tb_SC.Cno=tb_Course.Cno and Sno='" + id + "' and Grade >=0";
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string QueryCmd = "select tb_SC.Cno,tb_SC.Cname,Credit,Ctime,Grade1,Grade2,Grade from tb_SC,tb_Course where tb_SC.Cno=tb_Course.Cno and Sno='" + id + "'";
        if (DropDownList1.SelectedIndex == 0)
        {
            //已打分课程
            QueryCmd = QueryCmd + " and Grade >=0";
        }
        else
        {
            //未打分课程
            QueryCmd = QueryCmd + " and Grade <0";

        }
        SqlDataSource1.SelectCommand = QueryCmd;
    }
}