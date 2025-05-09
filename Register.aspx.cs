using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             
        }
    }
    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Retrieve form data
            string username = UsernameTextBox.Text;
            string password = PasswordTextBox.Text;
            string fullName = FullNameTextBox.Text;
            string email = EmailTextBox.Text;
            string phoneNumber = PhoneNumberTextBox.Text;
            string role = "Customer";  // Default role for new users

            // Insert data into the database
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Password, Role, FullName, Email, PhoneNo) " +
                               "VALUES (@Username, @Password, @Role, @FullName, @Email, @PhoneNumber)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);  // You may want to hash the password for security
                    cmd.Parameters.AddWithValue("@Role", role);
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        Response.Redirect("~/uer/UserLogin.aspx");  // Redirect to login page after successful registration
                    }
                    catch (Exception ex)
                    {
                        // Handle exceptions, such as duplicate username, email, etc.
                        
                    }
                }
            }
        }
    }
}