﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="ManageShows.aspx.cs" Inherits="admin_ManageShows" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../asset/css/Manageshow.css" />
    <div class="container">
    <h2>Manage Shows</h2>

    <!-- Add/Edit Show Form -->
    <div class="form-container">
        <h3>Add/Edit Show</h3>
        <div class="form-group">
            <label for="Movie">Select Movie:</label>
            <asp:DropDownList ID="MovieDropDown" runat="server" CssClass="input-field" 
                AutoPostBack="True"  
                DataSourceID="SqlDataSource2" DataTextField="Title" 
                DataValueField="MovieId">
                <asp:ListItem Text="Select a Movie" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Title], [MovieId] FROM [Movies]"></asp:SqlDataSource>
        </div>

        <div class="form-group">
            <label for="ShowDate">Show Date:</label>
            <asp:TextBox ID="ShowDate" runat="server" CssClass="input-field" TextMode="Date" required="true" />
        </div>
        
        <div class="form-group">
            <label for="ShowTime">Show Time:</label>
            <asp:TextBox ID="ShowTime" runat="server" CssClass="input-field" TextMode="Time" required="true" />
        </div>

        <div class="form-group">
            <label for="AvailableSeats">Available Seats:</label>
            <asp:TextBox ID="AvailableSeats" runat="server" CssClass="input-field" required="true" />
        </div>

        <div class="form-group">
            <asp:Button ID="AddEditShowButton" runat="server" Text="Add Show" CssClass="btn" OnClick="AddEditShowButton_Click" />
            &nbsp;</div>

        <asp:Label ID="MessageLabel" runat="server" CssClass="message"></asp:Label>
    </div>

    <!-- Show List Grid -->
    <div class="list">
        <h3>Shows List</h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
                DataKeyNames="ShowId" DataSourceID="SqlDataSource1" CssClass="grid">
                <Columns>
                    <asp:BoundField DataField="ShowId" HeaderText="ShowId" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ShowId" />
                    <asp:BoundField DataField="MovieId" HeaderText="MovieId" 
                        SortExpression="MovieId" />
                    <asp:BoundField DataField="ShowDate" HeaderText="ShowDate" 
                        SortExpression="ShowDate" />
                    <asp:BoundField DataField="ShowTime" HeaderText="ShowTime" 
                        SortExpression="ShowTime" />
                    <asp:BoundField DataField="AvailableSeats" HeaderText="AvailableSeats" 
                        SortExpression="AvailableSeats" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Bookings] WHERE [ShowId] = @ShowId; DELETE FROM [Seats] WHERE [ShowId] = @ShowId; DELETE FROM [Shows] WHERE [ShowId] = @ShowId" 
                InsertCommand="INSERT INTO [Shows] ([MovieId], [ShowDate], [ShowTime], [AvailableSeats]) VALUES (@MovieId, @ShowDate, @ShowTime, @AvailableSeats)" 
                SelectCommand="SELECT * FROM [Shows]" 
                UpdateCommand="UPDATE [Shows] SET [MovieId] = @MovieId, [ShowDate] = @ShowDate, [ShowTime] = @ShowTime, [AvailableSeats] = @AvailableSeats WHERE [ShowId] = @ShowId">
                <DeleteParameters>
                    <asp:Parameter Name="ShowId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MovieId" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ShowDate" />
                    <asp:Parameter DbType="Time" Name="ShowTime" />
                    <asp:Parameter Name="AvailableSeats" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MovieId" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ShowDate" />
                    <asp:Parameter DbType="Time" Name="ShowTime" />
                    <asp:Parameter Name="AvailableSeats" Type="String" />
                    <asp:Parameter Name="ShowId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</div>
</asp:Content>

