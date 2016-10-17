<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="Western_Sydney_Hotel.Customers.MyBookings" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <div class="container">
        <div class="col-md-8">

            <h3>My Bookings</h3>

            * Select a column to sort in ascending or descending order
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <SortedAscendingHeaderStyle CssClass="sortasc" />
                <SortedDescendingHeaderStyle CssClass="sortdesc" />
                <Columns>
                    <asp:BoundField DataField="gname" HeaderText="First Name" SortExpression="gname" />
                    <asp:BoundField DataField="sname" HeaderText="Last Name" SortExpression="sname" />
                    <asp:BoundField DataField="rid" HeaderText="Room ID" SortExpression="rid" />
                    <asp:BoundField DataField="checkin" HeaderText="Check-in" SortExpression="checkin" />
                    <asp:BoundField DataField="checkout" HeaderText="Check-out" SortExpression="checkout" />
                    <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                    <asp:BoundField DataField="btime" HeaderText="Booking Time" SortExpression="btime" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                <EmptyDataTemplate><h4>No Records Found!</h4></EmptyDataTemplate>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\WesternHotel.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT customers.gname, customers.sname, bookings.rid, bookings.checkin, bookings.checkout, bookings.cost, bookings.btime from customers, bookings where customers.username=bookings.username and (bookings.username = @username)">
                <SelectParameters>
                    <asp:Parameter Name="username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>


</asp:Content>
