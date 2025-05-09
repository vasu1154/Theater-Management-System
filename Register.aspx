<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="asset/css/login.css" />
    <link rel="stylesheet" type="text/css" href="../asset/css/bootstrap-5.3.3-dist/css/bootstrap.rtl.min.css" />
    <script type="text/javascript" src="../asset/css/bootstrap-5.3.3-dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* Register.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    width: 60%;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
}

.form-container {
    margin-top: 20px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.input-field {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn {
    background-color: #28a745;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn:hover {
    background-color: #218838;
}

.validation-summary {
    color: red;
    font-weight: bold;
}

    </style>
</head>
<body>
 <div class="container">
        <h2>Register for Movie Ticket Booking</h2>

        

        <div class="form-container">
    <form id="form1" runat="server">
    <div>
        <div class="form-group">
                    <label for="Username">Username:</label>
                    <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="input-field" required="true" />
                    <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ControlToValidate="UsernameTextBox" InitialValue="" ErrorMessage="Username is required." ForeColor="Red" />
                </div>

                <div class="form-group">
                    <label for="Password">Password:</label>
                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="input-field" TextMode="Password" required="true" />
                    <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="PasswordTextBox" InitialValue="" ErrorMessage="Password is required." ForeColor="Red" />
                </div>

                <div class="form-group">
                    <label for="FullName">Full Name:</label>
                    <asp:TextBox ID="FullNameTextBox" runat="server" CssClass="input-field" required="true" />
                    <asp:RequiredFieldValidator ID="FullNameValidator" runat="server" ControlToValidate="FullNameTextBox" InitialValue="" ErrorMessage="Full Name is required." ForeColor="Red" />
                </div>

                <div class="form-group">
                    <label for="Email">Email:</label>
                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="input-field" required="true" />
                    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTextBox" InitialValue="" ErrorMessage="Email is required." ForeColor="Red" />
                    <asp:RegularExpressionValidator ID="EmailRegValidator" runat="server" ControlToValidate="EmailTextBox" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Invalid email format." ForeColor="Red" />
                </div>

                <div class="form-group">
                    <label for="PhoneNumber">Phone Number:</label>
                    <asp:TextBox ID="PhoneNumberTextBox" runat="server" CssClass="input-field" required="true" />
                    <asp:RequiredFieldValidator ID="PhoneNumberValidator" runat="server" ControlToValidate="PhoneNumberTextBox" InitialValue="" ErrorMessage="Phone number is required." ForeColor="Red" />
                &nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="RegisterButton" runat="server" Text="Register" CssClass="btn" OnClick="RegisterButton_Click" />
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary" />
    </div>
    </form>
    </div>
    </div>
</body>
</html>
