<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewContract.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.ViewContract" %>

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
    <!-- Loading Container -->
    <div class="loading-container">
        <div class="loader"></div>
    </div>
    <!--  /Loading Container -->
    <form id="viewContract" runat="server">
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
                            <a href="StaffDashboard.aspx">
                                <i class="menu-icon glyphicon glyphicon-user"></i>
                                <span class="menu-text">Admin</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="StaffDashboard.aspx">
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
                <!-- Page Sidebar -->
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
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                <h5 class="row-title before-themeprimary"><i class="fa fa-folder themeprimary"></i>Maklumat Permohonan</h5>
                                <asp:Label ID="lblErrorMessage" Text="" ForeColor="Red" runat="server"></asp:Label>
                                <div id="tabbedwizard" class="wizard wizard-tabbed" data-target="#tabbedwizardsteps">
                                    <ul class="steps">
                                        <li data-target="#tabbedwizardstep1" class="active"><span class="step">1</span>Maklumat Pemohon<span class="chevron"></span></li>
                                        <li data-target="#tabbedwizardstep2"><span class="step">2</span>Maklumat Pendapatan<span class="chevron"></span></li>
                                        <li data-target="#tabbedwizardstep3"><span class="step">3</span>Taraf Perkahwinan<span class="chevron"></span></li>
                                        <li data-target="#tabbedwizardstep4"><span class="step">4</span>Maklumat Tanggungan<span class="chevron"></span></li>
                                        <li data-target="#tabbedwizardstep5"><span class="step">5</span>Maklumat Penempatan<span class="chevron"></span></li>
                                        <li data-target="#tabbedwizardstep6"><span class="step">6</span>Salinan Dokumen<span class="chevron"></span></li>
                                    </ul>

                                </div>
                                <div class="step-content" id="tabbedwizardsteps">
                                    <div class="step-pane active" id="tabbedwizardstep1">
                                        <div class="widget  radius-bordered">
                                            <div class="widget-header">
                                                <span class="widget-caption">Maklumat Pemohon</span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Nama Pemohon (Seperti dalam KP) <sup>*</sup></label>
                                                        <div class="col-lg-8">
                                                            <asp:TextBox ID="namaPemohon" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">No. KP Baru / KP Lama (Awam, Polis, Tentera) <sup>*</sup></label>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="icPemohon" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Alamat Surat Menyurat <sup>*</sup></label>
                                                        <div class="col-lg-8">
                                                            <asp:TextBox ID="alamatPemohon" CssClass="form-control" TextMode="MultiLine" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Poskod / Bandar <sup>*</sup></label>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="poskodPemohon" CssClass="form-control" TextMode="Number" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="bandarPemohon" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Negeri <sup>*</sup></label>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="negeriPemohon" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Tempat Kerja </label>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="tempatKerja" CssClass="form-control" Text="" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Alamat tempat Kerja </label>
                                                        <div class="col-lg-8">
                                                            <asp:TextBox ID="alamatKerja" CssClass="form-control" Text="" TextMode="MultiLine" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Poskod / Bandar <sup>*</sup></label>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="poskodKerja" CssClass="form-control" TextMode="Number" Text="" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="bandarKerja" CssClass="form-control" Text="" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Negeri <sup>*</sup></label>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="negeriKerja" CssClass="form-control" Text="" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">No Telefon Bimbit <sup>*</sup></label>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="telPemohon" CssClass="form-control" TextMode="Phone" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">No Telefon Pejabat</label>
                                                        <div class="col-lg-4">
                                                            <asp:TextBox ID="telPejabat" CssClass="form-control" Text="" TextMode="Phone" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <!--Tarikh Lahir-->
                                                    <div class="form-group">
                                                        <label class="col-lg-4 control-label">Tarikh Lahir / Negeri Tempat Lahir <sup>*</sup></label>
                                                        <div class="col-xs-3">
                                                            <asp:TextBox ID="dobPemohon" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                        <!--Negeri Tempat Lahir-->
                                                        <div class="col-xs-3">
                                                            <asp:TextBox ID="negeriLahir" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <!--Jantina-->
                                                    <label class="col-lg-4 control-label">Jantina<sup>*</sup></label>
                                                    <div class="row">
                                                        <div class="col-xs-3">
                                                            <asp:TextBox ID="Jantina" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <br />

                                                    <div class="form-group">
                                                        <!--Kaum-->
                                                        <label class="col-lg-4 control-label"></label>
                                                        <div class="col-xs-2">
                                                            <asp:TextBox ID="kaumList" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>

                                                        <div class="col-xs-2">
                                                            <!--Agama-->
                                                            <asp:TextBox ID="agamaList" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>

                                                        <div class="col-xs-2">
                                                            <!--Pekerjaan-->
                                                            <asp:TextBox ID="pekerjaanList" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <hr class="wide" />

                                                    <div id="InfoPasangan">
                                                        <div class="form-group">
                                                            <label class="col-lg-4 control-label">Nama Pasangan (Seperti dalam KP) <sup>*</sup></label>
                                                            <div class="col-lg-8">
                                                                <asp:TextBox ID="namaPasangan" CssClass="form-control" Text="" runat="server" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-lg-4 control-label">No KP Baru / KP Lama (Awam,Polis,Tentera) <sup>*</sup></label>
                                                            <div class="col-lg-8">
                                                                <asp:TextBox ID="icPasangan" CssClass="form-control" Text="" runat="server" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-lg-4 control-label">Alamat Tempat Kerja<sup>*</sup></label>
                                                            <div class="col-lg-8">
                                                                <asp:TextBox TextMode="MultiLine" ID="alamatPasangan" Text="" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-lg-4 control-label">Poskod / Bandar <sup>*</sup></label>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox ID="poskodPasangan" TextMode="Number" Text="" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox ID="bandarPasangan" CssClass="form-control" Text="" ReadOnly="true" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-lg-4 control-label">Negeri <sup>*</sup></label>
                                                            <div class="col-lg-4">
                                                                <asp:TextBox ID="negeriPasangan" Text="" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-lg-4 control-label">No. Telefon Bimbit<sup>*</sup></label>
                                                            <div class="col-lg-8">
                                                                <asp:TextBox ID="telPasangan" TextMode="Phone" ReadOnly="true" Text="" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-lg-4 control-label">Kecacatan (Jika Ada)</label>
                                                            <div class="col-lg-8">
                                                                <asp:TextBox ID="cacatPasangan" Text="" ReadOnly="true" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <hr class="wide" />
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="step-pane" id="tabbedwizardstep2">
                                        <div class="form-horizontal" id="pendapatanForm">
                                            <div class="form-group">
                                                <asp:Label ID="lblErrorPendapatan" Text="" ForeColor="Red" runat="server"></asp:Label>
                                                <label class="col-lg-4 control-label">Pendapatan Pemohon</label>
                                                <div class="col-lg-4 input-group">
                                                    <span class="input-group-addon">RM</span>
                                                    <asp:TextBox ID="pendapatanPemohon" CssClass="form-control" runat="server" Text="0.00" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Pendapatan Pasangan</label>
                                                <div class="col-lg-4 input-group">
                                                    <span class="input-group-addon">RM</span>
                                                    <asp:TextBox ID="pendapatanPasangan" CssClass="form-control" runat="server" Text="0.00" ReadOnly="true"></asp:TextBox>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Pendapatan Pemohon dan Pasangan</label>
                                                <div class="col-lg-4 input-group">
                                                    <span class="input-group-addon">RM</span>
                                                    <asp:TextBox ID="jumlahPendapatan" CssClass="form-control" runat="server" Text="0.00" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="step-pane" id="tabbedwizardstep3">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <!--Taraf Perkahwinan-->
                                                <asp:Label ID="lblErrorKahwin" Text="" ForeColor="Red" runat="server"></asp:Label>
                                                <label class="col-lg-4 control-label"></label>
                                                <div class="col-xs-2">
                                                    <asp:TextBox ID="tarafKahwin" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Kecacatan (Jika Ada)</label>
                                                <div class="col-lg-8">
                                                    <asp:TextBox ID="cacatKesihatan" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Masalah Kesihatan (Jika Ada)</label>
                                                <div class="col-lg-8">
                                                    <asp:TextBox ID="masalahKesihatan" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="step-pane" id="tabbedwizardstep4">
                                        <div id="butiranForm" class="form-horizontal">
                                            <asp:Label ID="lblErrorTanggungan" Text="" ForeColor="Red" runat="server"></asp:Label>
                                            <asp:GridView ID="viewTanggungan" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Font-Names="Century Gothic" Font-Size="12pt" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="IC_Ahli" HeaderText="NO Kad Pengenalan" />
                                                    <asp:BoundField DataField="Nama_Ahli" HeaderText="Nama" />
                                                    <asp:BoundField DataField="Hubungan_Ahli" HeaderText="Hubungan" />
                                                    <asp:BoundField DataField="DOB_Ahli" HeaderText="Tarikh Lahir" />
                                                    <asp:BoundField DataField="Jantina_Ahli" HeaderText="Jantina" />
                                                    <asp:BoundField DataField="Pendapatan_Ahli" HeaderText="Pendapatan(RM)" />
                                                </Columns>
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="step-pane" id="tabbedwizardstep5">
                                        <div id="mttForm" class="form-horizontal">
                                            <div class="form-group">
                                                <asp:Label ID="lblErrorTaraf" Text="" ForeColor="Red" runat="server"></asp:Label>
                                                <!--Taraf Rumah-->
                                                <label class="col-lg-4 control-label">Taraf Penempatan</label>
                                                <div class="col-xs-2">
                                                    <asp:TextBox ID="rumahPemohon" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Alamat<sup>*</sup></label>
                                                <div class="col-lg-8">
                                                    <asp:TextBox ID="alamatRumah" TextMode="MultiLine" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Poskod / Bandar <sup>*</sup></label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="poskodRumah" CssClass="form-control" TextMode="Number" runat="server" ReadOnly="true"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="bandarRumah" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Negeri <sup>*</sup></label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="negeriRumah" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="step-pane" id="tabbedwizardstep6">
                                        <div class="form-horizontal">
                                            <asp:GridView ID="viewSalinanIC" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Font-Names="Century Gothic" Font-Size="10pt" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="PemohonIC_Filename" HeaderText="Salinan IC Pemohon" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton Text="Download" ID="lnkICDownload" runat="server" OnClick="lnkICDownload_Click" CommandArgument='<%# Eval("PemohonIC_Filename") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:GridView ID="viewSalinanICP" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Font-Names="Century Gothic" Font-Size="10pt" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="PasanganIC_Filename" HeaderText="Salinan IC Pasangan" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton Text="Download" ID="lnkICPDownload" runat="server" OnClick="lnkICPDownload_Click" CommandArgument='<%# Eval("PasanganIC_Filename") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:GridView ID="viewSalinanLahir" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Font-Names="Century Gothic" Font-Size="10pt" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="LahirPemohon_Filename" HeaderText="Salinan Lahir Pemohon" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton Text="Download" ID="lnkLahirDownload" runat="server" OnClick="lnkLahirDownload_Click1" CommandArgument='<%# Eval("LahirPemohon_Filename") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:GridView ID="viewSalinanLahirP" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Font-Names="Century Gothic" Font-Size="10pt" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="LahirPasangan_Filename" HeaderText="Salinan Lahir Pasangan" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton Text="Download" ID="lnkLahirPDownload" runat="server" OnClick="lnkLahirPDownload_Click" CommandArgument='<%# Eval("LahirPasangan_Filename") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:GridView ID="viewSalinanGaji" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Font-Names="Century Gothic" Font-Size="10pt" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="Pendapatan_Filename" HeaderText="Salinan Pendapatan" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton Text="Download" ID="lnkGajiDownload" runat="server" OnClick="lnkGajiDownload_Click" CommandArgument='<%# Eval("Pendapatan_Filename") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:GridView ID="viewSalinanMajikan" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" Font-Names="Century Gothic" Font-Size="10pt" ShowHeaderWhenEmpty="True" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="Majikan_Filename" HeaderText="Salinan Pengesahan Majikan" />
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton Text="Download" ID="lnkMajikanDownload" runat="server" OnClick="lnkMajikanDownload_Click" CommandArgument='<%# Eval("Majikan_Filename") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="actions actions-footer" id="tabbedwizard-actions" style="right: 0; top: 0px">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-sm btn-prev"><i class="fa fa-angle-left"></i>Prev</button>
                                        <button type="button" class="btn btn-default btn-sm btn-next" data-last="Finish">Next<i class="fa fa-angle-right"></i></button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Page Body -->
                </div>
                <!-- /Page Content -->
            </div>
            <!-- /Page Container -->
            <!-- Main Container -->

        </div>
    </form>

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
