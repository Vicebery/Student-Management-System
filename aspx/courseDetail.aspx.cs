using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class courseDetail : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    SqlConnection conn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {      
        string cname = Request.QueryString["page"];
        if (cname==null)
        {
            Response.Redirect("courseList.aspx");
        }
        else
        {
            string sql = "select cname,cnature,credit,ctime,ccollege,cpicture,cdetail from tb_course where cname='" + cname + "'";
            DataSet ds = connSql(sql);
            if (ds.Tables[0].Rows.Count != 0)
            {
                CName.Text = ds.Tables[0].Rows[0][0].ToString();
                courseTitle.Text = ds.Tables[0].Rows[0][0].ToString();
                CType.Text = ds.Tables[0].Rows[0][1].ToString();
                CScore.Text = ds.Tables[0].Rows[0][2].ToString();
                CTime.Text = ds.Tables[0].Rows[0][3].ToString();
                CAcademey.Text = ds.Tables[0].Rows[0][4].ToString();
                img.ImageUrl = ds.Tables[0].Rows[0][5].ToString();
                string[] p = ds.Tables[0].Rows[0][6].ToString().Split('-');
                //courseBody.Text = ds.Tables[0].Rows[0][6].ToString();
                for(int i = 0; i < p.Length; i++)
                {
                    courseBody.Text =courseBody.Text+"　　"+p[i]+"<br />";
                }
            }
            else
                Response.Write("<script>alert('加载失败')</script>");
            conn.Close();
        }
    }


    private DataSet connSql(string sql)
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
            Response.Write("<script>alert('加载------失败！');</script>");
        }
        return ds;
    }


}