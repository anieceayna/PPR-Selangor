<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dokumen.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.Dokumen" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
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
    <!-- Loading Container -->
    <div class="loading-container">
        <div class="loader"></div>
    </div>
    <!--  /Loading Container -->
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
                    <i class="collapse-icon typcn typcn-th-menu"></i>
                </div>
                <!-- /Sidebar Collapse -->
                
            </div>
        </div>
    </div>
    <!-- /Navbar -->
    <!-- Main Container -->
    <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
                <!-- /Page Sidebar Header -->
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
                    <!--Dashboard-->
                    <li>
                        <a href="Home.aspx">
                            <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text">Utama </span>
                        </a>
                    </li>
                    <!--Databoxes-->
                    <li>
                        <a href="Permohonan PPR.aspx">
                            <i class="menu-icon typcn typcn-pencil"></i>
                            <span class="menu-text">Permohonan PPR </span>
                        </a>
                    </li>
                    <!--Widgets-->
                    <li>
                        <a href="Kemaskini.aspx">
                            <i class="menu-icon typcn typcn-pencil"></i>
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
                        <li class="active">Permohonan Perumahan Rakyat
                        </li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                    <!--Header Buttons-->
                    <div class="header-buttons">
                        <a class="sidebar-toggler" href="#">
                            <i class="glyphicon glyphicon-resize-horizontal"></i>
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
                    <form id="form1" runat="server">
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                <h5 class="row-title before-themeprimary"><i class="fa fa-folder themeprimary"></i>Permohonan</h5>
                                <asp:Label ID="lblErrorMessage" Text="" ForeColor="Red" runat="server"></asp:Label>
                                <div>
                                    <a class="btn btn-default" href="Permohonan PPR.aspx">Syarat-Syarat</a>
                                    <a class="btn btn-default" href="MaklumatPemohon.aspx">Maklumat Pemohon</a>
                                    <a class="btn btn-default" href="Pendapatam.aspx">Maklumat Pendapatan</a>
                                    <a class="btn btn-default" href="StatusPemohon.aspx">Status Pemohon</a>
                                    <a class="btn btn-default" href="MaklumatTanggungan.aspx">Maklumat Tanggungan</a>
                                    <a class="btn btn-default" href="TarafTempat.aspx">Taraf Tempat Tinggal</a>
                                    <a class="btn btn-primary" href="#">Salinan Dokumen</a>
                                </div>

                                <div class="widget-body">
                                    <div class="form-horizontal">
                                            <h5>Salinan Kad Pengenalan Pemohon</h5>
                                            <asp:FileUpload ID="salinanIC" runat="server" CssClass="file-input btn btn-azure btn-file" />
                                            <asp:Button ID="UploadICPemohon" OnClick="UploadICPemohon_Click" runat="server" Text="Upload" CausesValidation="False" />
                                            <h5>Salinan Kad Pengenalan Pasangan</h5>
                                            <asp:FileUpload ID="salinanICP" runat="server" CssClass="file-input btn btn-azure btn-file" />
                                            <asp:Button ID="UploadICPasangan" OnClick="UploadICPasangan_Click" runat="server" Text="Upload" CausesValidation="False" />
                                            <h5>Salinan Sijil Lahir Pemohon</h5>
                                            <asp:FileUpload ID="salinanSL" runat="server" CssClass="file-input btn btn-azure btn-file" />
                                            <asp:Button ID="uploadLahir" OnClick="uploadLahir_Click" runat="server" Text="Upload" CausesValidation="False" />
                                            <h5>Salinan Sijil Lahir Pasangan</h5>
                                            <asp:FileUpload ID="salinanSLP" runat="server" CssClass="file-input btn btn-azure btn-file" />
                                            <asp:Button ID="uploadLahirPasangan" OnClick="uploadLahirPasangan_Click" runat="server" Text="Upload" CausesValidation="False" />
                                            <h5>Salinan Penyata Pendapatan Pemohon dan Pasangan</h5>
                                            <asp:FileUpload ID="salinanGaji" runat="server" CssClass="file-input btn btn-azure btn-file" />
                                            <asp:Button ID="uploadGaji" OnClick="uploadGaji_Click" runat="server" Text="Upload" CausesValidation="False" />
                                            <h5>Surat Pengesahan Majikan</h5>
                                            <asp:FileUpload ID="salinanMajikan" runat="server" CssClass="file-input btn btn-azure btn-file" />
                                            <asp:Button ID="uploadMajikan" OnClick="uploadMajikan_Click" runat="server" Text="Upload" CausesValidation="False" />
                                        </div>
                                    <hr class="wide" />
                                    <div class="form-group">
                                    <asp:Label ID="lblErrorDokumen" Text="" ForeColor="Red" runat="server"></asp:Label>
                                    <div class="col-lg-8 col-lg-offset-4">
                                        <asp:Button ID="simpanPermohonan" runat="server" Text="Hantar" CssClass="btn btn-danger" OnClick="simpanPermohonan_Click" CausesValidation="False" />
                                    </div>
                                    &nbsp;
                                </div>
                                </div>
                                
                            </div>
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
