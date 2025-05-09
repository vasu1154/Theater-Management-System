<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="Dashbord.aspx.cs" Inherits="admin_Dashbord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Welcome, <%= Session["AdminName"] %></h1>
    <div class="stats">
        <div class="stat">
            <h3>Movies</h3>
            <p><%= GetMovieCount() %></p>
        </div>
        <div class="stat">
            <h3>Shows</h3>
            <p><%= GetShowCount() %></p>
        </div>
        <div class="stat">
            <h3>Bookings</h3>
            <p></p>
        </div>
    </div>
</asp:Content>

