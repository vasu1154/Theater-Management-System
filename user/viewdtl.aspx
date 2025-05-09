<%@ Page Title="" Language="C#" MasterPageFile="~/user/User.master" AutoEventWireup="true" CodeFile="viewdtl.aspx.cs" Inherits="user_viewdtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Styling the DetailsView control */
        .details-view 
        {
            
            max-width: 700px;
            margin: 30px auto;
            border: 1px solid #ddd;
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .details-view th,
        .details-view td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .details-view th {
            background-color: #007bff;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: bold;
        }

        .details-view tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .details-view tr:hover {
            background-color: #f1f1f1;
        }

        .details-view caption {
            font-size: 1.6rem;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
            text-align: center;
            padding: 10px;
            background-color: #f4f4f4;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        /* Styling for labels and images in the FooterTemplate */
        .movie-detail-label {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .movie-detail-image {
            max-width: 100%;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .movie-detail-container {
            text-align: center;
            margin-top: 20px;
        }

        /* Styling the movie description section */
        .movie-description {
            font-size: 1rem;
            color: #555;
            line-height: 1.5;
            margin-top: 20px;
        }

        .movie-description p {
            margin-bottom: 10px;
        }

        /* Styling the release date, duration, and language */
        .movie-meta-info {
            margin-top: 15px;
        }

        .movie-meta-info span {
            margin-right: 20px;
            font-size: 1rem;
            color: #777;
        }
        }
    .style1
    {
        
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div _designerregion="0">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="800px" 
            AutoGenerateRows="False" DataSourceID="SqlDataSource1" 
            CssClass="details-view">
            
            <FooterTemplate>
            <br />
                <strong><span class="style1">Title</span></strong> -
                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                <br />
        <br />
                <asp:Image ID="imgPoster" runat="server" ImageUrl='<%# Eval("PosterURL") %>' 
                    Height="450px" Width="350px" />
                <br />
                <br />
                <strong>Description</strong> -
                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                <br />
                <br />
                <strong>RelaseDate</strong> -
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ReleaseDate") %>'></asp:Label>
                <br />
                <br />
                <strong>Duration</strong> -
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Duration") %>'></asp:Label>
                Minutes<br />
                <br />
                <strong>Languages</strong> -
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Language") %>'></asp:Label>
                <br />
                <br />
                <strong>Ticket Price</strong> : 200 Rupees<br />
                <br />
                <br />
            </FooterTemplate>
        </asp:DetailsView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [Title], [Description], [ReleaseDate], [Duration], [Language], [PosterURL] FROM [Movies] WHERE ([MovieId] = @MovieId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MovieId" QueryStringField="MovieId" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </div>
</asp:Content>

