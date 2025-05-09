using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class UserLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            Response.Redirect("~/user/CDashboard.aspx");
        }  
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string username = Username.Text;
        string password = Password.Text;

        string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
        string query = "SELECT UserId, FullName FROM Users WHERE Username = @Username AND Password = @Password AND Role = 'Customer'";

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

                Response.Redirect("~/user/CDashboard.aspx");
            }
            else
            {
                // Invalid login credentials
                Label1.Text = "Invalid Username or Password.";
                Label1.Visible = true;
            }
        }
    }
}