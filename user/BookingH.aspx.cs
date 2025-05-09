using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_BookinH : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
        {
            Response.Redirect("~/UserLogin.aspx");
        }
        if (!IsPostBack)
        {
            LoadBookingHistory();
        }
    }

    private void LoadBookingHistory()
    {
        string userId = Session["AdminID"].ToString(); // Assuming UserID is stored in the session
        if (string.IsNullOrEmpty(userId))
        {
            Response.Redirect("Login.aspx");
            return;
        }

        string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True"; // Replace with your DB connection string
        string query = @"
        SELECT 
            BH.BookingId,
            M.Title,
            S.ShowDate,
            S.ShowTime,
            BH.SeatsBooked,
            BH.BookingDate,
            BH.BookingStatus
        FROM 
            Bookings BH
        INNER JOIN 
            Shows S ON BH.ShowId = S.ShowId
        INNER JOIN 
            Movies M ON S.MovieId = M.MovieId
        WHERE 
            BH.UserId = @UserID
        ORDER BY 
            BH.BookingDate DESC";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvBookingHistory.DataSource = dt;
                        gvBookingHistory.DataBind();
                        lblNoData.Visible = false;
                    }
                    else
                    {
                        gvBookingHistory.DataSource = null;
                        gvBookingHistory.DataBind();
                        lblNoData.Visible = true;
                    }
                }
            }
        }
    }
    protected void gvBookingHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookingHistory.PageIndex = e.NewPageIndex;
        LoadBookingHistory();
    }
}
