
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>PHSSB | Dashboard</title>

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
    <div class="loading-container">
        <div class="loader"></div>
    </div>
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
                            <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text">Home </span>
                        </a>
                    </li>
                    <!--Databoxes-->
                    <li>
                        <a href="Permohonan PPR.aspx">
                            <i class="menu-icon fa fa-pencil-square-o"></i>
                            <span class="menu-text">Permohonan PPR </span>
                        </a>
                    </li>
                    <li>
                        <a href="Kemaskini.aspx">
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
                        <li class="active">Dashboard</li>
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
                        <a class="refresh" id="refresh-toggler" href="#">
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
                    <form id="Home" runat="server">
                        <div class="row">
                            <!--TABLE : PROFIL-->
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="orders-container">
                                    <div class="orders-header">
                                        <h6><b>PROFIL PENGGUNA</b></h6>
                                    </div>
                                    <div class="databox-row no-padding bg-ivory bordered-bottom-1 bordered-platinum silver" style="font-size: 12px;">
                                        <table class="table table-condensed table-striped">
                                            <tbody>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">NO KAD PENGENALAN</td>
                                                    <td>
                                                        <asp:TextBox ID="IC" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">NAMA PENUH</td>
                                                    <td>
                                                        <asp:TextBox ID="NamaPenuh" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true" Width="100%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">NO TELEFON</td>
                                                    <td>
                                                        <asp:TextBox ID="NoTel" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">EMEL</td>
                                                    <td>
                                                        <asp:TextBox ID="Emel" runat="server" BorderStyle="None" Font-Size="Large" ReadOnly="true" Width="100%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="padding-left-10" style="font-size: 16px">JUMLAH PROPERTI</td>
                                                    <td>
                                                        <asp:TextBox ID="Properti" runat="server" BorderStyle="None" Font-Size="Large" Text="0" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--TABLE : PROFIL END-->
                            <!--TABLE : BIL SEMASA-->
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <div class="orders-container">
                                    <div class="orders-header">
                                        <h6><b>BIL SEMASA</b></h6>
                                    </div>
                                    <div class="databox databox-xlg bg-yellow radius-bordered databox-shadowed padding-50">
                                        <span class="databox-text no-margin" style="font-size: large"><b>Jumlah Perlu Dibayar (RM)</b></span>
                                        <asp:TextBox ID="bilSemasa" CssClass="databox-number pull-right no-margin bg-yellow" BorderStyle="None" Text="0.00" runat="server" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="orders-footer">
                                        <a class="show-all" href="#" data-toggle="modal" data-target=".bs-example-modal-lg" style="font-size: 16px">Butiran</a>
                                    </div>
                                </div>
                            </div>
                            <!--TABLE : BIL SEMASA END-->
                        </div>
                        <div class="row">
                            <!--TABLE : SENARAI PROPERTI-->
                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                <div class="invoice-container">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <h3 class="">PROPERTI</h3>

                                        </div>
                                    </div>
                                    <!-- BIL LIST-->   
                                    <asp:GridView ID="viewProperty" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Font-Names="Century Gothic" Font-Size="10pt" ShowHeaderWhenEmpty="True" HorizontalAlign="Center" >                                        
                                        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <Columns>
                                            <asp:BoundField DataField="ID_Kontrak" HeaderText="No Kontrak">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Jenis_Kontrak" HeaderText="Jenis Kontrak">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
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
                                            <asp:BoundField DataField="Status_Kontrak" HeaderText="Status">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField> 
                                            <asp:BoundField DataField="Kawasan" HeaderText="Kawasan">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField> 
                                        </Columns>                                        
                                        <EditRowStyle HorizontalAlign="Center" />
                                        <EmptyDataRowStyle HorizontalAlign="Center" />
                                        <FooterStyle HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <SelectedRowStyle HorizontalAlign="Center" />
                                        
                                    </asp:GridView>
                                </div>
                            </div>
                            <!--TABLE : SENARAI PROPERTI END-->
                        </div>
                        <div class="row">
                            <asp:Button runat="server" Text="Logout" ID="LogoutBtn" OnClick="Logout_Click"/>
                        </div>
                    </form>



                </div>
                <!-- /Page Body -->
            </div>
            <!-- /Page Content -->
        </div>
        <!-- /Page Container -->
        <!-- Main Container -->

    </div>
    <!--Large Modal Templates-->
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myLargeModalLabel">Butiran </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12">
                            <div class="invoice-container">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h3 class="">Senarai Bil
                                        </h3>

                                    </div>
                                </div>
                                <!-- BIL LIST-->
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>
                                                <h5 class="no-margin-bottom">No Kontrak</h5>
                                            </th>
                                            <th>
                                                <h5 class="no-margin-bottom">Properti</h5>
                                            </th>
                                            <th>
                                                <h5 class="no-margin-bottom text-center">Status</h5>
                                            </th>
                                            <th>
                                                <h5 class="no-margin-bottom text-center">Jumlah</h5>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Article</td>
                                            <td><a href="#">Title of your article here</a></td>
                                            <td class="text-center">-</td>
                                            <td class="text-center">$200.00</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="invisible bg-snow"></td>
                                            <td class="text-center">Jumlah Keseluruhan</td>
                                            <td class="text-center">$1200.00 </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default">Bayar Sekarang</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <!--End Large Modal Templates-->
    <!--Basic Scripts-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.js"></script>
</body>
</html>
