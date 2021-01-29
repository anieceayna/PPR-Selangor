using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Security;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class ViewContract : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {            
            displayMohonPasang();
            displayPendapatan();
            displayStatus();
            displayTanggungan();
            displayTempat();
            displayFile();
        }

        protected void displayMohonPasang()
        {
            using (MySqlConnection sqlViewPemohon = new MySqlConnection(connectionString))
            {
                sqlViewPemohon.Open();
                MySqlCommand sqlViewMohon = new MySqlCommand("ViewMaklumatPemohon", sqlViewPemohon);
                sqlViewMohon.CommandType = System.Data.CommandType.StoredProcedure;
                sqlViewMohon.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataReader myMohonReader = sqlViewMohon.ExecuteReader();
                while (myMohonReader.Read())
                {
                    namaPemohon.Text = (myMohonReader["Nama_Pengguna"].ToString());
                    icPemohon.Text = (myMohonReader["IC_Pengguna"].ToString());
                    alamatPemohon.Text = (myMohonReader["Alamat_Surat"].ToString());
                    poskodPemohon.Text = (myMohonReader["Poskod_Surat"].ToString());
                    bandarPemohon.Text = (myMohonReader["Bandar_Surat"].ToString());
                    negeriPemohon.Text = (myMohonReader["Negeri_Surat"].ToString());
                    tempatKerja.Text = (myMohonReader["Tempat_Kerja"].ToString());
                    alamatKerja.Text = (myMohonReader["Alamat_Kerja"].ToString());
                    poskodKerja.Text = (myMohonReader["Poskod_Kerja"].ToString());
                    bandarKerja.Text = (myMohonReader["Bandar_Kerja"].ToString());
                    negeriKerja.Text = (myMohonReader["Negeri_Kerja"].ToString());
                    telPemohon.Text = (myMohonReader["Tel_Pengguna"].ToString());
                    telPejabat.Text = (myMohonReader["Tel_Pejabat"].ToString());
                    dobPemohon.Text = (Convert.ToDateTime(myMohonReader["Tarikh_Lahir"]).ToString("dd-MMMM-yyyy"));
                    negeriLahir.Text = (myMohonReader["Negeri_Lahir"].ToString());
                    Jantina.Text = (myMohonReader["Jantina"].ToString());
                    kaumList.Text = (myMohonReader["Kaum"].ToString());
                    agamaList.Text = (myMohonReader["Agama"].ToString());
                    pekerjaanList.Text = (myMohonReader["Pekerjaan"].ToString());
                }
                myMohonReader.Close();

                MySqlCommand sqlViewPasangan = new MySqlCommand("ViewMaklumatPasangan", sqlViewPemohon);
                sqlViewPasangan.CommandType = System.Data.CommandType.StoredProcedure;
                sqlViewPasangan.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataReader myPasanganReader = sqlViewPasangan.ExecuteReader();
                while(myPasanganReader.Read())
                {
                    namaPasangan.Text = (myPasanganReader["Nama_Pasangan"].ToString());
                    icPasangan.Text = (myPasanganReader["IC_Pasangan"]).ToString();
                    alamatPasangan.Text = (myPasanganReader["AlamatK_Pasangan"].ToString());
                    poskodPasangan.Text = (myPasanganReader["Poskod_Pasangan"].ToString());
                    bandarPasangan.Text = (myPasanganReader["Bandar_Pasangan"].ToString());
                    negeriPasangan.Text = (myPasanganReader["Negeri_Pasangan"].ToString());
                    telPasangan.Text = (myPasanganReader["Tel_Pasangan"].ToString());
                    cacatPasangan.Text = (myPasanganReader["Kecacatan"].ToString());
                }
                myPasanganReader.Close();
                sqlViewPemohon.Close();
            }            
        }
        protected void displayPendapatan()
        {
            using (MySqlConnection sqlConGaji = new MySqlConnection(connectionString))
            {
                sqlConGaji.Open();
                MySqlCommand sqlViewGaji = new MySqlCommand("ViewMaklumatGaji", sqlConGaji);
                sqlViewGaji.CommandType = System.Data.CommandType.StoredProcedure;
                sqlViewGaji.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataReader myGajiReader = sqlViewGaji.ExecuteReader();
                while(myGajiReader.Read())
                {
                    pendapatanPemohon.Text = (myGajiReader["Pendapatan_Pengguna"].ToString());
                    pendapatanPasangan.Text = (myGajiReader["Pendapatan_Pasangan"].ToString());
                    jumlahPendapatan.Text = (myGajiReader["Pendapatan_Rumah"].ToString());
                }
                myGajiReader.Close();
                sqlConGaji.Close();
            }
        }
        protected void displayStatus()
        {
            using(MySqlConnection sqlConStatus = new MySqlConnection(connectionString))
            {
                sqlConStatus.Open();
                MySqlCommand sqlViewStatus = new MySqlCommand("ViewMaklumatStatus", sqlConStatus);
                sqlViewStatus.CommandType = System.Data.CommandType.StoredProcedure;
                sqlViewStatus.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataReader myStatusReader = sqlViewStatus.ExecuteReader();
                while(myStatusReader.Read())
                {
                    tarafKahwin.Text = (myStatusReader["Taraf_Perkahwinan"].ToString());
                    cacatKesihatan.Text = (myStatusReader["Kecacatan"].ToString());
                    masalahKesihatan.Text = (myStatusReader["Masalah_Kesihatan"].ToString());
                }
                myStatusReader.Close();
                sqlConStatus.Close();
            }
        }
        protected void displayTanggungan()
        {
            using(MySqlConnection sqlConFam = new MySqlConnection(connectionString))
            {
                sqlConFam.Open();
                MySqlCommand sqlViewFamily = new MySqlCommand("ViewMaklumatFamily", sqlConFam);
                sqlViewFamily.CommandType = System.Data.CommandType.StoredProcedure;
                sqlViewFamily.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = sqlViewFamily;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlDa.Fill(dtbl);
                viewTanggungan.DataSource = dtbl;
                viewTanggungan.DataBind();
            }
        }
        protected void displayTempat()
        {
            using(MySqlConnection sqlConTempat = new MySqlConnection(connectionString))
            {
                sqlConTempat.Open();
                MySqlCommand sqlViewTempat = new MySqlCommand("ViewMaklumatTempat", sqlConTempat);
                sqlViewTempat.CommandType = System.Data.CommandType.StoredProcedure;
                sqlViewTempat.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataReader myTempatReader = sqlViewTempat.ExecuteReader();
                while(myTempatReader.Read())
                {
                    rumahPemohon.Text = (myTempatReader["Taraf_Tempat"].ToString());
                    alamatRumah.Text = (myTempatReader["Alamat_Tempat"].ToString());
                    poskodRumah.Text = (myTempatReader["Poskod_Tempat"].ToString());
                    bandarRumah.Text = (myTempatReader["Bandar_Tempat"].ToString());
                    negeriRumah.Text = (myTempatReader["Negeri_Tempat"].ToString());
                }
                myTempatReader.Close();
                sqlConTempat.Close();
            }
        }
        protected void displayFile()
        {
            using (MySqlConnection sqlConGVIC = new MySqlConnection(connectionString))
            {
                sqlConGVIC.Open();
                MySqlCommand sqlGV = new MySqlCommand("ViewSalinanIC", sqlConGVIC);
                sqlGV.CommandType = System.Data.CommandType.StoredProcedure;
                sqlGV.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = sqlGV;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlDa.Fill(dtbl);
                viewSalinanIC.DataSource = dtbl;
                viewSalinanIC.DataBind();
                sqlConGVIC.Close();
            }

            using (MySqlConnection sqlConGVICP = new MySqlConnection(connectionString))
            {
                sqlConGVICP.Open();
                MySqlCommand sqlGVICP = new MySqlCommand("ViewSalinanICP", sqlConGVICP);
                sqlGVICP.CommandType = System.Data.CommandType.StoredProcedure;
                sqlGVICP.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = sqlGVICP;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlDa.Fill(dtbl);
                viewSalinanICP.DataSource = dtbl;
                viewSalinanICP.DataBind();
                sqlConGVICP.Close();
            }

            using (MySqlConnection sqlConGVLahir = new MySqlConnection(connectionString))
            {
                sqlConGVLahir.Open();
                MySqlCommand sqlGVLahir = new MySqlCommand("ViewSalinanLahir", sqlConGVLahir);
                sqlGVLahir.CommandType = System.Data.CommandType.StoredProcedure;
                sqlGVLahir.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = sqlGVLahir;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlDa.Fill(dtbl);
                viewSalinanLahir.DataSource = dtbl;
                viewSalinanLahir.DataBind();
                sqlConGVLahir.Close();
            }

            using (MySqlConnection sqlConGVLahirP = new MySqlConnection(connectionString))
            {
                sqlConGVLahirP.Open();
                MySqlCommand sqlGVLahirP = new MySqlCommand("ViewSalinanLahirP", sqlConGVLahirP);
                sqlGVLahirP.CommandType = System.Data.CommandType.StoredProcedure;
                sqlGVLahirP.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = sqlGVLahirP;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlDa.Fill(dtbl);
                viewSalinanLahirP.DataSource = dtbl;
                viewSalinanLahirP.DataBind();
                sqlConGVLahirP.Close();
            }

            using (MySqlConnection sqlConGVGaji = new MySqlConnection(connectionString))
            {
                sqlConGVGaji.Open();
                MySqlCommand sqlGVGaji = new MySqlCommand("ViewSalinanGaji", sqlConGVGaji);
                sqlGVGaji.CommandType = System.Data.CommandType.StoredProcedure;
                sqlGVGaji.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = sqlGVGaji;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlDa.Fill(dtbl);
                viewSalinanGaji.DataSource = dtbl;
                viewSalinanGaji.DataBind();
                sqlConGVGaji.Close();
            }

            using (MySqlConnection sqlConGVMajikan = new MySqlConnection(connectionString))
            {
                sqlConGVMajikan.Open();
                MySqlCommand sqlGVMajikan = new MySqlCommand("ViewSalinanMajikan", sqlConGVMajikan);
                sqlGVMajikan.CommandType = System.Data.CommandType.StoredProcedure;
                sqlGVMajikan.Parameters.AddWithValue("_icpengguna", Session["Value"].ToString());
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = sqlGVMajikan;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlDa.Fill(dtbl);
                viewSalinanMajikan.DataSource = dtbl;
                viewSalinanMajikan.DataBind();
                sqlConGVMajikan.Close();
            }
        }

        protected void lnkICDownload_Click(object sender, EventArgs e)
        {
            string Name = Convert.ToString((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string filename, contentType;
            using (MySqlConnection conICD = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmdICD = new MySqlCommand("DownloadIC", conICD))
                {
                    conICD.Open();
                    cmdICD.CommandType = System.Data.CommandType.StoredProcedure;
                    cmdICD.Parameters.AddWithValue("_icfilename", Name);                    
                    using (MySqlDataReader ICDReader = cmdICD.ExecuteReader())
                    {
                        ICDReader.Read();
                        bytes = (byte[])ICDReader["PemohonIC_Data"];
                        contentType = ICDReader["PemohonIC_Type"].ToString();
                        filename = ICDReader["PemohonIC_Filename"].ToString();
                    }
                    conICD.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void lnkICPDownload_Click(object sender, EventArgs e)
        {
            string Name = Convert.ToString((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string filename, contentType;
            using (MySqlConnection conICPD = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmdICPD = new MySqlCommand("DownloadICP", conICPD))
                {
                    conICPD.Open();
                    cmdICPD.CommandType = System.Data.CommandType.StoredProcedure;
                    cmdICPD.Parameters.AddWithValue("_icpfilename", Name);
                    using (MySqlDataReader ICPDReader = cmdICPD.ExecuteReader())
                    {
                        ICPDReader.Read();
                        bytes = (byte[])ICPDReader["PasanganIC_Data"];
                        contentType = ICPDReader["PasanganIC_Type"].ToString();
                        filename = ICPDReader["PasanganIC_Filename"].ToString();
                    }
                    conICPD.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void lnkLahirDownload_Click1(object sender, EventArgs e)
        {
            string Name = Convert.ToString((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string filename, contentType;
            using (MySqlConnection conLahirD = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmdLahirD = new MySqlCommand("DownloadLahir", conLahirD))
                {
                    conLahirD.Open();
                    cmdLahirD.CommandType = System.Data.CommandType.StoredProcedure;
                    cmdLahirD.Parameters.AddWithValue("_lahirfilename", Name);
                    using (MySqlDataReader LahirDReader = cmdLahirD.ExecuteReader())
                    {
                        LahirDReader.Read();
                        bytes = (byte[])LahirDReader["LahirPemohon_Data"];
                        contentType = LahirDReader["LahirPemohon_Type"].ToString();
                        filename = LahirDReader["LahirPemohon_Filename"].ToString();
                    }
                    conLahirD.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void lnkLahirPDownload_Click(object sender, EventArgs e)
        {
            string Name = Convert.ToString((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string filename, contentType;
            using (MySqlConnection conLahirPD = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmdLahirPD = new MySqlCommand("DownloadLahirP", conLahirPD))
                {
                    conLahirPD.Open();
                    cmdLahirPD.CommandType = System.Data.CommandType.StoredProcedure;
                    cmdLahirPD.Parameters.AddWithValue("_lahirpfilename", Name);
                    using (MySqlDataReader LahirPDReader = cmdLahirPD.ExecuteReader())
                    {
                        LahirPDReader.Read();
                        bytes = (byte[])LahirPDReader["LahirPasangan_Data"];
                        contentType = LahirPDReader["LahirPasangan_Type"].ToString();
                        filename = LahirPDReader["LahirPasangan_Filename"].ToString();
                    }
                    conLahirPD.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void lnkGajiDownload_Click(object sender, EventArgs e)
        {
            string Name = Convert.ToString((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string filename, contentType;
            using (MySqlConnection conGajiD = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmdGajiD = new MySqlCommand("DownloadGaji", conGajiD))
                {
                    conGajiD.Open();
                    cmdGajiD.CommandType = System.Data.CommandType.StoredProcedure;
                    cmdGajiD.Parameters.AddWithValue("_gajifilename", Name);
                    using (MySqlDataReader GajiReader = cmdGajiD.ExecuteReader())
                    {
                        GajiReader.Read();
                        bytes = (byte[])GajiReader["Pendapatan_Data"];
                        contentType = GajiReader["Pendapatan_Type"].ToString();
                        filename = GajiReader["Pendapatan_Filename"].ToString();
                    }
                    conGajiD.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void lnkMajikanDownload_Click(object sender, EventArgs e)
        {
            string Name = Convert.ToString((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string filename, contentType;
            using (MySqlConnection conMajikanD = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmdMajikanD = new MySqlCommand("DownloadMajikan", conMajikanD))
                {
                    conMajikanD.Open();
                    cmdMajikanD.CommandType = System.Data.CommandType.StoredProcedure;
                    cmdMajikanD.Parameters.AddWithValue("_majikanfilename", Name);
                    using (MySqlDataReader MajikanReader = cmdMajikanD.ExecuteReader())
                    {
                        MajikanReader.Read();
                        bytes = (byte[])MajikanReader["Majikan_Data"];
                        contentType = MajikanReader["Majikan_Type"].ToString();
                        filename = MajikanReader["Majikan_Filename"].ToString();
                    }
                    conMajikanD.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + filename);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }
    }
}