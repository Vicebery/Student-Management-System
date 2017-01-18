using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Teacher_tea_main : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    SqlConnection conn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Session["userID"].ToString();
        string sql = "select tname from tb_Teacher where Tno='" + id + "'";
        DataSet ds = new DataSet();
        ds = connSql(sql);
        tea_name.Text = ds.Tables[0].Rows[0][0].ToString();
        
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