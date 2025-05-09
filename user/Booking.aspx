<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="user_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .seat-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(40px, 1fr));
            gap: 10px;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Base styling for each seat */
        .seat {
            width: 40px;
            height: 40px;
            background-color: #e0e0e0; /* Light gray for available seats */
            border: 1px solid #ccc; /* Border for better visibility */
            border-radius: 5px; /* Rounded corners */
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        /* Styling for hovered seat */
        .seat:hover {
            background-color: #b0b0b0; /* Slightly darker gray */
        }

        /* Styling for selected seat */
        .seat.selected {
            background-color: #007bff; /* Blue for selected seats */
            color: #fff; /* White text for contrast */
        }

        /* Styling for booked seat */
        .seat.booked {
            background-color: #ff4d4d; /* Red for booked seats */
            cursor: not-allowed; /* Show unavailable status */
            pointer-events: none; /* Disable interaction */
        }

        /* Styling for row labels (optional) */
        .seat-row {
            text-align: left;
            font-weight: bold;
            font-size: 16px;
            margin-right: 10px;
        }

        /* Responsive grid for different screen sizes */
        @media (max-width: 768px) {
            .seat-container {
                grid-template-columns: repeat(auto-fill, minmax(30px, 1fr));
                gap: 8px;
            }

            .seat {
                width: 30px;
                height: 30px;
                font-size: 12px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../asset/css/ManageMovie.css" />
    <link rel="stylesheet" type="text/css" href="../asset/css/bootstrap-5.3.3-dist/css/bootstrap.rtl.min.css" />
    <h2>Book Seats for <asp:Label ID="lblMovieTitle" runat="server" Text=""></asp:Label></h2>

    <asp:DropDownList ID="ddlShows" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlShows_SelectedIndexChanged">
        <asp:ListItem Text="Select a Show" Value="" />
    </asp:DropDownList>

    <asp:Panel ID="seatSelection" runat="server" CssClass="seat-container">
        <!-- Dynamic seat buttons will be added here -->
    </asp:Panel>

    <asp:Button ID="btnBook" runat="server" Text="Book Seats" OnClick="btnBook_Click" CssClass="btn btn-primary" />

    <asp:Button ID="Button1" runat="server" Text="Cancel" 
            CssClass="btn btn-primary" PostBackUrl="~/user/CDashboard.aspx"  />

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" Visible="False"></asp:Label>

</asp:Content>

