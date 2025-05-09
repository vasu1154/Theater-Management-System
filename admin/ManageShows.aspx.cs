using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_ManageShows : System.Web.UI.Page
{
    private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataBind();
        }
    }
    protected void AddEditShowButton_Click(object sender, EventArgs e)
    {
        string movieID = MovieDropDown.SelectedValue;
        string showDate = ShowDate.Text;
        string showTime = ShowTime.Text;
        string availableSeats = AvailableSeats.Text;

        string showID = Request.QueryString["ShowID"];
        string query;

        if (showID == null) // Add new show
        {
            query = "INSERT INTO Shows (MovieId, ShowDate, ShowTime, AvailableSeats) VALUES (@MovieID, @ShowDate, @ShowTime, @AvailableSeats)";
        }
        else // Edit existing show
        {
            query = "UPDATE Shows SET MovieId = @MovieID, ShowDate = @ShowDate, ShowTime = @ShowTime, AvailableSeats = @AvailableSeats WHERE ShowId = @ShowID";
        }

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@MovieID", movieID);
            cmd.Parameters.AddWithValue("@ShowDate", showDate);
            cmd.Parameters.AddWithValue("@ShowTime", showTime);
            cmd.Parameters.AddWithValue("@AvailableSeats", availableSeats);

            if (showID != null)
            {
                cmd.Parameters.AddWithValue("@ShowID", showID);
            }

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        MessageLabel.Text = showID == null ? "Show added successfully!" : "Show updated successfully!";
        MessageLabel.CssClass = "success";
        GridView1.DataBind();
    }
}