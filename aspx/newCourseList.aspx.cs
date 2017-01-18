using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newCourseList : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    SqlConnection conn;
    SqlCommand cmd;

    //页面加载
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCourseList("select cname,cnature,ccollege,cpicture from view_newCourse");
            string sqlCollege = "select distinct ccollege from tb_course";
            DataSet dsCollege;
            dsCollege = connSql(sqlCollege);
            ddlSearch.Items.Add("--全部--");
            for (int i = 1; i <= dsCollege.Tables[0].Rows.Count; i++)
            {
                ddlSearch.Items.Add(dsCollege.Tables[0].Rows[i - 1][0].ToString());
            }
            conn.Close();
        }
    }

    //根据查询字符串更新课程列表
    private void BindCourseList(string sql)
    {
        //DataSet ds = connSql(sql);
        //PagedDataSource pds = new PagedDataSource();
        //pds.DataSource = ds.Tables[0].DefaultView;
        //pds.AllowPaging = true;
        //pds.PageSize = 12;
        //pds.CurrentPageIndex = Convert.ToInt32(Request.QueryString["page"]);
        PagedDataSource pds1 = new PagedDataSource();
        pds1 = pds(sql);
        this.repCourseList.DataSource = pds1;
        this.repCourseList.DataBind();
    }

    private PagedDataSource pds(string sql)
    {
        DataSet ds = connSql(sql);
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = ds.Tables[0].DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 40;
        pds.CurrentPageIndex = Convert.ToInt32(Request.QueryString["page"]);
        return pds;
    }

    //连接数据库
    public DataSet connSql(string sql)
    {
        conn = new SqlConnection(str);
        DataSet ds;
        //----------------打开连接------------------
        cmd = new SqlCommand(sql, conn);
        ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter(sql, conn);
        adapter.Fill(ds);
        try
        {
            conn.Open();
        }
        catch
        {
            Response.Write("<script>alert('加载失败！');</script>");
        }
        return ds;
    }

    //选择学院触发事件
    protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql = "";
        if (ddlSearch.SelectedIndex == 0)
        {
            sql = "select cname,cnature,ccollege,cpicture from view_newCourse";
        }
        else sql = "select cname,cnature,ccollege,cpicture from view_newCourse where ccollege='"
                + ddlSearch.SelectedItem.ToString() + "'";
        txtSearchCourse.Text = null;
        BindCourseList(sql);
    }

    //模糊查询，搜索匹配
    protected void txtSearchCourse_TextChanged(object sender, EventArgs e)
    {
        string stmp = txtSearchCourse.Text;
        string sql = "select cname,cnature,ccollege,cpicture from view_newCourse where cname like '%" + stmp + "%'";
        if (ddlSearch.SelectedIndex != 0)
            sql = sql + " and ccollege='" + ddlSearch.Text + "'";
        BindCourseList(sql);
    }

    protected void ddlp_SelectedIndexChanged(object sender, EventArgs e)
    {//脚模板中的下拉列表框更改时激发  
        string pg = Convert.ToString((Convert.ToInt32(((DropDownList)sender).SelectedValue) - 1));//获取列表框当前选中项  
        Response.Redirect("repeate.aspx?page=" + pg);//页面转向  
    }
}