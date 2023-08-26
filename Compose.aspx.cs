using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class com : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        con = new SqlConnection(path);
        con.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string from = Session["from"].ToString();
        string time = DateTime.Now.ToString("d-MM-yyyy hh:mm");
        string s = "insert into Email_Data values('" + from + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + time + "')";
        cmd = new SqlCommand(s, con);
        cmd.ExecuteNonQuery();
        Session["to"] = TextBox1.Text;
        Response.Redirect("Sent.aspx");
    }
}