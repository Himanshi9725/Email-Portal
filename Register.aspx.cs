using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter ad;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        con = new SqlConnection(path);
        con.Open();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string s = "select * from User_Data where Email='" + TextBox2.Text + "'";
        ad = new SqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        if (ds.Tables[0].Rows.Count == 0)
        {
            string s1 = "insert into User_Data values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')";
            cmd = new SqlCommand(s1, con);
            cmd.ExecuteNonQuery();
            Response.Redirect("Login.aspx");

        }
        else
        {
            Response.Write("<script>alert('Email already exists Please Login')</script>");
        }

    }
}