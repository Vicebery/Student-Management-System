using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_teacher_grade : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_start_Click(object sender, EventArgs e)
    {
        if (btn_start.Text == "开启录分系统")
        {
            lbl_info1.Text = "录分系统已开启！";
            lbl_info2.Text = "请谨慎关闭！";
            btn_start.Text = "关闭录分系统";
            //修改数据库记录
            string connectionString = SQLHelper.getConnStr();
            SqlConnection connection = new SqlConnection(connectionString);
            //修改值
            string updateString_YES = "update tb_Limit set isOpen='是' where id='12345'";

            //----------------打开连接------------------
            SqlCommand cmd = new SqlCommand(updateString_YES, connection);

            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();//执行更新语句
            }
            catch
            {
                //数据库异常
                Response.Write("<script>alert('数据库异常，可能是ID改变！');</script>");
            }
            finally
            {
                connection.Close();
            }
        }else if(btn_start.Text == "关闭录分系统")
        {
            lbl_info1.Text = "此按钮将会开启录分系统，所有授权教师将获得录分权限！";
            lbl_info2.Text = "请谨慎开启！";
            btn_start.Text = "开启录分系统";
            //修改数据库记录
            string connectionString = SQLHelper.getConnStr();
            SqlConnection connection = new SqlConnection(connectionString);
            //修改值
            string updateString_NO = "update tb_Limit set isOpen='否' where id='12345'";

            //----------------打开连接------------------
            SqlCommand cmd = new SqlCommand(updateString_NO, connection);

            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();//执行更新语句
            }
            catch
            {
                //数据库异常
                Response.Write("<script>alert('数据库异常，可能是ID改变！');</script>");
            }
            finally
            {
                connection.Close();
            }
        }
        
    }
}