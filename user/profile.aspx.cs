using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_profile : System.Web.UI.Page
{
    string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("~/UserLogin.aspx"); // Redirect if user is not logged in
                return;
            }

            LoadUserProfile(); // Load the user's profile details on page load
        }
    }
    private void LoadUserProfile()
    {
        int userId = Convert.ToInt32(Session["AdminID"]); // Assuming user ID is stored in session
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT FullName, Email, PhoneNo FROM Users WHERE UserId = @UserId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@UserId", userId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    reader.Read();
                    txtFullName.Text = reader["FullName"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtPhone.Text = reader["PhoneNo"].ToString();
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "User details not found.";
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int userId = Convert.ToInt32(Session["AdminID"]); // Get the logged-in user ID
        string fullName = txtFullName.Text.Trim();
        string email = txtEmail.Text.Trim();
        string phone = txtPhone.Text.Trim();

        // Validate the input fields
        if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phone))
        {
            lblMessage.Visible = true;
            lblMessage.Text = "All fields are required.";
            return;
        }

        // Update the user's profile details
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string updateQuery = "UPDATE Users SET FullName = @FullName, Email = @Email, PhoneNo = @Phone WHERE UserId = @UserId";
            using (SqlCommand cmd = new SqlCommand(updateQuery, con))
            {
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.Parameters.AddWithValue("@UserId", userId);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Profile updated successfully!";
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Failed to update profile. Please try again.";
                }
            }
        }
    }
}