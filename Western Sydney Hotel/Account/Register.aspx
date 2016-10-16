<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Western_Sydney_Hotel.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <!-- Username/Email -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control input-md" placeholder="E-Mail Address" TextMode="Email" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="email" Display="Dynamic"
                    CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Email is not a valid format!" />
            </div>
        </div>

        <!-- Given Name -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Gname" CssClass="col-md-2 control-label">Given name</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox runat="server" ID="Gname" CssClass="form-control input-md" placeholder="Given name" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Gname" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Given name field is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Gname" Display="Dynamic"
                    CssClass="text-danger" ValidationExpression="^[a-zA-Z '-]+$" ErrorMessage="First Name must be English letters, apostrophe and hyphen only" />
            </div>
        </div>

        <!-- Surname -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Sname" CssClass="col-md-2 control-label">Surname</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <asp:TextBox runat="server" ID="Sname" CssClass="form-control input-md" placeholder="Surname" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Sname" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Surname field is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Sname" Display="Dynamic"
                    CssClass="text-danger" ValidationExpression="^[a-zA-Z '-]+$" ErrorMessage="First Name must be English letters, apostrophe and hyphen only" />
            </div>
        </div>

        <!-- Address -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                    <asp:TextBox runat="server" ID="Address" CssClass="form-control input-md" placeholder="Address" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Address field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Suburb" CssClass="col-md-2 control-label">Suburb</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                    <asp:TextBox runat="server" ID="Suburb" CssClass="form-control input-md" placeholder="Suburb" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Suburb" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="Suburb field is required." />
            </div>
        </div>

        <!-- State -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="State" CssClass="col-md-2 control-label">State</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
                    <asp:DropDownList ID="State" CssClass="form-control selectpicker" runat="server" Width="280px">
                        <asp:ListItem Value="-1">Please Select</asp:ListItem>
                        <asp:ListItem Value="ACT">Australian Capital Territory</asp:ListItem>
                        <asp:ListItem Value="NSW">New South Wales</asp:ListItem>
                        <asp:ListItem Value="NT">Northern Territory</asp:ListItem>
                        <asp:ListItem Value="QLD">Queensland</asp:ListItem>
                        <asp:ListItem Value="SA">South Australia</asp:ListItem>
                        <asp:ListItem Value="TAS">Tasmania</asp:ListItem>
                        <asp:ListItem Value="VIC">Victoria</asp:ListItem>
                        <asp:ListItem Value="WA">Western Australia</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="Please select a state" ControlToValidate="State" InitialValue="-1" />
            </div>
        </div>

        <!-- Postcode -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Postcode" CssClass="col-md-2 control-label">Postcode</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                    <asp:TextBox runat="server" ID="Postcode" CssClass="form-control input-md" MaxLength="4" placeholder="Postcode" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Postcode" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Postcode field is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Postcode" ValidationExpression = "^\d{4}$" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="Postcode must be a 4 digit number" />
            </div>
        </div>

        <!-- Mobile -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Mobile" CssClass="col-md-2 control-label">Mobile</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                    <asp:TextBox runat="server" ID="Mobile" CssClass="form-control input-md" MaxLength="10" placeholder="Mobile Number (04xxxxxxxx)" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Mobile" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The Mobile field is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Mobile" Display="Dynamic"
                    CssClass="text-danger" ValidationExpression = "^04\d{8}$" ErrorMessage="Phone number must be a 10 digit number starting with 04" />
            </div>
        </div>

        <!-- Password -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control input-md" placeholder="Password" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" Display="Dynamic"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>

        <!-- Confirm Password -->
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control input-md" placeholder="Confirm Password" />
                </div>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

        <!-- Register -->
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

</asp:Content>
