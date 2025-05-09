<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="user_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
        .contact-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            text-align: left;
        }

        .contact-container h3 {
            text-align: center;
            margin-bottom: 15px;
        }

        .contact-container p {
            margin: 10px 0;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
        }

        .contact-form input, .contact-form textarea {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .contact-form button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="contact-container">
        <h3>Contact Us</h3>
        
        <p>If you have any questions or need further information, feel free to reach out to us using the form below. We will get back to you as soon as possible!</p>

        <h4>Contact Information</h4>
        <p><strong>Email:</strong> jaydeepprajapati11@gmail.com</p>
        <p><strong>Phone:</strong> +91 6355230567</p>
        <p><strong>Address:</strong> Kheda 387411, Gujarat, India</p>
        </div>
</asp:Content>

