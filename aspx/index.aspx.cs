using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class index : System.Web.UI.Page
{
    string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    SqlConnection connection;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        //刷新通知
        connection = new SqlConnection(connectionString);
        SqlDataAdapter adapter;      
        string str1 = "";
        string select_dis = "select display from notice";
        //----------------打开连接------------------
        cmd = new SqlCommand(select_dis, connection);
        DataSet dataset = new DataSet();
        adapter = new SqlDataAdapter(select_dis, connection);

        adapter.Fill(dataset);
        try
        {
            connection.Open();
        }
        catch
        {
            Response.Write("<script>alert('暂无通知');</script>");
        }
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            str1 += dr["display"].ToString() + "#";
        }
        dr.Close();
        string[] s = str1.Split(new char[] { '#' });
        notice1.Text = s[0];
        notice2.Text = s[1];
        notice3.Text = s[2];
        notice4.Text = s[3];
        notice5.Text = s[4];
        notice6.Text = s[5];
        notice7.Text = s[6];
        notice8.Text = s[7];
        try
        {
            connection.Close();
        }
        catch
        {
            Response.Write("<script>alert('无法关闭链接');</script>");
        }
        //刷新新闻
        string str2 = "";
        string select_dis_news = "select display from news";
        //----------------打开连接------------------
        cmd = new SqlCommand(select_dis_news, connection);
        dataset = new DataSet();
        adapter = new SqlDataAdapter(select_dis_news, connection);
        adapter.Fill(dataset);
        try
        {
            connection.Open();
        }
        catch
        {
            Response.Write("<script>alert('暂无新闻');</script>");
        }

        SqlDataReader dr1 = cmd.ExecuteReader();
        while (dr1.Read())
        {
            str2 += dr1["display"].ToString() + "#";
        }
        dr1.Close();
        string[] s1 = str2.Split(new char[] { '#' });
        news1.Text = s1[0];
        news2.Text = s1[1];
        news3.Text = s1[2];
        news4.Text = s1[3];
        news5.Text = s1[4];
        news6.Text = s1[5];
        news7.Text = s1[6];
        news8.Text = s1[7];
        try
        {
            connection.Close();
        }
        catch
        {
            Response.Write("<script>alert('无法关闭链接');</script>");
        }

        BindNewCourse("select top 6 cname,cpicture from view_newCourse");
        BindAllCourse("select top 6 cname,cpicture from tb_course");
    }

    private void BindAllCourse(string sql)
    {
        DataSet ds = connSql(sql);
        this.rptAllCourse.DataSource = ds;
        this.rptAllCourse.DataBind();
    }

    private void BindNewCourse(string sql)
    {
        DataSet ds = connSql(sql);
        this.rptNewCourse.DataSource = ds;
        this.rptNewCourse.DataBind();     
    }

    public DataSet connSql(string sql)
    {
        connection = new SqlConnection(connectionString);
        DataSet ds;
        //----------------打开连接------------------
        cmd = new SqlCommand(sql, connection);
        ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
        adapter.Fill(ds);
        try
        {
            connection.Open();
        }
        catch
        {
            Response.Write("<script>alert('加载失败！');</script>");
        }
        return ds;
    }
}