using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

        string path = ConfigurationManager.ConnectionStrings["connect"].ToString();
        con = new SqlConnection(path);
        con.Open();


        if (!this.IsPostBack)
        {
            string s1 = Session["from"].ToString();
            using (con = new SqlConnection(path))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT  Name,Email,City,Password FROM User_Data WHERE Email = '" + s1 + "'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        TextBox1.Text = sdr["Name"].ToString();
                        TextBox2.Text = sdr["Email"].ToString();
                        TextBox3.Text = sdr["City"].ToString();
                        TextBox4.Text = sdr["Password"].ToString();
                    }
                    con.Close();
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox4.Text == TextBox5.Text)
        {
            string s1 = Session["from"].ToString();
            string s = "update User_Data set Name='" + TextBox1.Text + "',City='" + TextBox3.Text + "' ,Password='" + TextBox4.Text + "' where email='" + s1 + "'";
            cmd = new SqlCommand(s, con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Data Updated!')</script>");
        }
        else
        {
            Response.Write("<script>alert('Please enter password correctly....')</script>");
        }
    }
}