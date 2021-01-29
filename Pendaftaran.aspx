<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pendaftaran.aspx.cs" Inherits="Permohonan_Perumahan_Rakyat_Selangor.Pendaftaran" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>PPR Pendaftaran</title>

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

    <div class="navbar">
        <div class="navbar-container">
            <div class="navbar-header pull-left">
                <a href="#" class="navbar-brand">
                    <img src="assets/img/logo-phssb.png" alt="" />
                </a>
            </div>
        </div>

    </div>
    <hr />
    <div class=" page-body">
        <div class="widget  radius-bordered">
            <div class="widget-header">
                <span class="widget-caption" style="font-size:large"><b>Pendaftaran Baharu</b></span>
            </div>
            <asp:Label ID="lblErrorMessage" Text="" ForeColor="Red" runat="server"></asp:Label>
            <div class="widget-body">
                <form id="registrationtoggle" method="post" class="form-horizontal" runat="server">
                    <asp:HiddenField ID="hfPenggunaID" runat="server" />
                    <asp:HiddenField ID="hfLoginID" runat="server" />
                    <label><b>Maklumat Pendaftaran</b></label>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Nama Pemohon (Seperti dalam KP) <sup style="color: red">*</sup></label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtNama" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ID="reqNama" ControlToValidate="txtNama" ErrorMessage="Nama perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">No. KP Baru / KP Lama (Awam, Polis, Tentera) <sup style="color: red">*</sup></label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtIC" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ID="reqIC" ControlToValidate="txtIC" ErrorMessage="No Kad Pengenalan perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">No. Telefon <sup style="color: red">*</sup></label>
                        <div class="col-lg-4">
                            <asp:TextBox ID="txtTel" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ID="reqTel" ControlToValidate="txtBandar" ErrorMessage="No Telefon perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Email<sup style="color: red">*</sup></label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtEmel" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ID="reqEmel" ControlToValidate="txtEmel" ErrorMessage="Emel perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>


                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Alamat<sup style="color: red">*</sup></label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtAlamat" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ID="reqAlamat" ControlToValidate="txtAlamat" ErrorMessage="Alamat perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>


                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Poskod / Bandar / Negeri<sup style="color: red">*</sup></label>
                        <div class="col-xs-2">
                            <asp:TextBox ID="txtPoskod" CssClass="form-control" runat="server" placeholder="POSKOD" />
                            <asp:RequiredFieldValidator ID="reqPoskod" ControlToValidate="txtPoskod" ErrorMessage="Poskod perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>

                        </div>
                        <div class="col-xs-2">
                            <asp:TextBox ID="txtBandar" CssClass="form-control" runat="server" placeholder="BANDAR"/>
                            <asp:RequiredFieldValidator ID="reqBandar" ControlToValidate="txtBandar" ErrorMessage="Bandar perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>


                        </div>
                        <div class="col-xs-2">
                            <asp:TextBox ID="txtNegeri" CssClass="form-control" runat="server" placeholder="NEGERI"/>
                            <asp:RequiredFieldValidator ID="reqNegeri" ControlToValidate="txtNegeri" ErrorMessage="Negeri perlu di isi" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>


                        </div>
                    </div>

                    <hr class=" wide" />

                    <div class="form-group">
                        <label class="col-lg-4 control-label">Kata Laluan<sup style="color: red">*</sup></label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtKataLaluan" TextMode="Password" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ID="reqPw" ControlToValidate="txtKataLaluan" ErrorMessage="Sila masukkan Kata Laluan" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">Sahkan Kata Laluan<sup style="color: red">*</sup></label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtConfirm" TextMode="Password" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator ID="req2KataLaluan" ControlToValidate="txtConfirm" ErrorMessage="Sila ulang Kata Laluan" runat="server" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator" runat="server" ControlToValidate="txtConfirm" ControlToCompare="txtKataLaluan" ErrorMessage="Kata Laluan mesti sama!" ToolTip="Kata Laluan mesti sama!" ForeColor="Red" />
                        </div>
                    </div>
                    <hr class="wide" />
                    <div class="registerbox-textbox no-padding-bottom">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" required="required" />
                                <span class="text darkgray">
                                    <b>Saya dengan ini mengaku bahawa segala maklumat yang diberikan di dalam borang ini adalah benar. Sekiranya didapati maklumat
                                            yang diberikan adalah palsu dan tidak benar, pihak Kerajaan Negeri Selangor berhak mengambil tindakan undang-undang ke atas
                                            diri saya.
                                    </b>
                                </span>
                            </label>
                        </div>
                    </div>
                    <hr class=" wide" />
                    <asp:Button ID="btnSubmit" Text="Submit" CssClass="btn btn-info" OnClick="btnSubmit_Click" runat="server" />
                </form>
            </div>

        </div>

    </div>

    <!--Basic Scripts-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>
    <script src="assets/js/validation/bootstrapvalidator.js"></script>

    <script src="assets/js/bootbox/bootbox.js"></script>

    <script type="text/javascript" lang="javascript">
   <%--     function enableTextbox(checkbox) {
            var status = document.getElementById(checkbox).click();

            document.getElementById('<%= txtSNama.ClientID %>').disabled = false;
            document.getElementById('<%= txtSAlamat.ClientID %>').disabled = false;
            document.getElementById('<%= txtSPoskod.ClientID %>').disabled = false;
            document.getElementById('<%= txtSBandar.ClientID %>').disabled = false;
            document.getElementById('<%= txtSNegeri.ClientID %>').disabled = false;
            document.getElementById('<%= txtSTel.ClientID %>').disabled = false;



        }
        function disableTextbox(disabled) {

            document.getElementById('<%= txtSNama.ClientID %>').disabled = true;
            document.getElementById('<%= txtSAlamat.ClientID %>').disabled = true;
            document.getElementById('<%= txtSPoskod.ClientID %>').disabled = true;
            document.getElementById('<%= txtSBandar.ClientID %>').disabled = true;
            document.getElementById('<%= txtSNegeri.ClientID %>').disabled = true;
            document.getElementById('<%= txtSTel.ClientID %>').disabled = true;

            document.getElementById('<%= txtSNama.ClientID %>').textContent = "";
            document.getElementById('<%= txtSAlamat.ClientID %>').textContent = "";
            document.getElementById('<%= txtSPoskod.ClientID %>').textContent = "";
            document.getElementById('<%= txtSBandar.ClientID %>').textContent = "";
            document.getElementById('<%= txtSNegeri.ClientID %>').textContent = "";
            document.getElementById('<%= txtSTel.ClientID %>').textContent = "";
        }--%>
    </script>
</body>
</html>
