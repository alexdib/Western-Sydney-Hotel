<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="Western_Sydney_Hotel.Administrators.Statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="container">
        <div class="col-md-8">

            <h3>Statistics</h3>

            
            <br />
            <div class="row divider">

                <label class="col-md-6 control-label">Please select how you would like the chart to be displayed</label>

                <!-- Chart Type -->
                <div class="col-md-3 selectContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open"></i></span>
                        <asp:DropDownList ID="charttype" class="form-control selectpicker" runat="server" AutoPostBack="True" onselectedindexchanged="charttype_SelectedIndexChanged">
                            <asp:ListItem Value="Column">Column</asp:ListItem>
                            <asp:ListItem Value="Pie">Pie</asp:ListItem>
                            <asp:ListItem Value="Line">Line</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Chart Dimension -->
                <div class="col-md-3 selectContainer">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-eye-open"></i></span>
                        <asp:DropDownList ID="chartdimension" class="form-control selectpicker" runat="server" AutoPostBack="True" onselectedindexchanged="chartdimension_SelectedIndexChanged">
                            <asp:ListItem Value="2D">2D</asp:ListItem>
                            <asp:ListItem Value="3D">3D</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                <Titles>
                    <asp:Title Font="Times New Roman, 12pt, style=Bold" Text="Number of bookings per Room ID"></asp:Title>
                </Titles>
                <Series>
                    <asp:Series Name="Series1" XValueMember="RoomID" YValueMembers="Bookings" ChartType="Column" IsValueShownAsLabel="true"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="RoomID"></AxisX>
                        <AxisY Title="Bookings"></AxisY>
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend BackColor="Transparent" Alignment="Center" Docking="Right" Font="Trebuchet MS, 8.25pt, style=Bold"
                        IsTextAutoFit="true" Name="Default" LegendStyle="Column">
                    </asp:Legend>
                </Legends>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\WesternHotel.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT rooms.rid as RoomID, Count(*) As Bookings FROM rooms INNER JOIN bookings ON rooms.rid=bookings.rid GROUP BY rooms.rid"></asp:SqlDataSource>

        </div>
    </div>

</asp:Content>
