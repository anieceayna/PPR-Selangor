<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Permohonan PPR.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.Permohonan_PPR" EnableEventValidation="false" %>

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
                        <a href="#">
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
                                    <a class="btn btn-primary" href="#">Syarat-Syarat</a>
                                    <a class="btn btn-default" href="MaklumatPemohon.aspx" >Maklumat Pemohon</a>
                                    <a class="btn btn-default" href="Pendapatan.aspx">Maklumat Pendapatan</a>
                                    <a class="btn btn-default" href="StatusPemohon.aspx">Status Pemohon</a>
                                    <a class="btn btn-default" href="MaklumatTanggungan.aspx">Maklumat Tanggungan</a>
                                    <a class="btn btn-default" href="TarafTempat.aspx">Taraf Tempat Tinggal</a>
                                    <a class="btn btn-default" href="Dokumen.aspx">Salinan Dokumen</a>
                                </div>
                                <div class="widget-body">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <div class="col-lg-8">
                                                <h5>SYARAT SYARAT PERMOHONAN
                                                                <br />
                                                    i) Warganegara Malaysia
                                                                <br />
                                                    ii) Berumur 18 tahun ke atas dan telah berkeluarga atau mempunyai tanggungan
                                                                <br />
                                                    iii) Pendapatan Seisi keluarga kurang dari RM 3,000.00
                                                                <br />
                                                    iv) Pemohon dan suami/isteri tinggal atau bekerja di Negeri Selangor, dan
                                                                <br />
                                                    v) Pemohon dan suami/isteri tidak memiliki tanah atau rumah dalam daerah atau mukim yang sama di mana PPR tersebut dibina.
                                                                <br />
                                                    vi) Penyewa - penyewa tidak dibenarkan memberi sewaan unit PPR kepada orang lain (sewa atas sewa). Jika ini berlaku maka unit PPR tersebut akan ditarik balik dan
                                                                <br />
                                                    sewaan dibatalkan serta merta.
                                                                <br />
                                                    vii) Tempoh penyewaan di PPR ialah selama 1 tahun dan hanya akan dilanjutkan sekiranya penyewa mempunyai rekod pembayaran yang baik, masih belum memiliki
                                                                <br />
                                                    rumah kekal dan penyewa atau ahli keluarga tiada rekod jenayah.
                                                </h5>

                                            </div>
                                        </div>
                                        <hr class="wide" />

                                        <div class=" form-group">
                                            <div class=" col-lg-8">
                                                <h5>
                                                    <br />
                                                    PERAKUAN PEMOHON
                                                                <br />
                                                    Saya dengan sesungguhnya dan sebenarnya mengaku bahawa saya membuat pengakuan ini dengan kepercayaan bahawa
                                                                <br />
                                                    apa apa maklumat yang diberikan adalah benar. Sekiranya didapti sebarang keterangan yang diberikan adalah palsu
                                                                <br />
                                                    maka pihak Perumahan dan Hartanah Selangor Sdn. Bhd. berhak membatalkan permohonan ini dan mengenakan tindakan
                                                                <br />
                                                    undang undang keatas diri saya.
                                                                <br />
                                                </h5>
                                            </div>

                                            <div class="col-lg-8">
                                                <div class="checkbox" style="width: 1556px">
                                                    <label>
                                                        <input type="checkbox" />
                                                        <span class="text">Saya berkata benar.</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <hr class="wide" style="margin-top: 0px" />
                                        <div class="form-group">
                                            <div class="col-lg-8 col-lg-offset-4">
                                                <asp:Button CssClass="btn btn-danger" ID="checkEligibility" runat="server" Text="Semak Kelayakan" OnClick="checkEligibility_Click" />
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

    <script type="text/javascript">       
        function CheckBoxRequired_ClientValidate(sender, e) {
            e.IsValid = jQuery(".AcceptedAgreement input:checkbox").is(':checked');
        }        
    </script>
</body>
</html>
