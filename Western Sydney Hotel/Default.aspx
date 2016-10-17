<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Western_Sydney_Hotel._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div runat="server" id="AnonymousDiv" visible="false">
        <div class="jumbotron">
            Welcome to Western Sydney Hotel!<br />
            Western Sydney Hotel is a luxury 4 story hotel fitted with superior furnishings.<br />
            Our guests will be guaranteed the perfect accommodation experience.<br />
            Only our website has the best deals and prices, so book direct with us and save.<br />
            Stay for a night or stay for a while, you will be promised a luxury experience to remember forever when you choose Meriton Serviced Apartments.  
        </div>
    </div>

    <div runat="server" id="CustomersDiv" visible="false">
        <div class="jumbotron">
            Welcome to Western Sydney Hotel!<br />
            Here you can Search for your required Hotel Suite, Book rooms, and view current bookings.

        </div>
    </div>


    <div runat="server" id="AdministratorsDiv" visible="false">
        <div class="jumbotron">
            Welcome Administrator<br />
            Here you can Manage all bookings and view statistical information about bookings.
        
        </div>
    </div>
</asp:Content>
