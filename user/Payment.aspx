<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="user_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .payment-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            background-color: #f9f9f9;
            max-width: 600px;
            margin: auto;
            text-align: left;
        }

        .payment-container h3 {
            text-align: center;
            margin-bottom: 15px;
        }

        .btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
        }

        .error-message {
            color: red;
            font-size: 0.9rem;
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="payment-container">
            <h3>Payment Details</h3>
            <p><strong>BookingId: </strong> 
                <asp:Label ID="lblBookingId" runat="server" Text="Label"></asp:Label>
            </p>
            <p><strong>Movie:</strong> <asp:Label ID="lblMovieTitle" runat="server" /></p>
            <p><strong>Show:</strong> <asp:Label ID="lblShowDetails" runat="server" /></p>
            <p><strong>Seats:</strong> <asp:Label ID="lblSeats" runat="server" /></p>
            <p><strong>Total Amount:</strong> <asp:Label ID="lblTotalAmount" runat="server" /></p>

            <hr />
            <h4>Select Payment Method</h4>
            <asp:RadioButtonList ID="rblPaymentMethod" runat="server" RepeatDirection="Vertical" CssClass="payment-method">
                <asp:ListItem Text="Credit/Debit Card" Value="Credit/Debit Card" />
                <asp:ListItem Text="UPI" Value="UPI" />
                <asp:ListItem Text="Wallet" Value="Wallet" />
            </asp:RadioButtonList>

            <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="btn btn-primary" OnClick="btnPay_Click" />
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="False"></asp:Label>
        </div>
</asp:Content>

