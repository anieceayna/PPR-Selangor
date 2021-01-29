
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffDashboard.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.StaffDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>PHSSB | Staff Dashboard</title>

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
                    <li class="active">
                        <a href="#">
                            <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text">Dashboard </span>
                        </a>
                    </li>
                    <li>
                        <a href="KemaskiniStaff.aspx">
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
                        <h1>Dashboard
                        </h1>
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
                    <form id="StaffDashboard" runat="server">
                        <div class="row">
                            <!-- TABLE: PROFIL PENGGUNA -->
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="orders-container">
                                    <div class="orders-header">
                                        <h6><b>Profil Staff</b></h6>
                                    </div>
                                    <div class="databox-row no-padding bg-ivory bordered-bottom-1 bordered-platinum silver" style="font-size: 12px;">
                                        <table class="table table-condensed table-striped">
                                            <tbody>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">NO KAD PENGENALAN</td>
                                                    <td>
                                                        <asp:TextBox ID="ICStaff" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">NOMBOR STAFF</td>
                                                    <td>
                                                        <asp:TextBox ID="IDStaff" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">NAMA</td>
                                                    <td>
                                                        <asp:TextBox ID="NamaStaff" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true" Width="100%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">NOMBOR TELEFON</td>
                                                    <td>
                                                        <asp:TextBox ID="NoTelStaff" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">EMAIL</td>
                                                    <td>
                                                        <asp:TextBox ID="EmailStaff" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- RINGKASAN PERMOHONAN -->
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header border-transparent">
                                            <h3 class="card-title">Ringkasan Permohonan Sewa</h3>
                                            <!-- Ringkasan Permohonan Sewa -->
                                            <table class="table table-bordered table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <h4 class="no-margin-bottom" style="font-size: 16px">Permohonan Sewa</h4>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TotalPenyewa" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true" Text="0"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- STATISTIK KERJA -->
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header border-transparent">
                                    <h3 class="card-title">Statistik Kerja</h3>                                    
                                    <!--TESTING END-->
                                    <asp:GridView ID="gvKerja" runat="server" AutoGenerateColumns="False" ControlStyle-CssClass="table table-bordered table-striped" CssClass="table table-bordered table-striped" ShowHeaderWhenEmpty="True">
                                        <Columns>
                                            <asp:BoundField DataField="ID_Kontrak" HeaderText="ID KONTRAK" HeaderStyle-HorizontalAlign="Center"/>
                                            <asp:BoundField DataField="Jenis_Kontrak" HeaderText="JENIS KONTRAK" HeaderStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Status_Kontrak" HeaderText="STATUS "  HeaderStyle-HorizontalAlign="Center"/>
                                            <asp:BoundField DataField="Tarikh_Mula" HeaderText="Tarikh Mula">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Tarikh_Akhir" HeaderText="Tarikh Tamat">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Sewa_Unit" HeaderText="Jumlah (RM)">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Kawasan" HeaderText="Kawasan">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton Text="View" ID="viewDetails" CommandArgument='<%# Eval("ID_Kontrak") %>' OnClick="viewDetails_Click" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton Text="LULUS" ID="lnkApprove" CommandArgument='<%# Eval("ID_Kontrak") %>' OnClick="lnkApprove_Click" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton Text="GAGAL" ID="lnkDisapprove" CommandArgument='<%# Eval("ID_Kontrak") %>' OnClick="lnkDisapprove_Click" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <asp:Button runat="server" Text="Logout" ID="LogoutBtn" OnClick="Logout_Click"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--Basic Scripts-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>
</body>
</html>
