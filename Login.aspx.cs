using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
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
        string s = "select * from User_Data where Email='" + TextBox1.Text + "' AND Password='" + TextBox2.Text + "'";

        ad = new SqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        if (ds.Tables[0].Rows.Count == 0)
        {

            Response.Write("<script>alert('Please Register')</script>");
        }
        else if (TextBox1.Text == ds.Tables[0].Rows[0][2].ToString() && TextBox2.Text == ds.Tables[0].Rows[0][4].ToString())
        {
            Session["from"] = TextBox1.Text;
            Response.Redirect("Inbox.aspx");
        }
        else if (TextBox1.Text != ds.Tables[0].Rows[0][2].ToString() || TextBox2.Text != ds.Tables[0].Rows[0][4].ToString())
        {
            Response.Write("<script>alert('Please enter email or password correctly')</script>");
        }
    }
}