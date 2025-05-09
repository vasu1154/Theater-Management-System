using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminID"] == null || Session["MovieTitle"] == null || Session["ShowDetails"] == null || Session["SelectedSeats"] == null || Session["TotalAmount"] == null)
            {
                Response.Redirect("~/UserLogin.aspx"); // Redirect to login if session expired
                return;
            }

            // Display the booking information
            lblMovieTitle.Text = Session["MovieTitle"].ToString();
            lblShowDetails.Text = Session["ShowDetails"].ToString();
            lblSeats.Text = Session["SelectedSeats"].ToString();
            lblTotalAmount.Text = "₹" + Session["TotalAmount"].ToString();

            // Retrieve the user's full name from the session (ensure it's stored during login or booking)
            if (Session["AdminName"] != null)
            {
                lblFullName.Text = Session["AdminName"].ToString();
            }
            else
            {
                lblFullName.Text = "Guest User"; // Default if full name is not set
            }
        }
    }
}