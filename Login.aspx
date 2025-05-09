<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="asset/css/login.css" />
    <link rel="stylesheet" type="text/css" href="../asset/css/bootstrap-5.3.3-dist/css/bootstrap.rtl.min.css" />
    <script type="text/javascript" src="../asset/css/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
    <form id="form1" runat="server">
        <div class="form-group">
                <label for="Username">Username:</label>
                <asp:TextBox ID="Username" runat="server" CssClass="input-field" required="true" />
            </div>
            <div class="form-group">
                <label for="Password">Password:</label>
                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="input-field" required="true" />
            </div>
            <div class="form-group">
                <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn" OnClick="LoginButton_Click" />
            </div>
            <div class="form-group">
                <p>Don't have an account? <a href="Register.aspx">Register Here</a></p>
            </div>
            <asp:Label ID="ErrorLabel" runat="server" CssClass="error" Visible="false"></asp:Label>
    </form>
    </div>
</body>
</html>
