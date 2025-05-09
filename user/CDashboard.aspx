<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="CDashboard.aspx.cs" Inherits="user_CDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        :root {
            --primary-color: #4CAF50;
            --hover-color: #388E3C;
            --background-color: #f5f5f5;
            --card-background: #ffffff;
            --font-color: #333;
            --shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            max-width: 1100px;
            margin: 50px auto;
            padding: 30px;
            background-color: var(--card-background);
            border-radius: 20px;
            box-shadow: var(--shadow);
            text-align: center;
        }

        .dashboard-container h2 {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--font-color);
            margin-bottom: 15px;
        }

        .greeting {
            font-size: 1rem;
            margin-bottom: 30px;
            color: #666;
        }

        .dashboard-options {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            margin-top: 20px;
        }

        .dashboard-options a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 200px;
            height: 60px;
            font-size: 1rem;
            color: #fff;
            background-color: var(--primary-color);
            border: none;
            border-radius: 12px;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
            box-shadow: var(--shadow);
            text-align: center;
        }

        .dashboard-options a:hover {
            background-color: var(--hover-color);
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .dashboard-options a:active {
            transform: scale(0.95);
        }

        @media (max-width: 768px) {
            .dashboard-options a {
                width: 160px;
                height: 50px;
                font-size: 0.9rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="dashboard-container">
        <h2>Welcome, <%= Session["AdminName"] ?? "Guest" %>!</h2>
        <p class="greeting">
            <%= DateTime.Now.ToString("dddd, MMMM dd, yyyy hh:mm tt") %>
        </p>
        <div class="dashboard-options">
            <a href="Movies.aspx">Book Tickets</a>
            <a href="BookingH.aspx">View Booking History</a>
            <a href="profile.aspx">Manage Profile</a>
            <a href="../Logout.aspx" onclick="return confirm('Are you sure you want to logout?');">Logout</a>
        </div>
    </div>
</asp:Content>

