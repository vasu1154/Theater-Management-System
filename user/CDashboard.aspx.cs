using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_CDashboard : System.Web.UI.Page
{
    string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
        {
            Response.Redirect("~/UserLogin.aspx");
        }

    }
}