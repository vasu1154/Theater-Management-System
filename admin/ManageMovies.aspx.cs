using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class admin_ManageMovies : System.Web.UI.Page
{
    private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=Z:\Projects\Asp.Net\TS\App_Data\TS.mdf;Integrated Security=True;User Instance=True";
    private string posterFolder = "~/Upload/";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MoviesGridView.DataBind();
        }
    }

   /* protected void MoviesGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditMovie")
        {
            int movieID = Convert.ToInt32(e.CommandArgument);
            string query = "SELECT * FROM Movies WHERE MovieId = @MovieID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MovieID", movieID);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    MovieTitle.Text = reader["MovieTitle"].ToString();
                    Description.Text = reader["Description"].ToString();
                    ReleaseDate.Text = Convert.ToDateTime(reader["ReleaseDate"]).ToString("yyyy-MM-dd");
                    Duration.Text = reader["Duration"].ToString();
                    Genre.Text = reader["Genre"].ToString();
                    Language.Text = reader["Language"].ToString();
                    PosterUpload.Attributes = reader["PosterURL"].ToString();

                    AddEditMovieButton.Text = "Update Movie";
                    DeleteMovieButton.Visible = true;
                }
                con.Close();
            }
        }
        else if (e.CommandName == "DeleteMovie")
        {
            string movieID = e.CommandArgument.ToString();
            DeleteMovie(movieID);
        }
    }*/
    private void DeleteMovie(string movieID)
    {
        string query = "DELETE FROM Movies WHERE MovieId = @MovieID";
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@MovieID", movieID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        MessageLabel.Text = "Movie deleted successfully!";
        MessageLabel.CssClass = "success";
        MoviesGridView.DataBind();
        ClearForm();
    }

    private void ClearForm()
    {
        MovieTitle.Text = string.Empty;
        Description.Text = string.Empty;
        ReleaseDate.Text = string.Empty;
        Duration.Text = string.Empty;
        Genre.Text = string.Empty;
        Language.Text = string.Empty;
        PosterUpload.Attributes.Clear(); // Clear the file input
        AddEditMovieButton.Text = "Add Movie";
        DeleteMovieButton.Visible = false;
    }
    protected void AddEditMovieButton_Click(object sender, EventArgs e)
    {
        string movieTitle = MovieTitle.Text;
        string description = Description.Text;
        string releaseDate = ReleaseDate.Text;
        string duration = Duration.Text;
        string genre = Genre.Text;
        string language = Language.Text;
        string posterURL = "";

        // Handle file upload for the poster image
        if (PosterUpload.HasFile)
        {
            string fileName = Path.GetFileName(PosterUpload.PostedFile.FileName);
            string filePath = Server.MapPath(posterFolder + fileName);
            PosterUpload.SaveAs(filePath);
            posterURL = posterFolder + fileName;
        }

        string movieID = Request.QueryString["MovieID"];

        string query = movieID == null
            ? "INSERT INTO Movies (Title, Description, ReleaseDate, Duration, Genre, Language, PosterURL) VALUES (@MovieTitle, @Description, @ReleaseDate, @Duration, @Genre, @Language, @PosterURL)"
            : "UPDATE Movies SET Title = @MovieTitle, Description = @Description, ReleaseDate = @ReleaseDate, Duration = @Duration, Genre = @Genre, Language = @Language, PosterURL = @PosterURL WHERE MovieId = @MovieID";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@MovieTitle", movieTitle);
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@ReleaseDate", releaseDate);
            cmd.Parameters.AddWithValue("@Duration", duration);
            cmd.Parameters.AddWithValue("@Genre", genre);
            cmd.Parameters.AddWithValue("@Language", language);
            cmd.Parameters.AddWithValue("@PosterURL", posterURL);

            if (movieID != null)
            {
                cmd.Parameters.AddWithValue("@MovieID", movieID);
            }

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        MessageLabel.Text = movieID == null ? "Movie added successfully!" : "Movie updated successfully!";
        MessageLabel.CssClass = "success";
        MoviesGridView.DataBind();
        ClearForm();
    }
    protected void DeleteMovieButton_Click(object sender, EventArgs e)
    {
        string movieID = Request.QueryString["MovieID"];

        if (movieID != null)
        {
            DeleteMovie(movieID);
        }
    }
}