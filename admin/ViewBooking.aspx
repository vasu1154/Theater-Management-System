<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ViewBooking.aspx.cs" Inherits="admin_ViewBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        <style>
        .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .table-container {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .action-btns {
            margin-top: 20px;
        }

        .action-btns a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            margin-right: 10px;
        }

        .action-btns a:hover {
            background-color: #45a049;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .status {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2 class="header">Booking Details</h2>
        <asp:Label ID="lblBookingId" runat="server" Text="Booking ID: " Font-Bold="True" />
        <br />
        <asp:Label ID="lblUserName" runat="server" Text="User Name: " Font-Bold="True" />
        <br />
        <asp:Label ID="lblFullName" runat="server" Text="Full Name: " 
            Font-Bold="True" />
        <br />
        <asp:Label ID="lblMovieTitle" runat="server" Text="Movie Title: " Font-Bold="True" />
        <br />
        <asp:Label ID="lblShowDetails" runat="server" Text="Show Details: " Font-Bold="True" />
        <br />
        <asp:Label ID="lblSeatsBooked" runat="server" Text="Seats Booked: " Font-Bold="True" />
        <br />
        <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount: " Font-Bold="True" />
        <br />
        <asp:Label ID="lblBookingStatus" runat="server" Text="Booking Status: " Font-Bold="True" />
        <br />
        
        <div class="table-container">
            <h3>Payment Details</h3>
            <table>
                <tr>
                    <th>Payment ID</th>
                    <th>Payment Method</th>
                    <th>Amount</th>
                    <th>Status</th>
                </tr>
                <asp:Repeater ID="repPayments" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("PaymentId") %></td>
                            <td><%# Eval("PaymentMethod") %></td>
                            <td><%# Eval("Amount") %></td>
                            <td><%# Eval("PaymentStatus") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
        
        <div class="action-btns">
            <a href="ViewBookings.aspx">Back to All Bookings</a>
        </div>
    </div>
</asp:Content>

