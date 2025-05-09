using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_ViewBooking : System.Web.UI.Page
{
    string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int bookingId = Convert.ToInt32(Request.QueryString["BookingId"]);
            LoadBookingDetails(bookingId);
        }
    }
    private void LoadBookingDetails(int bookingId)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            // Get booking details from the Bookings, Movies, Shows, and Users tables
            string bookingQuery = @"
                SELECT b.BookingId, u.Username, u.FullName, m.Title AS MovieTitle, s.ShowDate, s.ShowTime, b.SeatsBooked, b.BookingStatus
                FROM Bookings b
                JOIN Users u ON b.UserId = u.UserId
                JOIN Shows s ON b.ShowId = s.ShowId
                JOIN Movies m ON s.MovieId = m.MovieId
                WHERE b.BookingId = @BookingId";

            using (SqlCommand cmd = new SqlCommand(bookingQuery, con))
            {
                cmd.Parameters.AddWithValue("@BookingId", bookingId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblBookingId.Text = "Booking ID: " + reader["BookingId"].ToString();
                    lblUserName.Text = "User Name: " + reader["Username"].ToString();
                    lblFullName.Text = "Full Name: " + reader["FullName"].ToString();
                    lblMovieTitle.Text = "Movie Title: " + reader["MovieTitle"].ToString();
                    lblShowDetails.Text = "Show Date: " + reader["ShowDate"].ToString() + " at " + reader["ShowTime"].ToString();
                    lblSeatsBooked.Text = "Seats Booked: " + reader["SeatsBooked"].ToString();
                    lblBookingStatus.Text = "Booking Status: " + reader["BookingStatus"].ToString();
                }
                reader.Close();
            }

            // Get payment details from the Payments table
            string paymentQuery = @"
                SELECT p.PaymentId, p.PaymentMethod, p.Amount, p.PaymentStatus
                FROM Payments p
                WHERE p.BookingId = @BookingId";

            using (SqlCommand cmd = new SqlCommand(paymentQuery, con))
            {
                cmd.Parameters.AddWithValue("@BookingId", bookingId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                repPayments.DataSource = dt;
                repPayments.DataBind();
            }
        }
    }
}
