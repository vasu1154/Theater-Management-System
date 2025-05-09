<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="user_Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .bill-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            background-color: #f9f9f9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            text-align: left;
        }

        .bill-container h3 {
            text-align: center;
            margin-bottom: 15px;
        }

        .bill-container p {
            margin: 5px 0;
        }

        .bill-container .btn {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bill-container">
            <h3>Booking Confirmation</h3>
        <p><strong>Full Name:</strong> <asp:Label ID="lblFullName" runat="server" /></p> <!-- Added label for full name -->
        <p><strong>Movie:</strong> <asp:Label ID="lblMovieTitle" runat="server" /></p>
        <p><strong>Show:</strong> <asp:Label ID="lblShowDetails" runat="server" /></p>
        <p><strong>Seats:</strong> <asp:Label ID="lblSeats" runat="server" /></p>
        <p><strong>Total Amount:</strong> <asp:Label ID="lblTotalAmount" runat="server" /></p>
        <asp:Button ID="btnPrintBill" runat="server" Text="Print Bill" CssClass="btn btn-secondary" OnClientClick="window.print(); return false;" />
        <asp:Button ID="Button1" runat="server" Text="Back to Dashboard" 
            CssClass="btn btn-primary" PostBackUrl="~/user/CDashboard.aspx"  />
        </div>
</asp:Content>

