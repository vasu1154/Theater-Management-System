<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="user_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../asset/css/home.css" />
<div class="c">
    <section class="hero">
        &nbsp;<div class="hero-content">
                <h2>&nbsp;</h2>
                <h2>&nbsp;</h2>
                <h2>&nbsp;</h2>
                <h2>&nbsp;</h2>
                <h2>&nbsp;</h2>
                <h2>Welcome to the Theatre Management System</h2>
                <p>Find the latest movies and book your tickets with ease!</p>
                <a href="Movies.aspx" class="btn-primary">Explore Movies</a>
            </div>
        </section>
</div>
        <!-- Latest Movies Section -->
        <section class="latest-movies">
            <h2>Latest Movies</h2>
            <asp:Repeater ID="rptMovies" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="movie-item">
      
                    <img src='<%# ResolveUrl(Eval("PosterURL").ToString()) %>' alt='<%# Eval("Title") %>' />
                    <h4><%# Eval("Title") %></h4>
                    <asp:Button 
                        ID="btnView" 
                        runat="server" 
                        Text="View" 
                        CssClass="btn btn-info" 
                        CommandName="ViewDetails" 
                        CommandArgument='<%# Eval("MovieId") %>' 
                        OnCommand="ViewMovieDetails" Width="200" Height="40" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [PosterURL], [Title], [MovieId] FROM [Movies]">
    </asp:SqlDataSource>
        </section>

</asp:Content>


