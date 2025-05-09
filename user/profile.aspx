<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .profile-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            text-align: left;
        }

        .profile-container h3 {
            text-align: center;
            margin-bottom: 15px;
        }

        .profile-container p {
            margin: 5px 0;
        }

        .profile-container .btn {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="profile-container">
        <h3>Manage Profile</h3>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false" />

        <p><strong>Full Name:</strong> <asp:TextBox ID="txtFullName" runat="server" MaxLength="100" CssClass="form-control" /></p>
        <p><strong>Email:</strong> <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="form-control" /></p>
        <p><strong>Phone:</strong> <asp:TextBox ID="txtPhone" runat="server" MaxLength="15" CssClass="form-control" /></p>

        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="btnSave_Click" />
        
        <asp:Button ID="Button1" runat="server" Text="Back to Dashboard" 
            CssClass="btn btn-primary" PostBackUrl="~/user/CDashboard.aspx"  />

    

    </div>
</asp:Content>

