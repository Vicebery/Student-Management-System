using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class aspx_Teacher_Teacher : System.Web.UI.Page
{



    
    //gridview的表头会随着行数的增加而改变，这个需要解决
    //还有就是gridview的布局有问题，很乱，需要改


        //老师登录后，获取老师的ID，根据ID获得老师所教的课程，放进DropDownList中，此时教师可以设置平时成绩和期末成绩所占的比例，这个随时都可以设置，每次设置都会更新成绩
        //根据课程，获取选择该门课程的学生的信息。包括学号，姓名，平时成绩，期末成绩，总成绩
        //点击提交，将录入的成绩信息更新到数据库中，点击修改才能对成绩信息进行修改。否则，所有信息只能read。


    Double exam;//记录期末成绩所占的比例
    Double normal;//记录平时成绩所占的比例
    string Student_Grade1 = "";//记录平时成绩
    string Student_Grade2 = "";//记录期末成绩
    string Student_Grade = "";//记录总成绩
    string course_name = "";//获取Dropdownlist选择的值
    string Teacher_name = "11111";//获取教师名字
    string judge="";
    SqlConnection sqlcon;
    SqlCommand sqlcom;
    string strCon = SQLHelper.getConnStr();
    
           
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            //获取教师ID
            submit.Attributes.Add("onclick", "javascript:return confirm('确认提交吗？')");
            change.Attributes.Add("onclick", "javascript:return confirm('确认修改吗？')");
           Save_grade.Attributes.Add("onclick", "javascript:return confirm('确认保存吗？')");
            string id = Session["userID"].ToString();
            //判断是否可以登分
            
            string queryString = "select isOpen from tb_Limit where id='12345'";
            sqlcon = new SqlConnection(strCon);
            SqlCommand sqlcom = new SqlCommand(queryString, sqlcon);
            sqlcon.Open();
            sql(queryString);
           
            SqlDataReader dr1 = sqlcom.ExecuteReader();
            if (dr1.Read())
            {
                judge= dr1["isOpen"].ToString();
            }
            if (judge.Equals("否")) {
                submit.Visible = false;
                change.Visible = false;
                Save_grade.Visible = false;
                foreach (GridViewRow gvr in this.StudentGridView.Rows)
                {
                    ((TextBox)(gvr.Cells[3].Controls[0])).ReadOnly = true;
                    ((TextBox)(gvr.Cells[4].Controls[0])).ReadOnly = true;
                }
            }

            //获取教师名字
            string sqlstr = "select  Tname from tb_TLogin where Tno= '" + id + "'";
            sqlcon = new SqlConnection(strCon);
            SqlCommand sqlcom1 = new SqlCommand(sqlstr, sqlcon);
            sqlcon.Open();
            SqlDataReader dr = sqlcom1.ExecuteReader();
            if (dr.Read())
            {
                Teacher_name = dr[0].ToString();
            }

           
            binddrop();
            bindStudentGridView(select_course.SelectedValue);
            initGrade();
            grade();


        }

    }
    private DataSet getdata()
    {
        DataSet ds = new DataSet();
     string sqlstr1 = "select Cname from tb_TC where Tname='" + Teacher_name + "'";
      
        sqlcon = new SqlConnection(strCon);
        SqlCommand sqlcom1 = new SqlCommand(sqlstr1, sqlcon);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = sqlcom1;
        sqlcon.Open();
        da.Fill(ds);
        return ds;
    }
    private void sql(string sqlstr) {
        sqlcon = new SqlConnection(strCon);
        SqlCommand sqlcom = new SqlCommand(sqlstr, sqlcon);
        sqlcon.Open();
    }
    private void binddrop() {
        this.select_course.DataSource = getdata();
        this.select_course.DataTextField = "Cname";
        this.select_course.DataValueField = "Cname";
        this.select_course.DataBind();
    }

    private DataSet getStudentData(string name) {
        string s1=Session["userID"].ToString();
        DataSet ds = new DataSet();
        string sqlstr1 = "select Sno,Sname from tb_SC  where  Cname='" + name + "' and Tno='"+s1+"'";
        
        sqlcon = new SqlConnection(strCon);
        SqlCommand sqlcom1 = new SqlCommand(sqlstr1, sqlcon);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = sqlcom1;
        
        sqlcon.Open();
        
        da.Fill(ds,"tb_SC");
        return ds;

    }
    private void bindStudentGridView(string name ) {
  
        StudentGridView.DataSource = getStudentData(name);
        StudentGridView.DataKeyNames = new string[] { "Sno" };//主键
        StudentGridView.DataBind();
        sqlcon.Close();
    }
    protected void select_course_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        bindStudentGridView(select_course.SelectedValue);
        initGrade();
        grade();
        submit_grade();
    }

    //protected void StudentGridView_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    StudentGridView.EditIndex = e.NewEditIndex;
    //    bindStudentGridView(select_course.SelectedValue);
    //}
    
   
    ////取消
    //protected void StudentGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    StudentGridView.EditIndex = -1;
    //    bindStudentGridView(select_course.SelectedValue);
    //}

