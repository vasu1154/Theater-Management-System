<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="seat.aspx.cs" Inherits="user_seat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
    .seat-selection-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    text-align: center;
}

h2 {
    font-size: 24px;
    margin-bottom: 20px;
}

.movie-info {
    margin-bottom: 20px;
}

.movie-info p {
    font-size: 16px;
}

.seat-grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 10px;
    margin-bottom: 20px;
}

.seat {
    width: 40px;
    height: 40px;
    background-color: #f0f0f0;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    border-radius: 5px;
}

.seat.available {
    background-color: green;
}

.seat.occupied {
    background-color: red;
    cursor: not-allowed;
}

.controls {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.btn {
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

.btn-success {
    background-color: #28a745;
    color: white;
}

.btn-danger {
    background-color: #dc3545;
    color: white;
}

.message {
    font-size: 14px;
    margin-top: 10px;
}

.message.error {
    color: red;
}

.message.success {
    color: green;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
            <h2>Select Your Seats</h2>
            <asp:Repeater ID="rptSeats" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="seat" id="seat_<%# Eval("ShowId") %>" onclick="selectSeat(<%# Eval("ShowId") %>)">
                        <asp:Label ID="lblSeatNumber" runat="server" Text='<%# Eval("SeatNumber") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [SeatNumber], [SeatStatus], [ShowId] FROM [Seats]">
            </asp:SqlDataSource>
            <div class="form-group">
                <asp:Button ID="btnBookSeats" runat="server" Text="Book Selected Seats" OnClick="BookSeats_Click" />
            </div>
        </div>
</asp:Content>

