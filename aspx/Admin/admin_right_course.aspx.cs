using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_right_course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtbox_search.Attributes.Add("onpropertychange", "myTextChanged()");

            //从数据库搜索数据表
            SqlConnection conn = new SqlConnection();
            //  conn.ConnectionString = "Data Source=lenovo-pc;Initial Catalog=StudentSever;Persist Security Info=True;User ID=sa;Password=maziyi52";
            conn.ConnectionString = SQLHelper.getConnStr();
            conn.Open();
            string strSel = "select  Ccollege,Coid from tb_College";
            SqlCommand selcom = new SqlCommand(strSel, conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = selcom;
            DataSet ds = new DataSet();
            da.Fill(ds, "tb_College");

            //在数据表中加入“全部”这一行
            DataRow dt_first = ds.Tables["tb_College"].NewRow();
            dt_first["Ccollege"] = "全部";
            dt_first["Coid"] = "0";
            ds.Tables["tb_College"].Rows.InsertAt(dt_first, 0);      //插入到第一行

            //将数据表与下拉菜单绑定
            this.ddlist_search.DataSource = ds.Tables["tb_College"].DefaultView;
            this.ddlist_search.DataTextField = "Ccollege";
            this.ddlist_search.DataValueField = "Coid";
            this.ddlist_search.DataBind();
            //        SqlDataSource1.SelectCommand =" SELECT [Cno], [Cname], [Credit], [Cnature], [Ctime], [Ccollege], [Ccreatedate], [Cpicture] FROM [tb_Course] where Cno='16005'";
        }



    }
    protected void btn_add_Click(object sender, EventArgs e)
    {
        Response.Redirect("/aspx/Admin/course_add.aspx");
    }

    protected void GridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btn_cmd_modify")                                                //修改课程
        {
            int LB = Int32.Parse(e.CommandArgument.ToString());
            string course_cno = grdvCourseList.Rows[LB].Cells[1].Text;
            Session["course_cno"] = course_cno;
            Response.Redirect("course_modify.aspx");
        }
    }

    protected void grdvCourseList_RowDataBound(object sender, GridViewRowEventArgs e)             //给删除按钮添加确认对话框
    {  //如果是绑定数据行 
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                ((LinkButton)e.Row.Cells[0].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
            }
        }
    }
    protected void grdvCourseList_RowDeleting(object sender, GridViewDeleteEventArgs e)             //删除课程
    {
        //     string strCon = "server=lenovo-pc;database=StudentSever;user id=sa;pwd=maziyi52";
        string strCon = SQLHelper.getConnStr();
        using (SqlConnection conn = new SqlConnection(strCon))
        {
            string cno = grdvCourseList.DataKeys[e.RowIndex].Value.ToString();
            //       string sql = "delete from tb_Student where Cno='" + grdvCourseList.DataKeys[e.RowIndex].Value.ToString() + "'"; 

            //删除一门课程需要三个表的级联删除
            string sql = "delete from tb_SC where Cno='" + cno + "'" + "delete from tb_TC where Cno='" + cno + "'" +
                "delete from tb_Course where Cno='" + cno + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataSource1.DeleteCommand = sql;
            cmd.ExecuteNonQuery();
            grdvCourseList.DataBind();
        }
    }

    protected void ddlist_search_SelectedIndexChanged(object sender, EventArgs e)                  //点击下拉框变动GridView
    {
        //      SqlDataSource1.SelectCommand="SELECT [Cno], [Cname], [Credit], [Cnature], [Ctime], [Ccollege], [Ccreatedate], [Cpicture] FROM [tb_Course] ";
        string s1 = "SELECT [Cno], [Cname], [Credit], [Cnature], [Ctime], [Ccollege], [Ccreatedate], [Cpicture] FROM [tb_Course]";
        string s2 = "where Ccollege='";
        string s3 = ddlist_search.SelectedItem.ToString();
        string strSel = s1 + s2 + s3 + "'";
        if (ddlist_search.SelectedValue == "0")
        {
            SqlDataSource1.SelectCommand = "SELECT [Cno], [Cname], [Credit], [Cnature], [Ctime], [Ccollege], [Ccreatedate], [Cpicture] FROM [tb_Course] ";
        }
        else
            SqlDataSource1.SelectCommand = strSel;
        //       Response.Write(ddlist_search.SelectedValue);
    }

    protected void btn_search_Click(object sender, EventArgs e)                          //模糊查询
    {
        string Search_msg = txtbox_search.Text;
        string s1 = "SELECT [Cno], [Cname], [Credit], [Cnature], [Ctime], [Ccollege], [Ccreatedate], [Cpicture] FROM [tb_Course]";
        string s2 = "where Cname like '%";
        string Search_select = s1 + s2 + Search_msg + "%'";
        SqlDataSource1.SelectCommand = Search_select;
    }
    protected void txtbox_search_TextChanged(object sender, EventArgs e)
    {
        string Search_msg = txtbox_search.Text;
        string s1 = "SELECT [Cno], [Cname], [Credit], [Cnature], [Ctime], [Ccollege], [Ccreatedate], [Cpicture] FROM [tb_Course]";
        string s2 = "where Cname like '%";
        string Search_select = s1 + s2 + Search_msg + "%'";
        SqlDataSource1.SelectCommand = Search_select;
    }

    protected void grdvCourseList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}