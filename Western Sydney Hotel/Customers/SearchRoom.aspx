<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchRoom.aspx.cs" Inherits="Western_Sydney_Hotel.Customers.SearchRoom" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Load JQuery datepicker script -->
    <script src="../Scripts/jquery-ui.js"></script>
    <link href="../Scripts/jquery-ui.css" rel="stylesheet" />
    <script>
        $(function () {
            $("[id$=checkout]").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                minDate: new Date()
            });
        });

        $(function () {
            $("[id$=checkin]").datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                minDate: new Date()
            });
        });
    </script>

    <div class="form-horizontal">
        <h4>Search Room</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />


        <!-- Number of Beds -->
        <label class="col-md-2 control-label">
            Number of Beds
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select a number of beds" ControlToValidate="beds" InitialValue="-1" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
        </label>
        <div class="col-md-4 selectContainer">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                <asp:DropDownList ID="beds" class="form-control selectpicker" runat="server">
                    <asp:ListItem Value="-1">Please Select</asp:ListItem>
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row divider"></div>
        <br />

        <!-- Orientation Radio input-->
        <label class="col-md-2 control-label">
            Orientation
        </label>
        <div class="col-md-4 selectContainer">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                <asp:DropDownList ID="orientation" class="form-control selectpicker" runat="server">
                    <asp:ListItem Value="-1">Please Select</asp:ListItem>
                    <asp:ListItem Value="N">North</asp:ListItem>
                    <asp:ListItem Value="S">South</asp:ListItem>
                    <asp:ListItem Value="W">West</asp:ListItem>
                    <asp:ListItem Value="E">East</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row divider"></div>
        <br />

        <!-- Check In Date input-->
        <label class="col-md-2 control-label">
            Check-in Date
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Check-in date cannot be empty!" ControlToValidate="checkin" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidatorCheckinDate" ControlToValidate="checkin" OnServerValidate="checkinValidate" ErrorMessage="Check-in Date cannot be before today." runat="server" Display="Dynamic" ForeColor="Red">*</asp:CustomValidator>
        </label>
        <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                <asp:TextBox ID="checkin" name="checkin" placeholder="Check-in Date" class="form-control input-md" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="row divider"></div>
        <br />

        <!-- Check out Date input-->
        <label class="col-md-2 control-label">
            Check-out Date
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCheckoutDate" runat="server" ErrorMessage="Check-out date cannot be empty!" ControlToValidate="checkout" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidatorCheckoutDate" ControlToValidate="checkout" OnServerValidate="checkoutValidate" ErrorMessage="Check-out Date must be after check-in date!" runat="server" Display="Dynamic" ForeColor="Red">*</asp:CustomValidator>
        </label>
        <div class="col-md-4 inputGroupContainer">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                <asp:TextBox ID="checkout" name="checkout" placeholder="Check-out Date" class="form-control input-md" runat="server"></asp:TextBox>
            </div>
        </div>



    </div>

    <!-- Footer Navigation -->
    <div class="row divider">
        <div class="col-md-8 col-md-offset-2">
            <div class="pull-left"></div>
            <div class="pull-right">
                <asp:Button ID="submit" name="submit" class="btn btn-next btn-fill btn-success btn-wd btn-sm" runat="server" Text="Submit" OnClick="submit_Click" />
            </div>
        </div>
    </div>

    <br />
    <div class="row divider">
        <div class="col-md-8 col-md-offset-2">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="450px">
                <AlternatingRowStyle BackColor="White" />
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
            </asp:GridView>
        </div>
    </div>

    </asp:Content>
