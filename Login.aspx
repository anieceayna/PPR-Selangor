<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Log Masuk</title>

    <meta name="description" content="Dashboard" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon" />


    <!--Basic Styles-->
    <link type="text/css" href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" rel="stylesheet" />
    <link type="text/css" href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link type="text/css" href="assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="../fonts.googleapis.com/css@family=open+sans_3a300italic,400italic,600italic,700italic,400,600,700,300.css" rel="stylesheet" type="text/css" />
    <link href='../fonts.googleapis.com/css@family=roboto_3a400,300.css' rel='stylesheet' type='text/css' />


    <!--Beyond styles-->
    <link id="beyond-link" href="assets/css/beyond.min.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="assets/css/demo.min.css" rel="stylesheet" />
    <link type="text/css" href="assets/css/typicons.min.css" rel="stylesheet" />
    <link type="text/css" href="assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="assets/js/skins.min.js"></script>
</head>
<body>
    <form id="Login" runat="server">
        <div class="login-container animated fadeInDown">
            <div class="loginbox bg-white">
                <div class="loginbox-title">LOG MASUK PENGGUNA</div>
                <asp:Login ID="Login1" runat="server" OnAuthenticate="ValidateUser">
                    <LayoutTemplate>  
                        <div class="loginbox-textbox">
                            <asp:Label ID="UNLabel" runat="server" AssociatedControlID="UserName">No Kad Pengenalan</asp:Label>
                            <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UsernameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Masukkan No Kad Pengenalan." ToolTip="Masukkan No Kad Pengenalan." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="loginbox-textbox">
                            <asp:Label ID="PwLabel" runat="server" AssociatedControlID="Password">Kata Laluan</asp:Label>
                            <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Masukkan Kata Laluan." ToolTip="Masukkan Kata Laluan." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="loginbox-forgot">
                            <asp:CheckBox ID="RememberMe" runat="server" />
                        </div>
                        <div class="loginbox-forgot">
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </div>
                        <div class="loginbox-submit">
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log Masuk" ValidationGroup="Login1" CssClass="btn btn-primary btn-block" />
                        </div>
                        <div class="loginbox-signup">
                            <a href="Pendaftaran.aspx">Daftar Baharu</a>
                        </div>
                         <div class="loginbox-signup">
                            <a href="LogiStaff.aspx">Staff Login</a>
                        </div>
                    </LayoutTemplate>
                </asp:Login>
            </div>
        </div>
    </form>
    <div id="modal-welcome" class="modal modal-message fade" style="display: none;" aria-hidden="true">
        <img src="assets/img/logo-solo.png" alt="" data-dismiss="modal"/>
    </div>

    <!--Basic Scripts-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.js"></script>
</body>
</html>
