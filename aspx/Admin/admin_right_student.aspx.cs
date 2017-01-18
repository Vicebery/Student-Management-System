using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_right_student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void grdv_ars_MoreInfo(object sender, GridViewCommandEventArgs e)
    //{
    //    Response.Redirect("/aspx/Admin/course_add.aspx");
    //    //onrowediting = "grdv_ars_MoreInfo"
    //    if (e.CommandName == "MoreInfo")
    //    {
    //        Button btn = e.CommandSource as Button;
    //        GridViewRow row = btn.Parent.Parent as GridViewRow;
    //        string stuid = row.Cells[0].ToString();//获得第一个单元格的值   
    //                                               //string b = this.grdv_ars.DataKeys[row.DataItemIndex].Values[0].ToString();//获得DataKeys的值   
    //                                               //Response.Write("<script>alert('用户id为"+stuid+"');</script>");
    //        Response.Redirect("/aspx/Admin/course_add.aspx");
    //    }
    //}

    protected void btn_moreInfo_Click(object sender, EventArgs e)
    {
        //Response.Redirect("/aspx/Admin/course_add.aspx");
        Button btn = sender as Button;
        GridViewRow row = btn.Parent.Parent as GridViewRow;
        ////string stuid = row.Cells[0].ToString();//获得第一个单元格的值 
        int iPageIndex = grdv_ars.PageIndex;   //获取当前页索引，第一页索引为0
        int iPageSize = grdv_ars.PageSize;      //获取每页显示记录数,当前每页为10条记录 
        string stuid = this.grdv_ars.DataKeys[row.DataItemIndex - iPageIndex * iPageSize].Values[0].ToString();//获得学生的学号

        //Response.Write("<script>alert('用户id为" + stuid + "');</script>");//测试代码
        Session["StudentID"] = stuid;
        Response.Redirect("/aspx/Admin/student_info.aspx");
    }

    //protected void grdv_ars_RowUpdating(object sender, GridViewCommandEventArgs e)
    //{
    //    //string id = grdv_ars.DataKeys[e.RowIndex].Values[0].ToString();
    //}
}