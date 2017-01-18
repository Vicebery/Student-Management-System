using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_newsChange : System.Web.UI.Page
{
    //string connectionString = "Data Source=DESKTOP-2SRFSCM\\XIAOKEKE;Initial Catalog=StudentServer;Persist Security Info=True;User ID=xyk;Password=123456";
    //string connectionString = "Data Source=VICEBERY_PC;Initial Catalog=Server;Persist Security Info=True;User ID=sa;Password=12345678";
    string connectionString = SQLHelper.getConnStr();
    SqlConnection connection;
    
    SqlCommand cmd;
    DataSet dataset;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { //让页面只是第一次加载，不然会导致每次点击按钮都会出发Page_Load
            submmit.Attributes.Add("onclick", "javascript:return confirm('确认提交吗？')");
            change.Attributes.Add("onclick", "javascript:return confirm('确认修改吗？')");
            //获取新闻
            string str = "";
            connection = new SqlConnection(connectionString);
            string queryString_Cno = "select display from news";
            //----------------打开连接------------------
            cmd = new SqlCommand(queryString_Cno, connection);
            dataset = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(queryString_Cno, connection);
            adapter.Fill(dataset);
            try
            {
                connection.Open();
            }
            catch
            {
                Response.Write("<script>alert('暂无新闻');</script>");
            }
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {

                str += dr["display"].ToString() + "#";

            }
            dr.Close();
            string[] s = str.Split(new char[] { '#' });
            
                news1.Text = s[0];
                news2.Text = s[1];
                news3.Text = s[2];
                news4.Text = s[3];
                news5.Text = s[4];
                news6.Text = s[5];
                news7.Text = s[6];
                news8.Text = s[7];
            
            
            try
            {
                connection.Close();
            }
            catch
            {
                Response.Write("<script>alert('无法关闭链接');</script>");
            }
        }
    }

    protected void change_Click(object sender, EventArgs e)
    {
        //将textbox设置为可写
        news1.ReadOnly = false;
        news2.ReadOnly = false;
        news3.ReadOnly = false;
        news4.ReadOnly = false;
        news5.ReadOnly = false;
        news6.ReadOnly = false;
        news7.ReadOnly = false;
        news8.ReadOnly = false;
    }

    protected void submmit_Click(object sender, EventArgs e)
    {
        //更新数据库
        connection = new SqlConnection(connectionString);
        connection.Open();
        string queryString_Cno = "update news set display='" + news1.Text + "' where id=1" +
                                   "update news set display = '" + news2.Text + "' where id = 2" +
                                    "update news set display =' " + news3.Text + "' where id = 3" +
             "update news set display =' " + news4.Text + "' where id = 4" +
             "update news set display = '" + news5.Text + "' where id = 5" +
              "update news set display = '" + news6.Text + "' where id =6" +
               "update news set display =' " + news7.Text + "' where id = 7" +
                "update news set display = '" + news8.Text + "' where id = 8";
        //----------------打开连接------------------
        cmd = new SqlCommand(queryString_Cno, connection);
        cmd.ExecuteNonQuery();

        //将textbox设置为可读不可写
        news1.ReadOnly = true;
        news2.ReadOnly = true;
        news3.ReadOnly = true;
        news4.ReadOnly = true;
        news5.ReadOnly = true;
        news6.ReadOnly = true;
        news7.ReadOnly = true;
        news8.ReadOnly = true;
        try
        {
            connection.Close();
        }
        catch
        {
            Response.Write("<script>alert('无法关闭链接');</script>");
        }
    }
}