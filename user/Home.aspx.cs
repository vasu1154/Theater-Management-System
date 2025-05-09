using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   protected void ViewMovieDetails(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "ViewDetails")
        {
            string movieId = e.CommandArgument.ToString();
            Response.Redirect("viewdtl.aspx?MovieID=" + e.CommandArgument.ToString());
        }
    }

}