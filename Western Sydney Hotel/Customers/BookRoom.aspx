<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookRoom.aspx.cs" Inherits="Western_Sydney_Hotel.Customers.BookRoom" %>


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
        <h4>Book Room</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />


        <!-- Room ID -->
        <label class="col-md-2 control-label">
            Room ID
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select a room id" ControlToValidate="roomid" InitialValue="-1" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidatorRoomValidate" ControlToValidate="roomid" OnServerValidate="roomValidate" ErrorMessage="Room is not available at the requested time. Please Try again." runat="server" Display="Dynamic" ForeColor="Red">*</asp:CustomValidator>
        </label>
        <div class="col-md-4 selectContainer">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                <asp:DropDownList ID="roomid" class="form-control selectpicker" runat="server">
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


        <!-- Footer Navigation -->
        <div class="row divider">
            <div class="col-md-8 col-md-offset-2">
                <div class="pull-left"></div>
                <div class="pull-right">
                    <asp:Button ID="submit" name="submit" class="btn btn-next btn-fill btn-success btn-wd btn-sm" runat="server" Text="Submit" OnClick="submit_Click" />
                </div>
            </div>
        </div>

    </div>
    
</asp:Content>
