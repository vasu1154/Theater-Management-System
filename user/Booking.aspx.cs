using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Booking : System.Web.UI.Page
{
    string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
    private string movieId;

    protected void Page_Load(object sender, EventArgs e)
    {
        movieId = Request.QueryString["MovieId"];
        if (string.IsNullOrEmpty(movieId))
        {
            Response.Redirect("Movies.aspx");
            return;
        }

        if (Session["AdminID"] == null)
        {
            Response.Redirect("~/UserLogin.aspx");
        }

        if (!IsPostBack)
        {
            LoadMovieDetails();
            LoadShows();
        }

        if (IsPostBack && !string.IsNullOrEmpty(ddlShows.SelectedValue))
        {
            int showId;
            if (int.TryParse(ddlShows.SelectedValue, out showId))
            {
                LoadSeats(showId);
            }
        }
    }

    private void LoadMovieDetails()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT Title FROM Movies WHERE MovieId = @MovieId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@MovieId", movieId);
                con.Open();
                object result = cmd.ExecuteScalar();
                lblMovieTitle.Text = result != null ? result.ToString() : "Unknown Movie";
            }
        }
    }

    private void LoadShows()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT ShowId, CONVERT(VARCHAR, ShowDate, 103) + ' - ' + CONVERT(VARCHAR, ShowTime, 8) AS ShowDetails FROM Shows WHERE MovieId = @MovieId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@MovieId", movieId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    ddlShows.DataSource = reader;
                    ddlShows.DataTextField = "ShowDetails";
                    ddlShows.DataValueField = "ShowId";
                    ddlShows.DataBind();
                    ddlShows.Items.Insert(0, new ListItem("Select a Show", ""));
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "No shows found for the selected movie.";
                }
            }
        }
    }

    protected void ddlShows_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlShows.SelectedValue))
        {
            int showId = int.Parse(ddlShows.SelectedValue);
            LoadSeats(showId);
        }
    }

    private void LoadSeats(int showId)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT SeatId, SeatNumber, SeatStatus FROM Seats WHERE ShowId = @ShowId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@ShowId", showId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                seatSelection.Controls.Clear(); // Clear previous controls

                while (reader.Read())
                {
                    string seatNumber = reader["SeatNumber"].ToString();
                    string seatStatus = reader["SeatStatus"].ToString();

                    Button seatButton = new Button
                    {
                        Text = seatNumber,
                        CssClass = seatStatus == "Booked" ? "seat booked" : "seat available",
                        CommandArgument = seatNumber
                    };

                    if (seatStatus != "Booked")
                    {
                        seatButton.Click += SeatButton_Click;
                    }

                    seatSelection.Controls.Add(seatButton);
                }
            }
        }
    }

    protected void SeatButton_Click(object sender, EventArgs e)
    {
        Button seatButton = (Button)sender;

        if (seatButton.CssClass.Contains("selected"))
        {
            seatButton.CssClass = seatButton.CssClass.Replace(" selected", "");
        }
        else
        {
            seatButton.CssClass += " selected";
        }
    }

    protected void btnBook_Click(object sender, EventArgs e)
    {
        int seatsRequested = 0;
List<string> selectedSeats = new List<string>();
decimal pricePerSeat = 200; // Example price per seat
decimal totalAmount = 0;

// Loop through all the seats to get selected seats
foreach (Control control in seatSelection.Controls)
{
    Button button = control as Button;
    if (button != null && button.CssClass.Contains("selected"))
    {
        string seatNumber = button.CommandArgument;
        if (!string.IsNullOrEmpty(seatNumber))
        {
            selectedSeats.Add(seatNumber);
            seatsRequested++;
        }
    }
}

// Check if at least one seat is selected
if (seatsRequested == 0)
{
    lblMessage.Visible = true;
    lblMessage.Text = "Please select at least one seat.";
    return;
}

// Calculate total amount
totalAmount = seatsRequested * pricePerSeat;

// Connect to the database and handle the transaction
using (SqlConnection con = new SqlConnection(connectionString))
{
    con.Open();
    SqlTransaction transaction = con.BeginTransaction();

    try
    {
        // Loop through selected seats to update the seat status in the database
        foreach (string seat in selectedSeats)
        {
            string updateSeatQuery = "UPDATE Seats SET SeatStatus = 'Booked' WHERE SeatNumber = @SeatNumber AND ShowId = @ShowId";
            using (SqlCommand cmd = new SqlCommand(updateSeatQuery, con, transaction))
            {
                cmd.Parameters.AddWithValue("@SeatNumber", seat);
                cmd.Parameters.AddWithValue("@ShowId", ddlShows.SelectedValue);
                cmd.ExecuteNonQuery();
            }
        }

        // Insert booking details into the Bookings table
        string bookQuery = @"
            INSERT INTO Bookings (UserId, ShowId, SeatsBooked, BookingDate, BookingStatus) 
            VALUES (@UserId, @ShowId, @SeatsBooked, @BookingDate, 'Confirmed');
            SELECT SCOPE_IDENTITY();"; // Get the BookingId of the newly inserted booking
        string bookingId = string.Empty; // Variable to store the BookingId

        using (SqlCommand bookCmd = new SqlCommand(bookQuery, con, transaction))
        {
            bookCmd.Parameters.AddWithValue("@UserId", Session["AdminID"]);
            bookCmd.Parameters.AddWithValue("@ShowId", ddlShows.SelectedValue);
            bookCmd.Parameters.AddWithValue("@SeatsBooked", seatsRequested);
            bookCmd.Parameters.AddWithValue("@BookingDate", DateTime.Now);

            // Execute the query and retrieve the generated BookingId
            bookingId = bookCmd.ExecuteScalar().ToString();
        }

        if (string.IsNullOrEmpty(bookingId))
        {
            throw new Exception("Booking ID could not be generated.");
        }

        // Store the BookingId in the session
        Session["BookingId"] = bookingId;

        // Commit the transaction to make the changes permanent
        transaction.Commit();
    }
    catch (Exception ex)
    {
        // Rollback the transaction in case of an error
        transaction.Rollback();
        throw new Exception("An error occurred while booking seats: " + ex.Message);
    }
}

// Store other session details for the next page (payment page)
Session["MovieTitle"] = lblMovieTitle.Text;
Session["ShowDetails"] = ddlShows.SelectedItem.Text;
Session["SelectedSeats"] = string.Join(", ", selectedSeats);
Session["TotalAmount"] = totalAmount;

// Redirect to the payment page
Response.Redirect("~/user/Payment.aspx?UserId=" + Session["AdminID"]);
    }
}
