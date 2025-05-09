using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_Dashbord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
        protected int GetMovieCount()
        {
            int count = 0;
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
            string query = "SELECT COUNT(*) FROM Movies";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                count = (int)cmd.ExecuteScalar();
            }
            return count;
        }

        protected int GetShowCount()
        {
            int count = 0;
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
            string query = "SELECT COUNT(*) FROM Shows";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                count = (int)cmd.ExecuteScalar();
            }
            return count;
    }
}