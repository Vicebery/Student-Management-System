using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_teacher_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_assignCourseInfo_Click(object sender, EventArgs e)
    {
        //Response.Redirect("/aspx/Admin/course_add.aspx");
        Button btn = sender as Button;
        GridViewRow row = btn.Parent.Parent as GridViewRow;
        ////string stuid = row.Cells[0].ToString();//获得第一个单元格的值 
        int iPageIndex = grdv_tc.PageIndex;   //获取当前页索引，第一页索引为0
        int iPageSize = grdv_tc.PageSize;      //获取每页显示记录数,当前每页为10条记录 
        string teaid = this.grdv_tc.DataKeys[row.DataItemIndex - iPageIndex * iPageSize].Values[0].ToString();//获得学生的学号

        //Response.Write("<script>alert('用户id为" + stuid + "');</script>");//测试代码
        Session["TeacherID"] = teaid;

        Response.Redirect("/aspx/Admin/assignCourse.aspx");
    }
}