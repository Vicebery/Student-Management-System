using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_student_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string stuid = Session["StudentID"].ToString();
        tbox_id.Text = stuid;

        //string connectionString = "Data Source=PC-201609131555\\SQLEXPRESS;Initial Catalog=StudentServer;Persist Security Info=True;User ID=admin;Password=admin";
        //string connectionString = "Data Source=VICEBERY_PC;Initial Catalog=Server;Persist Security Info=True;User ID=sa;Password=12345678";
        //SqlConnection connection;// = new SqlConnection(connectionString);

        string connectionString = SQLHelper.getConnStr();
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand cmd;
        DataSet dataset;

        //创建连接
        connection = new SqlConnection(connectionString);
        //查询学号为stuid 的学生的所有信息
        string queryString = "select * from tb_Student where Sno="+stuid;
        //----------------打开连接------------------
        cmd = new SqlCommand(queryString, connection);
        dataset = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter(queryString, connection);
        adapter.Fill(dataset);

        //获取该学生的各项信息
        string name = dataset.Tables[0].Rows[0][1].ToString();
        string sex = dataset.Tables[0].Rows[0][2].ToString();
        string birthday = dataset.Tables[0].Rows[0][3].ToString();
        string native = dataset.Tables[0].Rows[0][4].ToString();
        string entranceTime = dataset.Tables[0].Rows[0][5].ToString();
        string politicalFace = dataset.Tables[0].Rows[0][6].ToString();
        string address = dataset.Tables[0].Rows[0][7].ToString();
        string idNum = dataset.Tables[0].Rows[0][8].ToString();
        string tel = dataset.Tables[0].Rows[0][9].ToString();
        string email = dataset.Tables[0].Rows[0][10].ToString();
        string nation = dataset.Tables[0].Rows[0][11].ToString();
        string picture = dataset.Tables[0].Rows[0][12].ToString();
        string note = dataset.Tables[0].Rows[0][13].ToString();

        //将获取的值显示在前台页面
        //头部返回菜单
        btn_back2.Text = name;
        //教师信息
        tbox_name.Text = name;
        tblist_sex.Text = sex;
        tbox_birthday.Text = birthday;
        tbox_politicalface.Text = politicalFace;
        tbox_nation.Text = nation;
        //加载图片地址
        //imgStu.u
        tbox_native.Text = native;
        tbox_entrancedate.Text = entranceTime;
        tbox_address.Text = address;
        tbox_idnum.Text = idNum;
        tbox_phone.Text = tel;
        tbox_email.Text = email;
        tbox_note.Text = note;
    }

    protected void btn_back1_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_right_student.aspx");
    }
}