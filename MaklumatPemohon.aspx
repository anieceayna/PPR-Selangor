<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaklumatPemohon.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.MaklumatPemohon" %>

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
                                    <a class="btn btn-primary" href="#">Maklumat Pemohon</a>
                                    <a class="btn btn-default" href="Pendapatan.aspx">Maklumat Pendapatan</a>
                                    <a class="btn btn-default" href="StatusPemohon.aspx">Status Pemohon</a>
                                    <a class="btn btn-default" href="MaklumatTanggungan.aspx">Maklumat Tanggungan</a>
                                    <a class="btn btn-default" href="TarafTempat.aspx">Taraf Tempat Tinggal</a>
                                    <a class="btn btn-default" href="Dokumen.aspx">Salinan Dokumen</a>
                                </div>

                                <div class="widget  radius-bordered">
                                    <div class="widget-header">
                                        <span class="widget-caption">Maklumat Pemohon</span>
                                    </div>
                                    <div class="widget-body">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Nama Pemohon (Seperti dalam KP) <sup style="color: red">*</sup></label>
                                                <div class="col-lg-8">
                                                    <asp:TextBox ID="namaPemohon" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="namaPemohon" ID="requireNama" ErrorMessage="Nama perlu diisi" ToolTip="Nama perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">No. KP Baru / KP Lama (Awam, Polis, Tentera) <sup style="color: red">*</sup></label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="icPemohon" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="icPemohon" ID="requireIC" ErrorMessage="No Kad Pengenalan perlu diisi" ToolTip="No Kad Pengenalan perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Alamat Surat Menyurat <sup style="color: red">*</sup></label>
                                                <div class="col-lg-8">
                                                    <asp:TextBox ID="alamatPemohon" CssClass="form-control" placeholder="ALAMAT PEMOHON" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="alamatPemohon" ID="requireAlamat" ErrorMessage="Alamat Pemohon perlu diisi" ToolTip="Alamat Pemohon perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Poskod / Bandar <sup style="color: red">*</sup></label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="poskodPemohon" CssClass="form-control" TextMode="Number" placeholder="POSKOD" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="poskodPemohon" ID="requirePoskod" ErrorMessage="Poskod perlu diisi" ToolTip="Poskod perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="bandarPemohon" CssClass="form-control" placeholder="BANDAR" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="bandarPemohon" ID="requireBandar" ErrorMessage="Bandar perlu diisi" ToolTip="Bandar perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Negeri <sup style="color: red">*</sup></label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="negeriPemohon" CssClass="form-control" placeholder="NEGERI" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="negeriPemohon" ID="requireNegeri" ErrorMessage="Negeri perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Tempat Kerja </label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="tempatKerja" CssClass="form-control" placeholder="TEMPAT KERJA" Text="" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Alamat tempat Kerja </label>
                                                <div class="col-lg-8">
                                                    <asp:TextBox ID="alamatKerja" CssClass="form-control" placeholder="ALAMAT KERJA" Text="" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Poskod / Bandar </label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="poskodKerja" CssClass="form-control" TextMode="Number" placeholder="POSKOD" Text="" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="bandarKerja" CssClass="form-control" placeholder="BANDAR" Text="" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Negeri </label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="negeriKerja" CssClass="form-control" placeholder="NEGERI" Text="" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">No Telefon Bimbit <sup style="color: red">*</sup></label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="telPemohon" CssClass="form-control" placeholder="NO TELEFON PEMOHON" TextMode="Phone" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="telPemohon" ID="requireTel" ErrorMessage="No Telefon Bimbit perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">No Telefon Pejabat</label>
                                                <div class="col-lg-4">
                                                    <asp:TextBox ID="telPejabat" CssClass="form-control" placeholder="NO TEL PEJABAT" Text="" TextMode="Phone" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            <!--Tarikh Lahir-->
                                            <div class="form-group">
                                                <label class="col-lg-4 control-label">Tarikh Lahir / Negeri Tempat Lahir <sup style="color: red">*</sup></label>
                                                <div class="col-xs-3">
                                                    <asp:TextBox ID="dobPemohon" CssClass="form-control" placeholder="TARIKH LAHIR" TextMode="Date" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="dobPemohon" ID="requireDOB" ErrorMessage="Tarikh Lahir perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                                <!--Negeri Tempat Lahir-->
                                                <div class="col-xs-3">
                                                    <asp:TextBox ID="negeriLahir" CssClass="form-control" placeholder="NEGERI KELAHIRAN" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ControlToValidate="negeriLahir" ID="requireNLahir" ErrorMessage="Negeri Kelahiran perlu diisi" ForeColor="Red" runat="server"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <!--Jantina-->
                                            <label class="col-lg-4 control-label">Jantina<sup style="color: red">*</sup></label>
                                            <div class="row">
                                                <div class="col-xs-4">
                                                    <div class="radio">
                                                        <label>
                                                            <asp:RadioButton GroupName="form-field-radio" ID="Lelaki" runat="server" />
                                                            <span class="text">Lelaki</span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <asp:RadioButton GroupName="form-field-radio" ID="Perempuan" runat="server" />
                                                        <span class="text">Perempuan</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <br />

                                            <div class="form-group">
                                                <!--Kaum-->
                                                <label class="col-lg-4 control-label"></label>
                                                <div class="col-xs-2">
                                                    <div class="dropdown">
                                                        <asp:DropDownList ID="kaumList" runat="server">
                                                            <asp:ListItem Value="" Selected="True">Kaum</asp:ListItem>
                                                            <asp:ListItem Value="Melayu">Melayu</asp:ListItem>
                                                            <asp:ListItem Value="Cina">Cina</asp:ListItem>
                                                            <asp:ListItem Value="India">India</asp:ListItem>
                                                            <asp:ListItem Value="Lain-lain">Lain-lain</asp:ListItem>
                                                            <asp:ListItem Value="Bumiputera">Bumiputera Sabah / Sarawak</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-xs-2">
                                                    <!--Agama-->
                                                    <div class="dropdown">
                                                        <asp:DropDownList ID="agamaList" runat="server">
                                                            <asp:ListItem Value="" Selected="True">Agama</asp:ListItem>
                                                            <asp:ListItem Value="Islam">Islam</asp:ListItem>
                                                            <asp:ListItem Value="Kristian">Kristian</asp:ListItem>
                                                            <asp:ListItem Value="Budha">Budha</asp:ListItem>
                                                            <asp:ListItem Value="Hindu">Hindu</asp:ListItem>
                                                            <asp:ListItem Value="Lain-lain">Lain-lain</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-xs-2">
                                                    <!--Pekerjaan-->
                                                    <div class="dropdown">
                                                        <asp:DropDownList ID="pekerjaanList" runat="server">
                                                            <asp:ListItem Value="" Selected="True">Pekerjaan</asp:ListItem>
                                                            <asp:ListItem Value="Kerajaan">Kerajaan</asp:ListItem>
                                                            <asp:ListItem Value="Pesara P/T">Pesara Polis/Tentera</asp:ListItem>
                                                            <asp:ListItem Value="Berniaga">Berniaga</asp:ListItem>
                                                            <asp:ListItem Value="Swasta">Swasta</asp:ListItem>
                                                            <asp:ListItem Value="Tidak Bekerja">Tidak Bekerja</asp:ListItem>
                                                            <asp:ListItem Value="Pesara Kerajaan">Pesara Kerajaan</asp:ListItem>
                                                            <asp:ListItem Value="Lain-lain">Lain-lain</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="wide" />

                                            <div id="InfoPasangan">
                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">Nama Pasangan (Seperti dalam KP)</label>
                                                    <div class="col-lg-8">
                                                        <asp:TextBox ID="namaPasangan" CssClass="form-control" Text="" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">No KP Baru / KP Lama (Awam,Polis,Tentera)</label>
                                                    <div class="col-lg-8">
                                                        <asp:TextBox ID="icPasangan" CssClass="form-control" Text="" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">Alamat Tempat Kerja</label>
                                                    <div class="col-lg-8">
                                                        <asp:TextBox TextMode="MultiLine" ID="alamatPasangan" Text="" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">Poskod / Bandar</label>
                                                    <div class="col-lg-4">
                                                        <asp:TextBox ID="poskodPasangan" TextMode="Number" Text="" CssClass="form-control" placeholder="Poskod" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <asp:TextBox ID="bandarPasangan" CssClass="form-control" Text="" placeholder="Bandar" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">Negeri</label>
                                                    <div class="col-lg-4">
                                                        <asp:TextBox ID="negeriPasangan" Text="" placeholder="Negeri" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">No. Telefon Bimbit</label>
                                                    <div class="col-lg-8">
                                                        <asp:TextBox ID="telPasangan" TextMode="Phone" Text="" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-lg-4 control-label">Kecacatan (Jika Ada)</label>
                                                    <div class="col-lg-8">
                                                        <asp:TextBox ID="cacatPasangan" Text="" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr class="wide" />

                                            <div class="form-group">
                                                <asp:Label ID="lblErrorPemohon" Text="" ForeColor="Red" runat="server"></asp:Label>
                                                <div class="col-lg-8 col-lg-offset-4">
                                                    <asp:Button ID="simpanPemohon" OnClick="simpanPemohon_Click" runat="server" Text="Simpan" CausesValidation="False" />
                                                </div>
                                            </div>
                                        </div>

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
