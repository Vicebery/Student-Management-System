using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnStuLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("/aspx/Student/stu_login.aspx");
    }

    protected void btnTeaLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("/aspx/Teacher/tea_login.aspx");
    }

    protected void btnAdmLink_Click(object sender, EventArgs e)
    {
        Response.Redirect("/aspx/Admin/AdminLogin.aspx");
    }

   
}
