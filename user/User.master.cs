using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_User : System.Web.UI.MasterPage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] != null)
        {
            Button3.Visible = false;
        }
        if (Session["AdminID"] == null)
        {
            Button1.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserLogin.aspx");
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/UserLogin.aspx");
    }
}
