using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class user_Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if session variables are null or empty
            if (Session["BookingId"] == null || string.IsNullOrEmpty(Session["BookingId"].ToString()))
            {
                lblErrorMessage.Text = "Invalid Booking ID. Please try again.";
                lblErrorMessage.Visible = true;
                return;
            }

            // Assign session values to controls
            lblBookingId.Text = Session["BookingId"].ToString();
            lblMovieTitle.Text = Session["MovieTitle"].ToString();
            lblShowDetails.Text = Session["ShowDetails"].ToString();
            lblSeats.Text = Session["SelectedSeats"].ToString();
            lblTotalAmount.Text = "₹" + Session["TotalAmount"].ToString();
        }
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;

        if (rblPaymentMethod.SelectedValue == "")
        {
            lblErrorMessage.Text = "Please select a payment method.";
            lblErrorMessage.Visible = true;
            return;
        }

        if (Session["BookingId"] == null || Session["AdminID"] == null)
        {
            lblErrorMessage.Text = "Session expired. Please log in again.";
            lblErrorMessage.Visible = true;
            Response.Redirect("~/UserLogin.aspx");
            return;
        }

        string userId = Session["AdminID"].ToString();
        string bookingId = Session["BookingId"].ToString(); // Ensure this BookingId is valid
        decimal totalAmount;

        if (Session["TotalAmount"] == null || !decimal.TryParse(Session["TotalAmount"].ToString(), out totalAmount))
        {
            lblErrorMessage.Text = "Invalid amount. Please try again.";
            lblErrorMessage.Visible = true;
            return;
        }

        try
        {
            string paymentMethod = rblPaymentMethod.SelectedValue;
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Ensure the BookingId exists in the Bookings table before inserting payment
                string checkBookingQuery = "SELECT COUNT(*) FROM Bookings WHERE BookingId = @BookingId";
                using (SqlCommand checkCmd = new SqlCommand(checkBookingQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@BookingId", bookingId);
                    con.Open();
                    int count = (int)checkCmd.ExecuteScalar();
                    if (count == 0)
                    {
                        lblErrorMessage.Text = "Invalid Booking ID. Please try again.";
                        lblErrorMessage.Visible = true;
                        return;
                    }
                }

                // Insert payment details
                string paymentQuery = @"
                INSERT INTO Payments (BookingId, UserId, PaymentDate, PaymentMethod, Amount, PaymentStatus)
                VALUES (@BookingId, @UserId, @PaymentDate, @PaymentMethod, @Amount, @PaymentStatus);

                UPDATE Bookings SET BookingStatus = 'Paid' WHERE BookingId = @BookingId;
            ";

                using (SqlCommand cmd = new SqlCommand(paymentQuery, con))
                {
                    cmd.Parameters.AddWithValue("@BookingId", bookingId);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@PaymentDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    cmd.Parameters.AddWithValue("@Amount", totalAmount);
                    cmd.Parameters.AddWithValue("@PaymentStatus", "Success");

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("~/user/Bill.aspx");
        }
        catch (SqlException sqlEx)
        {
            lblErrorMessage.Text = "SQL Error: " + sqlEx.Message;
            lblErrorMessage.Visible = true;
            // Log the error (optional)
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "An error occurred during payment: " + ex.Message;
            lblErrorMessage.Visible = true;
            // Log the error (optional)
        }
    }
}
