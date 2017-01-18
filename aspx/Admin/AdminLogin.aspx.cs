using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        error_pwd.Text = "";
        error_user.Text = "";
        //string temp = MD5.Back_MD5("2016000");
        //error_pwd.Text = temp;
    }
    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        
        //判断管理员账户和密码
        string Manager_name = user_input.Text;
        string Manager_password = pwd_input.Text;
        //md5加密
        Manager_password = MD5.Back_MD5(Manager_password);

        //查询语句字符串
        //string connectionString = " Data Source=lenovo-pc;Initial Catalog=StudentSever;Persist Security Info=True;User ID=sa;Password=maziyi52";
        //conn.ConnectionString = "Data Source=PC-201609131555\\SQLEXPRESS;Initial Catalog=StudentServer;Persist Security Info=True;User ID=admin;Password=admin";
        // string connectionString = "Data Source=VICEBERY_PC;Initial Catalog=Server;Persist Security Info=True;User ID=sa;Password=12345678";

        string connectionString = SQLHelper.getConnStr();
        SqlConnection connection = new SqlConnection(connectionString);
        string queryString_Student = "select ALpassword from tb_AdminLogin where ALno=" + Manager_name;


        //----------------打开连接------------------
        SqlCommand cmd = new SqlCommand(queryString_Student, connection);
        string msg = "";       //提取密码
        bool flag = true;        //标记
        try
        {
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            msg = reader.GetString(0);
        }
        catch
        {
            //用户名不存在
            error_user.Text = "用户名不存在";
            flag = false;
    //        Response.Write("<script>alert('用户名不存在');</script>");

        }


        //密码错误
        if (msg != ""&&flag)
        {
            if (msg != Manager_password)
            {
                error_pwd.Text = "密码错误";
            }
            else
            //保存登录信息，在下个页面显示
            {
                Session["adminID"] = Manager_name;
                //Session["userName"] = ;
                Response.Redirect("admin_right_course.aspx");
                
            }

        }
    }
}