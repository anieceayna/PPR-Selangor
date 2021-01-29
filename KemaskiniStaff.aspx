<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KemaskiniStaff.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.KemaskiniStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Permohonan Perumahan Rakyat</title>

    <meta name="description" content="form wizard" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon" />

    <!--Basic Styles-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/ css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="../fonts.googleapis.com/css@family=open+sans_3a300italic,400italic,600italic,700italic,400,600,700,300.css" rel="stylesheet" type="text/css" />

    <!--Beyond styles-->
    <link id="beyond-link" href="assets/css/beyond.min.css" rel="stylesheet" />
    <link href="assets/css/demo.min.css" rel="stylesheet" />
    <link href="assets/css/typicons.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="assets/js/skins.min.js"></script>
</head>
<body>
    <form id="updateStaff" runat="server">
        <!-- Navbar -->
        <div class="navbar">
            <div class="navbar-inner">
                <div class="navbar-container">
                    <!-- Navbar Barnd -->
                    <div class="navbar-header pull-left">
                        <a href="#" class="navbar-brand">
                            <small>
                                <img src="assets/img/logo-ppr.png" />
                            </small>
                        </a>
                    </div>
                    <!-- /Navbar Barnd -->
                    <!-- Sidebar Collapse -->
                    <div class="sidebar-collapse" id="sidebar-collapse">
                        <i class="collapse-icon fa fa-bars"></i>

                    </div>
                    <!-- /Sidebar Collapse -->
                </div>
            </div>
        </div>
        <!-- /Navbar -->

        <div class="main-container container-fluid">
            <!-- Page Container -->
            <div class="page-container">

                <!-- Page Sidebar -->
                <div class="page-sidebar" id="sidebar">
                    <!-- Page Sidebar Header-->
                    <div class="sidebar-header-wrapper">
                    </div>
                    <!-- /Page Sidebar Header -->
                    <!-- Sidebar Menu -->
                    <ul class="nav sidebar-menu">
                        <!--Dashboard-->
                        <li class="active">
                            <a href="#">
                                <i class="menu-icon glyphicon glyphicon-user"></i>
                                <span class="menu-text">Admin</span>
                            </a>
                        </li>
                        <li>
                            <a href="StaffDashboard.aspx">
                                <i class="menu-icon glyphicon glyphicon-home"></i>
                                <span class="menu-text">Dashboard </span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="#">
                                <i class="menu-icon fa fa-pencil-square-o"></i>
                                <span class="menu-text">Kemaskini Maklumat </span>
                            </a>
                        </li>
                    </ul>
                    <!-- /Sidebar Menu -->
                </div>
                <!-- /Page Sidebar -->
                <!-- Page Content -->
                <div class="page-content">
                    <!-- Page Breadcrumb -->
                    <div class="page-breadcrumbs">
                        <ul class="breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>
                                <a href="#">Utama</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /Page Breadcrumb -->
                    <!-- Page Header -->
                    <div class="page-header position-relative">
                        <div class="header-title">
                            <h1>Kemaskini Maklumat</h1>
                        </div>
                        <!--Header Buttons-->
                        <div class="header-buttons">
                            <a class="sidebar-toggler" href="#">
                                <i class="fa fa-arrows-h"></i>
                            </a>
                            <a class="refresh" id="refresh-toggler" href="default.htm">
                                <i class="glyphicon glyphicon-refresh"></i>
                            </a>
                            <a class="fullscreen" id="fullscreen-toggler" href="#">
                                <i class="glyphicon glyphicon-fullscreen"></i>
                            </a>
                        </div>
                        <!--Header Buttons End-->
                    </div>
                    <!-- /Page Header -->
                    <!-- Page Body -->
                    <div class="page-body">
                        <div class="widget-header">
                            <span class="widget-caption" style="font-size: large"><b>Kemaskini Maklumat</b></span>
                        </div>
                        <asp:Label ID="lblErrorMessage" Text="" ForeColor="Red" runat="server"></asp:Label>
                        <div class="widget-body">
                            <div class="form-horizontal">
                                <asp:HiddenField ID="hfLoginID" runat="server" />
                                <label><b>Maklumat Pendaftaran</b></label>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">Nama Staff (Seperti dalam KP) <sup>*</sup></label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtSNama" CssClass="form-control" runat="server" ReadOnly="true" />

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">No. KP Baru / KP Lama (Awam, Polis, Tentera) <sup>*</sup></label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtSIC" CssClass="form-control" runat="server" ReadOnly="true" />

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">No. Telefon <sup>*</sup></label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="txtSTel" CssClass="form-control" runat="server" onchange="updateUser()" />
                                        <asp:RequiredFieldValidator ID="reqTel" ControlToValidate="txtSTel" ErrorMessage="No Telefon perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:HiddenField ID="hiddenPhone" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">Email<sup>*</sup></label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtSEmel" CssClass="form-control" runat="server" onchange="updateUser()" />
                                        <asp:RequiredFieldValidator ID="reqEmel" ControlToValidate="txtSEmel" ErrorMessage="Emel perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:HiddenField ID="hiddenEmel" runat="server" />

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">Alamat<sup>*</sup></label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtSAlamat" CssClass="form-control" runat="server" onchange="updateUser()" />
                                        <asp:RequiredFieldValidator ID="reqAlamat" ControlToValidate="txtSAlamat" ErrorMessage="Alamat perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:HiddenField ID="hiddenAlamat" runat="server" />

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">Poskod / Bandar / Negeri<sup>*</sup></label>
                                    <div class="col-xs-2">
                                        <asp:TextBox ID="txtSPoskod" CssClass="form-control" placeholder="POSKOD" runat="server" onchange="updateUser()" />
                                        <asp:RequiredFieldValidator ID="reqPoskod" ControlToValidate="txtSPoskod" ErrorMessage="Poskod perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:HiddenField ID="hiddenPoskod" runat="server" />
                                    </div>
                                    <div class="col-xs-2">
                                        <asp:TextBox ID="txtSBandar" CssClass="form-control" placeholder="BANDAR" runat="server" onchange="updateUser()" />
                                        <asp:RequiredFieldValidator ID="reqBandar" ControlToValidate="txtSBandar" ErrorMessage="Bandar perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:HiddenField ID="hiddenBandar" runat="server" />

                                    </div>
                                    <div class="col-xs-2">
                                        <asp:TextBox ID="txtSNegeri" CssClass="form-control" placeholder="NEGERI" runat="server" onchange="updateUser()" />
                                        <asp:RequiredFieldValidator ID="reqNegeri" ControlToValidate="txtSNegeri" ErrorMessage="Negeri perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:HiddenField ID="hiddenNegeri" runat="server" />

                                    </div>
                                </div>
                                <hr class=" wide" />

                                <div class="form-group">
                                    <label class="col-lg-4 control-label">Kata Laluan Lama<sup>*</sup></label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtKataLaluanLama" TextMode="Password" CssClass="form-control" runat="server" />
                                        <asp:HiddenField ID="hiddenPw" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">Kata Laluan Baharu<sup>*</sup></label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtKataLaluan" TextMode="Password" CssClass="form-control" runat="server" onchange="updateUser()" />
                                        <asp:HiddenField ID="hiddenNewPw" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-4 control-label">Sahkan Kata Laluan<sup>*</sup></label>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtConfirm" TextMode="Password" CssClass="form-control" runat="server" />
                                        <asp:CompareValidator ID="CompareValidator" runat="server" ControlToValidate="txtConfirm" ControlToCompare="txtKataLaluan" ErrorMessage="Kata Laluan mesti sama!" ToolTip="Kata Laluan mesti sama!" ForeColor="Red" />
                                    </div>
                                </div>
                                <hr class="wide" />
                                <asp:Button ID="btnSubmit" Text="Submit" CssClass="btn btn-info" OnClick="btnSubmit_Click" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
        </div>
    </form>

    <script>
        function updateUser() {
            var hiddenAlamat = document.getElementById('<%= hiddenAlamat. ClientID %>');
            var hiddenBandar = document.getElementById('<%= hiddenBandar. ClientID %>');
            var hiddenPoskod = document.getElementById('<%= hiddenPoskod. ClientID %>');
            var hiddenNegeri = document.getElementById('<%= hiddenNegeri. ClientID %>');
            var hiddenPhone = document.getElementById('<%= hiddenPhone. ClientID %>');
            var hiddenEmel = document.getElementById('<%= hiddenEmel. ClientID %>');
            var hiddenNewPw = document.getElementById('<%= hiddenNewPw. ClientID %>');

            var txtAlamat = document.getElementById('<%= txtSAlamat. ClientID %>');
            var txtPoskod = document.getElementById('<%= txtSPoskod. ClientID %>');
            var txtBandar = document.getElementById('<%= txtSBandar. ClientID %>');
            var txtNegeri = document.getElementById('<%= txtSNegeri. ClientID %>');
            var txtEmel = document.getElementById('<%= txtSEmel. ClientID %>');
            var txtTel = document.getElementById('<%= txtSTel. ClientID %>');
            var txtnewPw = document.getElementById('<%= txtKataLaluan. ClientID %>');

            hiddenAlamat.value = txtAlamat.value;
            hiddenPoskod.value = txtPoskod.value;
            hiddenBandar.value = txtBandar.value;
            hiddenNegeri.value = txtNegeri.value;
            hiddenPhone.value = txtTel.value;
            hiddenEmel.value = txtEmel.value;
            hiddenNewPw.value = txtnewPw.value;
        }
    </script>

    <!--Basic Scripts-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>

    <!--Page Related Scripts-->
    <script src="assets/js/fuelux/wizard/wizard-custom.js"></script>
    <script src="assets/js/toastr/toastr.js"></script>
</body>
</html>
