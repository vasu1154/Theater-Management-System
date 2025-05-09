using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_ManageSeats : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridViewSeats.DataBind();
        }
    }
    protected void AddEditSeatButton_Click(object sender, EventArgs e)
    {
        string seatNumber = SeatNumber.Text.Trim();
        string seatStatus = SeatStatus.SelectedValue;
        int showId = int.Parse(ShowDropDown.SelectedValue);

        // Ensure the form is filled correctly
        if (showId == 0 || string.IsNullOrEmpty(seatNumber) || string.IsNullOrEmpty(seatStatus))
        {
            MessageLabel.Text = "Please fill in all fields!";
            MessageLabel.CssClass = "message error";
            return;
        }

        SqlConnection connection = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True");
        SqlCommand command;

        // Check if this is an Add or Update operation
        if (Request.QueryString["SeatID"] != null)  // If editing existing seat
        {
            int seatId = int.Parse(Request.QueryString["SeatID"]);
            string query = "UPDATE Seats SET ShowId = @ShowID, SeatNumber = @SeatNumber, SeatStatus = @SeatStatus WHERE SeatId = @SeatID";
            command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@SeatID", seatId);
        }
        else  // If adding new seat
        {
            string query = "INSERT INTO Seats (ShowId, SeatNumber, SeatStatus) VALUES (@ShowID, @SeatNumber, @SeatStatus)";
            command = new SqlCommand(query, connection);
        }

        command.Parameters.AddWithValue("@ShowID", showId);
        command.Parameters.AddWithValue("@SeatNumber", seatNumber);
        command.Parameters.AddWithValue("@SeatStatus", seatStatus);

        try
        {
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();

            // Clear form fields after successful add or update
            SeatNumber.Text = string.Empty;
            MessageLabel.Text = "Seat information saved successfully.";
            MessageLabel.CssClass = "message success";
            Response.Redirect("ManageSeats.aspx"); // Redirect to refresh the page (avoiding re-posting the form)
        }
        catch (Exception ex)
        {
            MessageLabel.Text = "Error: " + ex.Message;
            MessageLabel.CssClass = "message error";
        }
    }
}