using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aspx_Teacher_tea_couse : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
    SqlConnection conn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Session["userID"].ToString();
        string sql = "select cname,credit,cnature,ctime,TCdate,TCtime_add,cpicture from view_tea_course where tno='" + id+"'";
        DataSet ds = new DataSet();
        ds = connSql(sql);
        ds.Tables[0].Columns[0].ColumnName = "课程名";
        ds.Tables[0].Columns[1].ColumnName = "学分";
        ds.Tables[0].Columns[2].ColumnName = "课程性质";
        ds.Tables[0].Columns[3].ColumnName = "课时";
        ds.Tables[0].Columns[4].ColumnName = "周次";
        ds.Tables[0].Columns[5].ColumnName = "学期"; 
        ds.Tables[0].Columns.Add("节次", typeof(string));
        ds.Tables[0].Columns.Add("教室", typeof(string));
       // ImageField f = new ImageField();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            string[] tmp = ds.Tables[0].Rows[i][5].ToString().Split('/');
            switch (tmp[0])
            {
                case "1":
                    ds.Tables[0].Rows[i][5] = "周一";
                    break;
                case "2":
                    ds.Tables[0].Rows[i][5] = "周二";
                    break;
                case "3":
                    ds.Tables[0].Rows[i][5] = "周三";
                    break;
                case "4":
                    ds.Tables[0].Rows[i][5] = "周四";
                    break;
                case "5":
                    ds.Tables[0].Rows[i][5] = "周五";
                    break;
            }
          //  f.DataImageUrlField=ds.Tables[0].Rows[i][6].ToString();
            ds.Tables[0].Rows[i]["节次"] = tmp[1];
            ds.Tables[0].Rows[i]["教室"] = tmp[2];
        }
     //   f.HeaderText = "课程图片";
        ds.Tables[0].Columns.Remove("cpicture");
        this.gvTea_course.DataSource = ds;
        this.gvTea_course.DataBind();
        //   this.gvTea_course.Columns.Add(f);
        
    }


    public DataSet connSql(string sql)
    {
        conn = new SqlConnection(str);
        DataSet ds;
        //----------------打开连接------------------
        cmd = new SqlCommand(sql, conn);
        ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter(sql, conn);
        adapter.Fill(ds);
        try
        {
            conn.Open();
        }
        catch
        {
            Response.Write("<script>alert('加载失败！');</script>");
        }
        return ds;
    }
}