//对学生按顺序编号
    protected void StudentGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowIndex != -1)
        {
            int id = e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = id.ToString();
        }
    }

    //加载成绩
    protected void initGrade() {
        string s1 = Session["userID"].ToString();
        //string s1=StudentGridView.DataKeyNames[1];
        string sqlstr = "select  Grade1,Grade2,Grade from tb_SC where Tno= '" + s1 + "' and Cname='"+ select_course.SelectedValue+ "'";
        sqlcon = new SqlConnection(strCon);
        SqlCommand sqlcom = new SqlCommand(sqlstr, sqlcon);
        sqlcon.Open();
        SqlDataReader dr = sqlcom.ExecuteReader();
        while (dr.Read())
        {
            Student_Grade1+= dr["Grade1"].ToString()+"#";
            Student_Grade2+= dr["Grade2"].ToString() + "#";
            Student_Grade += dr["Grade"].ToString() + "#";
        }
        string[] grade1 = Student_Grade1.Split(new char[] { '#' });
        string[] grade2 = Student_Grade2.Split(new char[] { '#' });
        string[] grade = Student_Grade.Split(new char[] { '#' });
        int i = 0;
        foreach (GridViewRow gvr in this.StudentGridView.Rows)
        {

            
           ((TextBox)(gvr.Cells[3].Controls[0])).Text=grade1[i];
            ((TextBox)(gvr.Cells[4].Controls[0])).Text = grade2[i];
            ((Label)(gvr.Cells[5].Controls[0])).Text =grade[i];

            i++;
        }
    }

    //比例一起变化，和为100%
    protected void normal_grade_SelectedIndexChanged(object sender, EventArgs e)
    {
        exam_grade.SelectedIndex=10-normal_grade.SelectedIndex;
        grade();
        submit_grade();

    }
    protected void exam_grade_SelectedIndexChanged(object sender, EventArgs e)
    {
        normal_grade.SelectedIndex = 10 - exam_grade.SelectedIndex;
        grade();
        submit_grade();

    }

  
    //提交修改好的成绩
    protected void submit_Click(object sender, EventArgs e)
    {
        submit_grade();
    }
   //将textbox设置为可写
    protected void change_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in this.StudentGridView.Rows)
        {           
            ((TextBox)(gvr.Cells[3].Controls[0])).ReadOnly = false;
            ((TextBox)(gvr.Cells[4].Controls[0])).ReadOnly = false;           
        }
    }
//当平时成绩发生变化就实时改变总成绩的值
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        grade();
        

    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {
        grade();
        

    }

    //更新总成绩，获取比例，与平时成绩和总成绩进行计算
    private void grade()
    {
        exam = Convert.ToDouble(exam_grade.SelectedValue.ToString());
        normal = Convert.ToDouble(normal_grade.SelectedValue.ToString());
        foreach (GridViewRow gvr in this.StudentGridView.Rows)
        {
            
            string str1 = ((TextBox)(gvr.Cells[3].Controls[0])).Text.ToString();
         
            string str2 = ((TextBox)(gvr.Cells[4].Controls[0])).Text.ToString();
           
            
         
            
         
                Double d1 = Convert.ToDouble(str1);
                Double d2 = Convert.ToDouble(str2);

                ((Label)(gvr.Cells[5].Controls[0])).Text = (d1 * normal / 10 + d2 * exam / 10).ToString();
            

        }
    }
    //提交成绩。将最新成绩更新到数据库
    private void submit_grade()
    {

        string s1 = Session["userID"].ToString();
        foreach (GridViewRow gvr in this.StudentGridView.Rows)
        {
            ((TextBox)(gvr.Cells[3].Controls[0])).ReadOnly = true;
            ((TextBox)(gvr.Cells[4].Controls[0])).ReadOnly = true;
            string str1 = ((TextBox)(gvr.Cells[3].Controls[0])).Text.ToString();
            string str2 = ((TextBox)(gvr.Cells[4].Controls[0])).Text.ToString();
            string str3 = ((Label)(gvr.Cells[5].Controls[0])).Text.ToString();
            string sno = gvr.Cells[1].Text;
            decimal d1 = Convert.ToDecimal(str1);
            decimal d2 = Convert.ToDecimal(str2);
            decimal d3 = Convert.ToDecimal(str3);


            //更新数据库
            sqlcon = new SqlConnection(strCon);
            sqlcon.Open();
            string queryString_Grade = "update tb_SC set Grade1= " + d1 + " where  Sno='" + sno + "' and Tno= '" + s1 + "' and Cname='" + select_course.SelectedValue + "'" +
                                     "update tb_SC set Grade2=" + d2 + " where Sno='" + sno + "' and Tno= '" + s1 + "' and Cname='" + select_course.SelectedValue + "'" +
                                     "update tb_SC set Grade=" + d3 + " where Sno='" + sno + "' and Tno= '" + s1 + "' and Cname='" + select_course.SelectedValue + "'";
            //----------------打开连接------------------
            sqlcom = new SqlCommand(queryString_Grade, sqlcon);
            sqlcom.ExecuteNonQuery();




        }
        try
        {
            sqlcon.Close();
        }
        catch
        {
            Response.Write("<script>alert('发生错误');</script>");
        }
    }



    protected void Save_grade_Click(object sender, EventArgs e)
    {
        submit_grade();
       
    }
}