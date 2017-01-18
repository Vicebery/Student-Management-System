using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Student_stu_choiceCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Sno"] = "2014221119200005";
        Session["Sname"] = "李逵";
        string Sno = Session["Sno"].ToString();
        SqlDataSource1.SelectCommand = "SELECT tb_TC.Cno, tb_TC.Cname , [Credit], [Cnature], [Ctime],Tno,Tname FROM tb_Course,tb_TC where tb_Course.Cno=tb_TC.Cno and tb_Course.Cno not in" +
            "(select Cno from tb_SC where Sno=" + Sno + ")";
    }
    protected void btn_Submit_Click(object sender, EventArgs e)                       //-----------选课--------------
    {
        string[] cno_array = new string[gv_nochoose.Rows.Count];       //建立字符串数组来保存选中的课程号
        string[] cname_array = new string[gv_nochoose.Rows.Count];       //课程名
        string[] tno_array = new string[gv_nochoose.Rows.Count];       //任课教师号
        int k = 0;
        for (int i = 0; i < this.gv_nochoose.Rows.Count; i++)
        {
            CheckBox ckb = (CheckBox)this.gv_nochoose.Rows[i].Cells[6].FindControl("CheckBox1");
            if (ckb.Checked)
            {
                //   huohao = Convert.ToInt32(this.GridView1.Rows[i].Cells[2].Text);
                cno_array[k] = this.gv_nochoose.Rows[i].Cells[0].Text;                  //课程号
                cname_array[k] = this.gv_nochoose.Rows[i].Cells[1].Text;               //课程名
                tno_array[k] = this.gv_nochoose.Rows[i].Cells[7].Text;                  //教师号
                k++;
            }
        }

        for (int i = 0; i < cno_array.Length; i++)
        {
            //每条选课记录需修改学生选课表
            string sno = Session["Sno"].ToString();                       //学生学号
            string sname = Session["Sname"].ToString();        //学生姓名
            string cno = cno_array[i];                        // 课程号
            string cname = cname_array[i];                    //课程名
            string tno = tno_array[i];                        //教师号


            //向数据库中插入数据
            string connectionString = SQLHelper.getConnStr();
            SqlConnection connection = new SqlConnection(connectionString);

            string queryString_Student = "insert into tb_SC (Sno,Sname,Cno,Cname,Tno) values ('" + sno + "', '" + sname + "', '" + cno + "', '" + cname + "','" + tno + "') ";
            //打开连接
            SqlCommand cmd = new SqlCommand(queryString_Student, connection);
            connection.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {


            }
            gv_nochoose.DataSourceID = null;
            gv_nochoose.DataSource = SqlDataSource1;
            gv_nochoose.DataBind();
            gv_choiced.DataSourceID = null;
            gv_choiced.DataSource = SqlDataSource2;
            gv_choiced.DataBind();

            connection.Close();

            //      Response.Write(cno);         
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btn_back_Click(object sender, EventArgs e)                        //------------退课---------------
    {
        string[] cno_array = new string[gv_choiced.Rows.Count];       //建立字符串数组来保存选中的课程号
        //string[] cname_array = new string[GridView2.Rows.Count];       //课程名
        string[] tno_array = new string[gv_choiced.Rows.Count];       //任课教师号
        int k = 0;
        for (int i = 0; i < this.gv_choiced.Rows.Count; i++)
        {
            CheckBox ckb = (CheckBox)this.gv_choiced.Rows[i].Cells[6].FindControl("CheckBox1");
            if (ckb.Checked)
            {
                //   huohao = Convert.ToInt32(this.GridView1.Rows[i].Cells[2].Text);
                cno_array[k] = this.gv_choiced.Rows[i].Cells[0].Text;                  //课程号
                //cname_array[k] = this.GridView1.Rows[i].Cells[1].Text;               //课程名
                tno_array[k] = this.gv_choiced.Rows[i].Cells[7].Text;                  //教师号
                k++;
            }
        }

        for (int i = 0; i < cno_array.Length; i++)
        {
            //每条选课记录需修改学生选课表
            string sno = Session["Sno"].ToString();                       //学生学号
            //string sname = Session["Sname"].ToString();        //学生姓名
            string cno = cno_array[i];                        // 课程号
            //string cname = cname_array[i];                    //课程名
            string tno = tno_array[i];                        //教师号


            //          Response.Write(cno + cname + tno);
            //向数据库中插入数据
            string connectionString = SQLHelper.getConnStr();
            SqlConnection connection = new SqlConnection(connectionString);

            string queryString_Student = "delete from tb_SC where Sno='" + sno + "' and Cno='" + cno + "' and Tno='" + tno + "'";
            //string queryString_Student = "insert into tb_SC (Sno,Sname,Cno,Cname,Tno) values ('" + sno + "', '" + sname + "', '" + cno + "', '" + cname + "','" + tno + "') ";
            //打开连接
            SqlCommand cmd = new SqlCommand(queryString_Student, connection);
            connection.Open();

            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {


            }
            gv_nochoose.DataSourceID = null;
            gv_nochoose.DataSource = SqlDataSource1;
            gv_nochoose.DataBind();
            gv_choiced.DataSourceID = null;
            gv_choiced.DataSource = SqlDataSource2;
            gv_choiced.DataBind();

            connection.Close();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv_nochoose.PageIndex = e.NewPageIndex;
        gv_nochoose.DataBind();
    }
}