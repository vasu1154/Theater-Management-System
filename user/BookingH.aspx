<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="BookingH.aspx.cs" Inherits="user_BookinH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        :root {
            --primary-color: #007bff;
            --hover-color: #0056b3;
            --background-color: #ffffff;
            --font-color: #333;
            --shadow-color: rgba(0, 0, 0, 0.1);
            --table-header-bg: #007bff;
            --table-header-color: #ffffff;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
        }

        .history-container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
            background: var(--background-color);
            border-radius: 10px;
            box-shadow: 0 4px 15px var(--shadow-color);
        }

        .history-container h2 {
            text-align: center;
            font-size: 2rem;
            color: var(--font-color);
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: center;
        }

        table th,
        table td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: var(--table-header-bg);
            color: var(--table-header-color);
            font-weight: bold;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #eef6ff;
        }

        .no-data {
            margin-top: 20px;
            text-align: center;
            font-size: 1.2rem;
            color: #666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="history-container">
        <h2>Your Booking History</h2>
        <asp:GridView ID="gvBookingHistory" runat="server" AutoGenerateColumns="False" 
            CssClass="history-table" AllowPaging="True" PageSize="5" 
            onpageindexchanging="gvBookingHistory_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                <asp:BoundField DataField="Title" HeaderText="Movie Title" />
                <asp:BoundField DataField="ShowDate" HeaderText="Show Date" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="ShowTime" HeaderText="Show Time" />
                <asp:BoundField DataField="SeatsBooked" HeaderText="Seats Booked" />
                <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="BookingStatus" HeaderText="Status" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblNoData" runat="server" CssClass="no-data" Visible="False">No bookings found!</asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Back to Dashboard" 
            CssClass="btn btn-primary" PostBackUrl="~/user/CDashboard.aspx"  />
    </div>
</asp:Content>

