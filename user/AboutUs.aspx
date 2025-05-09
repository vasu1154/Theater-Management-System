<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="user_AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .about-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
            text-align: left;
        }

        .about-container h3 {
            text-align: center;
            margin-bottom: 15px;
        }

        .about-container p {
            margin: 10px 0;
        }

        .about-container .team-members {
            display: flex;
            justify-content: space-between;
        }

        .team-member 
        {
            align:center;
            width: 30%;
            text-align: center;
            padding: 10px;
        }

        .team-member img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="about-container">
        <h3>About Us</h3>
        <p>Welcome to our company. We are passionate about delivering high-quality services and products to our customers. Our team works tirelessly to ensure customer satisfaction and excellence.</p>
        
        <h4>Our Mission</h4>
        <p>Our mission is to provide innovative solutions and outstanding customer service, making a positive impact in every project we undertake.</p>

        <div class="team-members">
            <div class="team-member">
                <img src="https://via.placeholder.com/100" alt="Developer">
                <h5>Jaydeep Prajapati</h5>
                <p>CEO</p>
            </div>
        </div>
    </div>
</asp:Content>

