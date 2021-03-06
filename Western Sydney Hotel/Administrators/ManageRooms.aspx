﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="Western_Sydney_Hotel.Administrators.ManageRooms" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    <div class="container">
        <div class="col-md-8">

            <h3>Manage Rooms</h3>
            Page Time: <%= DateTime.Now.ToString("T") %>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="rid" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #FFFFFF;color: #284775;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="ridLabel" runat="server" Text='<%# Eval("rid") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="levelLabel" runat="server" Text='<%# Eval("level") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="bedsLabel" runat="server" Text='<%# Eval("beds") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="orientationLabel" runat="server" Text='<%# Eval("orientation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color: #999999;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CausesValidation="true" ValidationGroup="editValidate"/>
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="ridLabel1" runat="server" Text='<%# Eval("rid") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="levelTextBox" runat="server" Text='<%# Bind("level") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="levelTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The level field is required." ValidationGroup="editValidate"/>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="levelTextBox" Display="Dynamic"
                                        CssClass="text-danger" ValidationExpression="[G123]{1}" ErrorMessage="Level can only be 'G','1','2' and '3'" ValidationGroup="editValidate"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="bedsTextBox" runat="server" Text='<%# Bind("beds") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="bedsTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The beds field is required." ValidationGroup="editValidate"/>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="bedsTextBox" Display="Dynamic"
                                        CssClass="text-danger" ValidationExpression="[123]{1}" ErrorMessage="Beds can only be '1','2' and '3'" ValidationGroup="editValidate"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="orientationTextBox" runat="server" Text='<%# Bind("orientation") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="orientationTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The orientation field is required." ValidationGroup="editValidate"/>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="orientationTextBox" Display="Dynamic"
                                        CssClass="text-danger" ValidationExpression="[NWSE]{1}" ErrorMessage="Orientation can only be 'N','W','S' and 'E'" ValidationGroup="editValidate"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="priceTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The price field is required." ValidationGroup="editValidate"/>
                                    <asp:RangeValidator runat="server" ControlToValidate="priceTextBox" Display="Dynamic"
                                        CssClass="text-danger" Type="Double" MinimumValue="10.00" MaximumValue="1000.00" 
                                        ErrorMessage="The range must be between 10.00 and 1000.00." ValidationGroup="editValidate"/>
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CausesValidation="true" ValidationGroup="insertValidate"/>
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="ridTextBox" runat="server" Text='<%# Bind("rid") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ridTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The rid field is required." ValidationGroup="insertValidate"/>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="ridTextBox" Display="Dynamic"
                                        CssClass="text-danger" ValidationExpression="[G123]{1}[0-9]{2}" ErrorMessage="RoomID must follow format FNN where F is 'G','1','2' or '3' and NN is two digit room number" ValidationGroup="insertValidate"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="levelTextBox" runat="server" Text='<%# Bind("level") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="levelTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The level field is required." ValidationGroup="insertValidate"/>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="levelTextBox" Display="Dynamic"
                                        CssClass="text-danger" ValidationExpression="[G123]{1}" ErrorMessage="Level can only be 'G','1','2' and '3'" ValidationGroup="insertValidate"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="bedsTextBox" runat="server" Text='<%# Bind("beds") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="bedsTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The beds field is required." ValidationGroup="insertValidate"/>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="bedsTextBox" Display="Dynamic"
                                        CssClass="text-danger" ValidationExpression="[123]{1}" ErrorMessage="Beds can only be '1','2' and '3'" ValidationGroup="insertValidate"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="orientationTextBox" runat="server" Text='<%# Bind("orientation") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="orientationTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The orientation field is required." ValidationGroup="insertValidate"/>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="orientationTextBox" Display="Dynamic"
                                        CssClass="text-danger" ValidationExpression="[NWSE]{1}" ErrorMessage="Orientation can only be 'N','W','S' and 'E'" ValidationGroup="insertValidate"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="priceTextBox" Display="Dynamic"
                                        CssClass="text-danger" ErrorMessage="The price field is required." ValidationGroup="insertValidate"/>
                                    <asp:RangeValidator runat="server" ControlToValidate="priceTextBox" Display="Dynamic"
                                        CssClass="text-danger" Type="Double" MinimumValue="10.00" MaximumValue="1000.00" 
                                        ErrorMessage="The range must be between 10.00 and 1000.00." ValidationGroup="insertValidate"/>
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color: #E0FFFF;color: #333333;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="ridLabel" runat="server" Text='<%# Eval("rid") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="levelLabel" runat="server" Text='<%# Eval("level") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="bedsLabel" runat="server" Text='<%# Eval("beds") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="orientationLabel" runat="server" Text='<%# Eval("orientation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                                <th runat="server"></th>
                                                <th runat="server">rid</th>
                                                <th runat="server">level</th>
                                                <th runat="server">beds</th>
                                                <th runat="server">orientation</th>
                                                <th runat="server">price</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="ridLabel" runat="server" Text='<%# Eval("rid") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="levelLabel" runat="server" Text='<%# Eval("level") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="bedsLabel" runat="server" Text='<%# Eval("beds") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="orientationLabel" runat="server" Text='<%# Eval("orientation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
              
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\WesternHotel.mdf;Integrated Security=True" DeleteCommand="DELETE FROM [rooms] WHERE [rid] = @rid" InsertCommand="INSERT INTO [rooms] ([rid], [level], [beds], [orientation], [price]) VALUES (@rid, @level, @beds, @orientation, @price)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [rooms]" UpdateCommand="UPDATE [rooms] SET [level] = @level, [beds] = @beds, [orientation] = @orientation, [price] = @price WHERE [rid] = @rid">
                        <DeleteParameters>
                            <asp:Parameter Name="rid" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="rid" Type="String" />
                            <asp:Parameter Name="level" Type="String" />
                            <asp:Parameter Name="beds" Type="Byte" />
                            <asp:Parameter Name="orientation" Type="String" />
                            <asp:Parameter Name="price" Type="Double" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="level" Type="String" />
                            <asp:Parameter Name="beds" Type="Byte" />
                            <asp:Parameter Name="orientation" Type="String" />
                            <asp:Parameter Name="price" Type="Double" />
                            <asp:Parameter Name="rid" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>    
        </div>
    </div>


</asp:Content>
