using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Teacher_tea_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //---------------------教 师 登 录------------------------
    protected void btn_Submit_Tea_Click(object sender, EventArgs e)
    {
        //判断账号和密码是否匹配
        string username = loginId_tea.Text;
        string password = pwd_tea.Text;
        //md5加密
        password = MD5.Back_MD5(password);
        //查询语句字符串

        string connectionString = SQLHelper.getConnStr();
        SqlConnection connection = new SqlConnection(connectionString);
        string queryString_Teacher = "select TLpassword from tb_TLogin where Tno=" + username;


        //----------------打开连接------------------
        SqlCommand cmd = new SqlCommand(queryString_Teacher, connection);
        string msg = "";       //提取密码
        try
        {
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            msg = reader.GetString(0);
           
        }
        catch
        {
            Response.Write("<script>alert('用户名不存在');</script>");
        }


        //密码错误
        if (msg != "")
        {
            if (msg != password)
            {
                Response.Write("<script>alert('密码错误');</script>");
            }
            else
            //保存登录信息，在下个页面显示
            {
                Session["userID"] = username;
                //Session["userName"] = ;
                Response.Redirect("/aspx/Teacher/tea_main.aspx");
            }

        }
    }
}