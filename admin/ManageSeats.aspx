﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ManageSeats.aspx.cs" Inherits="admin_ManageSeats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../asset/css/Manageshow.css" />
    <div class="container">
        <h2>Manage Seats for Shows</h2>

        <!-- Add/Edit Seat Form -->
        <div class="form-container">
            <h3>Add/Edit Seat</h3>
            <div class="form-group">
                <label for="Show">Select Show:</label>
                <asp:DropDownList ID="ShowDropDown" runat="server" CssClass="input-field" AutoPostBack="True" 
                    DataSourceID="SqlDataSourceShows" DataTextField="ShowDate" 
                    DataValueField="ShowId">
                    <asp:ListItem Text="Select a Show" Value="0"></asp:ListItem>
                </asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSourceShows" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [ShowId], [ShowDate] FROM [Shows]">
                </asp:SqlDataSource>
            </div>

            <div class="form-group">
                <label for="SeatNumber">Seat Number:</label>
                <asp:TextBox ID="SeatNumber" runat="server" CssClass="input-field" required="true" />
            </div>

            <div class="form-group">
                <label for="SeatStatus">Seat Status:</label>
                <asp:DropDownList ID="SeatStatus" runat="server" CssClass="input-field">
                    <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                    <asp:ListItem Text="Booked" Value="Booked"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Button ID="AddEditSeatButton" runat="server" Text="Add Seat" CssClass="btn" OnClick="AddEditSeatButton_Click" />
            </div>

            <asp:Label ID="MessageLabel" runat="server" CssClass="message"></asp:Label>
        </div>

        <!-- Seat List Grid -->
        <div class="list">
            <h3>Seats List</h3>
            <p>
                <asp:GridView ID="GridViewSeats" runat="server" AutoGenerateColumns="False" 
                    AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
                    DataKeyNames="SeatID" DataSourceID="SqlDataSourceSeats" CssClass="grid">
                    <Columns>
                        <asp:BoundField DataField="SeatID" HeaderText="SeatID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="SeatID" />
                        <asp:BoundField DataField="SeatNumber" HeaderText="Seat Number" 
                            SortExpression="SeatNumber" />
                        <asp:BoundField DataField="SeatStatus" HeaderText="Seat Status" 
                            SortExpression="SeatStatus" />
                        <asp:BoundField DataField="ShowID" HeaderText="ShowID" 
                            SortExpression="ShowID" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSourceSeats" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM Seats WHERE SeatID = @SeatID" 
                    InsertCommand="INSERT INTO Seats (ShowID, SeatNumber, SeatStatus) VALUES (@ShowID, @SeatNumber, @SeatStatus)" 
                    SelectCommand="SELECT * FROM Seats" 
                    UpdateCommand="UPDATE Seats SET ShowID = @ShowID, SeatNumber = @SeatNumber, SeatStatus = @SeatStatus WHERE SeatID = @SeatID">
                    <DeleteParameters>
                        <asp:Parameter Name="SeatID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ShowID" Type="Int32" />
                        <asp:Parameter Name="SeatNumber" Type="String" />
                        <asp:Parameter Name="SeatStatus" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ShowID" Type="Int32" />
                        <asp:Parameter Name="SeatNumber" Type="String" />
                        <asp:Parameter Name="SeatStatus" Type="String" />
                        <asp:Parameter Name="SeatID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
        </div>
    </div>
</asp:Content>

