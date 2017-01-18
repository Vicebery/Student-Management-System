using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Admin_course_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSubmit.Attributes.Add("onclick", "javascript:return confirm('你确认要增加该门课程吗?')");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        #region//-------------------------检验错误------------------------------------

        //------------------输入框都不能为空----------------------
        if (tbxCname.Text == "" || tbxCclass.Text == "" || tbxCscore.Text == "")
        {
            lbl_errormsg.Text = "输入信息不能为空";
            return;
        }

        ////-------------------开课周次---------------------------
        //int timeFront = Int32.Parse(txb_Time1.Text);
        //int timeBack = Int32.Parse(txb_Time2.Text);
        //if (timeFront >= timeBack)
        //{
        //    lbl_errormsg.Text = "开课周次有误";
        //    return;
        //}

        //------------------课程学分----------------------
        double temp = 0.0;
        if (Double.TryParse(tbxCscore.Text, out temp) == false)
        {
            lbl_errormsg.Text = "学分只能为整数或小数";
            return;
        }

        //-----------------图片-----------------------------
        if (imgCpicture.ImageUrl == null)
        {
            lbl_errormsg.Text = "请提交图片";
            return;
        }
        #endregion


        #region        //-------------------------传出信息------------------------------------

        String course_name = tbxCname.Text;      //课程名
        double course_score = double.Parse(tbxCscore.Text);   //课程学分
        int course_class = Int32.Parse(tbxCclass.Text);   //课程学时
        String course_type = ddlCtype.SelectedItem.Text;   //课程类型
        String course_academy = ddlCacademy.SelectedItem.Text;   //所属学院
        String course_academy_no = ddlCacademy.SelectedItem.Value;    //所属学院id
        //int time1 = Int32.Parse(txb_Time1.Text);     //开课起始时间
        //int time2 = Int32.Parse(txb_Time2.Text);     //开课结束时间
        String pic_url = this.imgCpicture.ImageUrl;     //获取图片相对路径
        #endregion

        #region     //---------------------------传入数据库------------------------------
        //建立连接字符串
        string connectionString = SQLHelper.getConnStr();
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString_Student = "select top 1 Cno from tb_Course order by Cno desc";
        //打开连接
        SqlCommand cmd = new SqlCommand(queryString_Student, connection);
        connection.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        string course_cno = reader.GetString(0);                  //获取课程号
        int int_cno = Int32.Parse(course_cno) + 1;
        course_cno = int_cno.ToString();                      //课程号加1
        //关闭连接
        connection.Close();

        //获取当前时间
        //  string createdate = DateTime.Now.ToShortDateString().ToString();    // 年-月-日
        string createdate = DateTime.Now.ToString("yyyy-MM-dd");

        //插入数据
        queryString_Student = "insert into tb_Course (Cno,Cname,Credit,Cnature,Ctime,Coid,Ccollege,Ccreatedate,Cpicture) values ('"
            + course_cno + "', '" + course_name + "', '" + course_score + "', '"
            + course_type + "','" + course_class + "','" + course_academy_no + "','" + course_academy + "','" + createdate + "','" + pic_url + "') ";
        SqlCommand cmd_insert = new SqlCommand(queryString_Student, connection);
        connection.Open();
        //try
        //{
        //    cmd_insert.ExecuteNonQuery();                //执行插入语句
        //}
        //catch (Exception)
        //{

        //}
        cmd_insert.ExecuteNonQuery();                //执行插入语句
        Response.Redirect("/aspx/Admin/admin_right_course.aspx");
        //    Response.Write(course_cno+course_name+course_score+course_type+course_class+course_academy_no+course_academy+createdate+pic_url);
        #endregion
    }
    protected void btn_load_Click(object sender, EventArgs e)
    {
        if (FileUpload1.FileName == "")
        {
            this.lbl_picturemsg.Text = "上传文件不能为空";
            return;
        }

        bool fileIsValid = false;
        //如果确认了上传文件，则判断文件类型是否符合要求
        if (this.FileUpload1.HasFile)
        {
            //获取上传文件的后缀
            String fileExtension = System.IO.Path.GetExtension(this.FileUpload1.FileName).ToLower();
            String[] restrictExtension = { ".gif", ".jpg", ".bmp", ".png" };
            //判断文件类型是否符合要求
            for (int i = 0; i < restrictExtension.Length; i++)
            {
                if (fileExtension == restrictExtension[i])
                {
                    fileIsValid = true;
                }
                //如果文件类型符合要求,调用SaveAs方法实现上传,并显示相关信息
                if (fileIsValid == true)
                {
                    //上传文件是否大于10M
                    if (FileUpload1.PostedFile.ContentLength > (10 * 1024 * 1024))
                    {
                        this.lbl_picturemsg.Text = "上传文件过大";
                        return;
                    }
                    try
                    {

                        string fileType = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf("."));
                        string path = Server.MapPath("/images/courses/") + FileUpload1.FileName;
                        FileUpload1.SaveAs(path);
                        this.imgCpicture.ImageUrl = "/images/courses/" + FileUpload1.FileName;
                        this.lbl_picturemsg.Text = "文件上传成功!";
                    }
                    catch
                    {
                        this.lbl_picturemsg.Text = "文件上传失败！";
                    }
                    finally
                    {

                    }
                }
                else
                {
                    this.lbl_picturemsg.Text = "只能够上传后缀为.gif,.jpg,.bmp,.png的文件";
                }
            }
        }
    }

    protected void btn_back1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/aspx/Admin/admin_right_course.aspx");
    }
}