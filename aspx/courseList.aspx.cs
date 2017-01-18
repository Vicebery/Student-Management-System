using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class courseList : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    SqlConnection conn;
    SqlCommand cmd;

    //页面加载
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCourseList("select cname,cnature,ccollege,cpicture from tb_course");
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
        pds.PageSize = 50;
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
        if (ddlSearch.SelectedIndex==0)
        {
            sql = "select cname,cnature,ccollege,cpicture from tb_course";
        }
        else sql = "select cname,cnature,ccollege,cpicture from tb_course where ccollege='"
                + ddlSearch.SelectedItem.ToString() + "'";
        txtSearchCourse.Text = null;
        BindCourseList(sql);
    }

    //模糊查询，搜索匹配
    protected void txtSearchCourse_TextChanged(object sender, EventArgs e)
    {
        string stmp = txtSearchCourse.Text;
        string sql="select cname,cnature,ccollege,cpicture from tb_course where cname like '%" + stmp + "%'";
        if (ddlSearch.SelectedIndex!=0)
            sql = sql+" and ccollege='"+ddlSearch.Text+"'";
        BindCourseList(sql);
    }


    //protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Footer)
    //    {
    //        DropDownList ddlp = (DropDownList)e.Item.FindControl("ddlp");

    //        HyperLink lpfirst = (HyperLink)e.Item.FindControl("hlfir");
    //        HyperLink lpprev = (HyperLink)e.Item.FindControl("hlp");
    //        HyperLink lpnext = (HyperLink)e.Item.FindControl("hln");
    //        HyperLink lplast = (HyperLink)e.Item.FindControl("hlla");

    //        pds().CurrentPageIndex = ddlp.SelectedIndex;

    //        int n = Convert.ToInt32(pds().PageCount);//n为分页数  
    //        int i = Convert.ToInt32(pds().CurrentPageIndex);//i为当前页  

    //        Label lblpc = (Label)e.Item.FindControl("lblpc");
    //        lblpc.Text = n.ToString();
    //        Label lblp = (Label)e.Item.FindControl("lblp");
    //        lblp.Text = Convert.ToString(pds().CurrentPageIndex + 1);

    //        if (!IsPostBack)
    //        {
    //            for (int j = 0; j < n; j++)
    //            {
    //                ddlp.Items.Add(Convert.ToString(j + 1));
    //            }
    //        }

    //        if (i <= 0)
    //        {
    //            lpfirst.Enabled = false;
    //            lpprev.Enabled = false;
    //            lplast.Enabled = true;
    //            lpnext.Enabled = true;
    //        }
    //        else
    //        {
    //            lpprev.NavigateUrl = "?page=" + (i - 1);
    //        }
    //        if (i >= n - 1)
    //        {
    //            lpfirst.Enabled = true;
    //            lplast.Enabled = false;
    //            lpnext.Enabled = false;
    //            lpprev.Enabled = true;
    //        }
    //        else
    //        {
    //            lpnext.NavigateUrl = "?page=" + (i + 1);
    //        }

    //        lpfirst.NavigateUrl = "?page=0";//向本页传递参数page  
    //        lplast.NavigateUrl = "?page=" + (n - 1);

    //        ddlp.SelectedIndex = Convert.ToInt32(pds().CurrentPageIndex);//更新下拉列表框中的当前选中页序号  
    //    }

    //}

    protected void ddlp_SelectedIndexChanged(object sender, EventArgs e)
    {//脚模板中的下拉列表框更改时激发  
        string pg = Convert.ToString((Convert.ToInt32(((DropDownList)sender).SelectedValue) - 1));//获取列表框当前选中项  
        Response.Redirect("repeate.aspx?page=" + pg);//页面转向  
    }
}