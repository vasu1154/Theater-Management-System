<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="Movies.aspx.cs" Inherits="user_Movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../asset/css/movie.css" />
    <div class="movies-container">
        <h2>Now Showing</h2>
        <div class="movies-list">
            <!-- Movie List -->
            <asp:Repeater ID="MovieRepeater" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="movie-card">
                        <img src='<%# ResolveUrl(Eval("PosterURL").ToString()) %>' alt="<%# Eval("Title") %>" class="movie-image" />
                        <div class="movie-info">
                            <h3><%# Eval("Title") %></h3>
                            <p><%# Eval("Genre") %> | <%# Eval("Duration") %> mins</p>
                            <p><%# Eval("ReleaseDate") %></p>
                            <a href="viewdtl.aspx?movieId=<%# Eval("MovieId") %>" class="btn-book">View Dtl</a>
                            <a href="Booking.aspx?movieId=<%# Eval("MovieId") %>" class="btn-book">Book Now</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT [Title], [Duration], [PosterURL], [Genre], [MovieId], [ReleaseDate] FROM [Movies]">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

