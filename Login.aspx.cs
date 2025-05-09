using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] != null)
        {
            Response.Redirect("~/admin/Dashbord.aspx");
        }
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string username = Username.Text;
            string password = Password.Text;

            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
            string query = "SELECT UserId, FullName FROM Users WHERE Username = @Username AND Password = @Password AND Role = 'Admin'";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    // Set session variables
                    Session["AdminID"] = reader["UserID"].ToString();
                    Session["AdminName"] = reader["FullName"].ToString();

                    Response.Redirect("~/admin/Dashbord.aspx");
                }
                else
                {
                    // Invalid login credentials
                    ErrorLabel.Text = "Invalid Username or Password.";
                    ErrorLabel.Visible = true;
                }
            }
        }
}