using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Student_stu_pwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        psw_old_hint.Text = "";
        psw_sgh_hint.Text = "";
        psw_ack_hint.Text = "";
        btn_submit.Attributes.Add("onclick", "javascript:return confirm('确认修改密码吗？')");
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //判断不合法情况
        if (tbx_pswOld.Text == "")
        {
            psw_old_hint.Text = "原密码不能为空!";
            return;
        }
        if (tbx_pswNew.Text == "")
        {
            psw_sgh_hint.Text = "请输入新密码";
            return;
        }
        if (tbx_pswAck.Text == "")
        {
            psw_ack_hint.Text = "请再次输入新密码";
            return;
        }
        if (tbx_pswNew.Text != tbx_pswAck.Text)
        {
            psw_ack_hint.Text = "两次密码不一致";
            return;
        }

        string newPwd = tbx_pswNew.Text;
        string id = Session["userID"].ToString();
        //string id = tbx_pswOld.Text;
        string connectionString = SQLHelper.getConnStr();
        SqlConnection connection = new SqlConnection(connectionString);
        string queryString = "select SLpassword from tb_SLogin where Sno='" + id + "'";

        //----------------打开连接------------------
        SqlCommand cmd = new SqlCommand(queryString, connection);
        string pwd;
        string password_old = tbx_pswOld.Text;
        password_old = MD5.Back_MD5(password_old);
        try
        {

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            pwd = reader.GetString(0);
            //psw_ack_hint.Text = pwd;
            if (!password_old.Equals(pwd))
            {
                psw_old_hint.Text = "原密码错误!";
            }
            else
            {

            }
        }
        catch
        {
            //用户名不存在
            psw_ack_hint.Text = "数据库连接异常";
            //        Response.Write("<script>alert('用户名不存在');</script>");
        }
        finally
        {
            connection.Close();
        }
        newPwd = MD5.Back_MD5(newPwd);
        string updateString = "update tb_SLogin set SLpassword='" + newPwd + "' where Sno='" + id + "'";
        SqlCommand cmd2 = new SqlCommand(updateString, connection);
        connection.Open();
        cmd2.ExecuteNonQuery();//执行更新语句
        connection.Close();
        Response.Write("<script>alert('修改成功!');</script>");
    }
}