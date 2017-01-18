using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_noticeChange : System.Web.UI.Page
{
    //string connectionString = "Data Source=DESKTOP-2SRFSCM\\XIAOKEKE;Initial Catalog=StudentServer;Persist Security Info=True;User ID=xyk;Password=123456";
    //string connectionString = "Data Source=VICEBERY_PC;Initial Catalog=Server;Persist Security Info=True;User ID=sa;Password=12345678";
    //SqlConnection connection;// = new SqlConnection(connectionString);

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
            string queryString_Cno = "select display from notice";
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
        }
    }


    protected void submmit_Click(object sender, EventArgs e)
    {
        //更新数据库
        connection = new SqlConnection(connectionString);
        connection.Open();
        string queryString_Cno = "update notice set display='" + notice1.Text + "' where id=1" +
                                   "update notice set display = '" + notice2.Text + "' where id = 2" +
                                    "update notice set display =' " + notice3.Text + "' where id = 3" +
             "update notice set display =' " + notice4.Text + "' where id = 4" +
             "update notice set display = '" + notice5.Text + "' where id = 5" +
              "update notice set display = '" + notice6.Text + "' where id =6" +
               "update notice set display =' " + notice7.Text + "' where id = 7" +
                "update notice set display = '" + notice8.Text + "' where id = 8";
        //----------------打开连接------------------
        cmd = new SqlCommand(queryString_Cno, connection);
        cmd.ExecuteNonQuery();

        //将textbox设置为可读不可写
        notice1.ReadOnly = true;
        notice2.ReadOnly = true;
        notice3.ReadOnly = true;
        notice4.ReadOnly = true;
        notice5.ReadOnly = true;
        notice6.ReadOnly = true;
        notice7.ReadOnly = true;
        notice8.ReadOnly = true;
        try
        {
            connection.Close();
        }
        catch
        {
            Response.Write("<script>alert('无法关闭链接');</script>");
        }
    }

    protected void change_Click(object sender, EventArgs e)
    {
        //将textbox设置为可写
        notice1.ReadOnly = false;
        notice2.ReadOnly = false;
        notice3.ReadOnly = false;
        notice4.ReadOnly = false;
        notice5.ReadOnly = false;
        notice6.ReadOnly = false;
        notice7.ReadOnly = false;
        notice8.ReadOnly = false;
    }
}