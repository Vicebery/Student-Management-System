using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_assignCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Session["TeacherID"].ToString();
            string connectionString = SQLHelper.getConnStr();
            SqlConnection connection = new SqlConnection(connectionString);
            string queryString_Student = "select Tname,Coid,Ccollege from tb_Teacher where Tno='" + id + "'";

            //----------------打开连接------------------
            SqlCommand cmd = new SqlCommand(queryString_Student, connection);
            string name;
            //获取该老师所在学院，便于筛选出他所在学院开的课
            string coid;
            string college;

            try
            {
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                name = reader.GetString(0);
                coid = reader.GetString(1);
                college = reader.GetString(2);
                btn_back2.Text = name;
                lbl_id.Text = id;
                lbl_name.Text = name;
                //将所属学院信息保存在窗体，但不可见，供下拉框调用查询
                lbl_coid.Text = coid;
                //error_msg.Text = "sssssssss";
            }
            catch
            {
                //用户名不存在
                btn_back2.Text = "教师信息异常";
                //        Response.Write("<script>alert('用户名不存在');</script>");
            }
            finally
            {
                connection.Close();
            }
            btn_submit.Attributes.Add("onclick", "javascript:return confirm('确认添加排课信息吗？')");
        }
    }


    protected void btn_back1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/aspx/Admin/teacher_course.aspx");
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {

        //Response.Write("<script>alert('用户名不存在');</script>");
        DBerror_info.Text = "";
        //判断不合法情况
        if (week1.SelectedIndex >= week2.SelectedIndex || rbList_week.SelectedValue.Equals(""))
        {
            error_msg2.Text = "选择周次不合法！";
        }
        else error_msg2.Text = "";
        if (tbox_add.Text.Equals(""))
        {
            error_add.Text = "上课地点不能为空！";
        }
        else error_add.Text = "";

        if (error_msg2.Text != "" || error_add.Text != "")
            return;
        //插入TC表信息项
        string Tno = lbl_id.Text;
        string Tname = lbl_name.Text;
        string Cno = ddlist_Cno.SelectedValue;
        string Cname = ddlist_Cno.SelectedItem.ToString();
        string TCtime_add = (ddlist_week.SelectedIndex+1).ToString()+"/" + ddlist_jie.SelectedValue+"/" + tbox_add.Text;
        string TCdate = week1.Text + "-" + week2.Text + "/" + rbList_week.SelectedValue;

        //提示弹框
        //string strMsg = "确认添加？";
        //Response.Write("<Script Language='JavaScript'>window.confirm('" + strMsg + "') </script>");
        //Response.Write("<script>alert(\"确定添加？\")</script>");
        //Response.Write("javascript:if(confirm('确实要删除吗?'))");//测试代码

        //string connectionString = SQLHelper.getConnStr();
        //SqlConnection connection = new SqlConnection(connectionString);
        //插入数据库
        //string insertString = "insert into tb_TC(Tno, Tname, Cno, Cname, TCdate, TCtime_add) values('" + Tno + "', '" + Tname + "', '" + Cno + "', '" + Cname + "', '" + TCdate + "', '" + TCtime_add + "');";
        ////----------------打开连接------------------

        //SqlCommand cmd = new SqlCommand(insertString, connection);
        //connection.Open();

        string connectionString = SQLHelper.getConnStr();
        SqlConnection connection = new SqlConnection(connectionString);
        string insertString = "insert into tb_TC(Tno, Tname, Cno, Cname, TCdate, TCtime_add) values('" + Tno + "', '" + Tname + "', '" + Cno + "', '" + Cname + "', '" + TCdate + "', '" + TCtime_add + "');";

        //----------------打开连接------------------
        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand(insertString, connection);
            cmd.ExecuteNonQuery();//执行插入语句
        }
        catch
        {
            //插入重复键，数据库异常
            DBerror_info.Text = "已存在该条记录！";
            //Response.Write("<script>alert('已存在该条记录！');</script>");
        }
        finally
        {
            connection.Close();
        }
        //测试数据     K.O
        btn_back2.Text = Tno + Tname + Cno + Cname + TCtime_add + TCdate;
    }

}