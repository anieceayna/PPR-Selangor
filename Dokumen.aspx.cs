using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.SessionState;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class Dokumen : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        string idIC = "", idICP = "", idSL = "", idSLP = "", idG = "", idM ="";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadICPemohon_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(salinanIC.PostedFile.FileName);
            string contentType = salinanIC.PostedFile.ContentType;
            using (Stream fs = salinanIC.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    using (MySqlConnection sqlCon8 = new MySqlConnection(connectionString))
                    {
                        sqlCon8.Open();

                        MySqlCommand cmdGenSIC = new MySqlCommand("GenIDSICPemohon", sqlCon8);
                        cmdGenSIC.CommandType = System.Data.CommandType.StoredProcedure;
                        string IDSIC = string.Empty;
                        using (MySqlDataReader dr = cmdGenSIC.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string i = dr[0].ToString();
                                if (i == "")
                                    IDSIC = "SC001";
                                else
                                {
                                    int j = Convert.ToInt32(i);
                                    j = j + 1;
                                    IDSIC = "SC00" + j.ToString();
                                }

                            }
                            dr.Close();
                        }
                        MySqlCommand cmdIC = new MySqlCommand("SalinanICPemohon", sqlCon8);
                        cmdIC.CommandType = System.Data.CommandType.StoredProcedure;
                        cmdIC.Parameters.AddWithValue("_idspemohon", IDSIC);
                        cmdIC.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        cmdIC.Parameters.AddWithValue("_icfilename", filename);
                        cmdIC.Parameters.AddWithValue("_icfiletype", contentType);
                        cmdIC.Parameters.AddWithValue("_icdata", bytes);
                        cmdIC.ExecuteNonQuery();
                        sqlCon8.Close();
                    }
                    br.Close();
                }
                fs.Close();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void UploadICPasangan_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(salinanICP.PostedFile.FileName);
            string contentType = salinanICP.PostedFile.ContentType;
            using (Stream fs = salinanICP.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    using (MySqlConnection sqlCon9 = new MySqlConnection(connectionString))
                    {
                        sqlCon9.Open();

                        MySqlCommand cmdGenSIC = new MySqlCommand("GenIDSICPasangan", sqlCon9);
                        cmdGenSIC.CommandType = System.Data.CommandType.StoredProcedure;
                        string IDSICP = string.Empty;
                        using (MySqlDataReader dr = cmdGenSIC.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string i = dr[0].ToString();
                                if (i == "")
                                    IDSICP = "SP001";
                                else
                                {
                                    int j = Convert.ToInt32(i);
                                    j = j + 1;
                                    IDSICP = "SP00" + j.ToString();
                                }

                            }
                            dr.Close();
                        }
                        idICP = IDSICP;
                        MySqlCommand cmdICP = new MySqlCommand("SalinanICPasangan", sqlCon9);
                        cmdICP.CommandType = System.Data.CommandType.StoredProcedure;
                        cmdICP.Parameters.AddWithValue("_idspasangan", IDSICP);
                        cmdICP.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        cmdICP.Parameters.AddWithValue("_icpasangan", "000523050032");
                        cmdICP.Parameters.AddWithValue("_icfilename", filename);
                        cmdICP.Parameters.AddWithValue("_icfiletype", contentType);
                        cmdICP.Parameters.AddWithValue("_icdata", bytes);
                        cmdICP.ExecuteNonQuery();
                        sqlCon9.Close();
                    }
                    br.Close();
                }
                fs.Close();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void uploadLahir_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(salinanSL.PostedFile.FileName);
            string contentType = salinanSL.PostedFile.ContentType;
            using (Stream fs = salinanSL.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    using (MySqlConnection sqlCon10 = new MySqlConnection(connectionString))
                    {
                        sqlCon10.Open();

                        MySqlCommand cmdGenSL = new MySqlCommand("GenIDLahir", sqlCon10);
                        cmdGenSL.CommandType = System.Data.CommandType.StoredProcedure;
                        string IDSL = string.Empty;
                        using (MySqlDataReader dr = cmdGenSL.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string i = dr[0].ToString();
                                if (i == "")
                                    IDSL = "SL001";
                                else
                                {
                                    int j = Convert.ToInt32(i);
                                    j = j + 1;
                                    IDSL = "SL00" + j.ToString();
                                }

                            }
                            dr.Close();
                        }
                        idSL = IDSL;
                        MySqlCommand cmdlahir = new MySqlCommand("SalinanLahirPemohon", sqlCon10);
                        cmdlahir.CommandType = System.Data.CommandType.StoredProcedure;
                        cmdlahir.Parameters.AddWithValue("_idlahir", IDSL);
                        cmdlahir.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        cmdlahir.Parameters.AddWithValue("_lahirfilename", filename);
                        cmdlahir.Parameters.AddWithValue("_lahirfiletype", contentType);
                        cmdlahir.Parameters.AddWithValue("_lahirdata", bytes);
                        cmdlahir.ExecuteNonQuery();
                        sqlCon10.Close();
                    }
                    br.Close();
                }
                fs.Close();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void uploadLahirPasangan_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(salinanSLP.PostedFile.FileName);
            string contentType = salinanSLP.PostedFile.ContentType;
            using (Stream fs = salinanSLP.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    using (MySqlConnection sqlCon11 = new MySqlConnection(connectionString))
                    {
                        sqlCon11.Open();

                        MySqlCommand cmdGenSLP = new MySqlCommand("GenIDLahirP", sqlCon11);
                        cmdGenSLP.CommandType = System.Data.CommandType.StoredProcedure;
                        string IDSB = string.Empty;
                        using (MySqlDataReader dr = cmdGenSLP.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string i = dr[0].ToString();
                                if (i == "")
                                    IDSB = "SB001";
                                else
                                {
                                    int j = Convert.ToInt32(i);
                                    j = j + 1;
                                    IDSB = "SB00" + j.ToString();
                                }

                            }
                            dr.Close();
                        }
                        idSLP = IDSB;
                        MySqlCommand cmdLahirP = new MySqlCommand("SalinanLahirPasangan", sqlCon11);
                        cmdLahirP.CommandType = System.Data.CommandType.StoredProcedure;
                        cmdLahirP.Parameters.AddWithValue("_idlahirp", IDSB);
                        cmdLahirP.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        cmdLahirP.Parameters.AddWithValue("_lahirfilename", filename);
                        cmdLahirP.Parameters.AddWithValue("_lahirfiletype", contentType);
                        cmdLahirP.Parameters.AddWithValue("_lahirdata", bytes);
                        cmdLahirP.ExecuteNonQuery();
                        sqlCon11.Close();
                    }
                    br.Close();
                }
                fs.Close();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void uploadGaji_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(salinanGaji.PostedFile.FileName);
            string contentType = salinanGaji.PostedFile.ContentType;
            using (Stream fs = salinanGaji.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    using (MySqlConnection sqlCon12 = new MySqlConnection(connectionString))
                    {
                        sqlCon12.Open();

                        MySqlCommand cmdGenSG = new MySqlCommand("GenIDSGaji", sqlCon12);
                        cmdGenSG.CommandType = System.Data.CommandType.StoredProcedure;
                        string IDSG = string.Empty;
                        using (MySqlDataReader dr = cmdGenSG.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string i = dr[0].ToString();
                                if (i == "")
                                    IDSG = "SG001";
                                else
                                {
                                    int j = Convert.ToInt32(i);
                                    j = j + 1;
                                    IDSG = "SG00" + j.ToString();
                                }

                            }
                            dr.Close();
                        }
                        idG = IDSG;
                        MySqlCommand cmdSGaji = new MySqlCommand("SalinanGaji", sqlCon12);
                        cmdSGaji.CommandType = System.Data.CommandType.StoredProcedure;
                        cmdSGaji.Parameters.AddWithValue("_idpendapatan", IDSG);
                        cmdSGaji.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        cmdSGaji.Parameters.AddWithValue("_pendapatanfilename", filename);
                        cmdSGaji.Parameters.AddWithValue("_pendapatanfiletype", contentType);
                        cmdSGaji.Parameters.AddWithValue("_pendapatandata", bytes);
                        cmdSGaji.ExecuteNonQuery();
                        sqlCon12.Close();
                    }
                    br.Close();
                }
                fs.Close();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void uploadMajikan_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(salinanMajikan.PostedFile.FileName);
            string contentType = salinanMajikan.PostedFile.ContentType;
            using (Stream fs = salinanMajikan.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    using (MySqlConnection sqlCon13 = new MySqlConnection(connectionString))
                    {
                        sqlCon13.Open();

                        MySqlCommand cmdGenSM = new MySqlCommand("GenIDMajikan", sqlCon13);
                        cmdGenSM.CommandType = System.Data.CommandType.StoredProcedure;
                        string IDSM = string.Empty;
                        using (MySqlDataReader dr = cmdGenSM.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string i = dr[0].ToString();
                                if (i == "")
                                    IDSM = "SM001";
                                else
                                {
                                    int j = Convert.ToInt32(i);
                                    j = j + 1;
                                    IDSM = "SM00" + j.ToString();
                                }

                            }
                            dr.Close();
                        }
                        idM = IDSM;
                        MySqlCommand cmdIC = new MySqlCommand("SalinanMajikan", sqlCon13);
                        cmdIC.CommandType = System.Data.CommandType.StoredProcedure;
                        cmdIC.Parameters.AddWithValue("_idmajikan", IDSM);
                        cmdIC.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        cmdIC.Parameters.AddWithValue("_majikanfilename", filename);
                        cmdIC.Parameters.AddWithValue("_majikanfiletype", contentType);
                        cmdIC.Parameters.AddWithValue("_majikandata", bytes);
                        cmdIC.ExecuteNonQuery();
                        sqlCon13.Close();
                    }
                    br.Close();
                }
                fs.Close();
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void simpanPermohonan_Click(object sender, EventArgs e)
        {
            try
            {
                using(MySqlConnection conSubmit = new MySqlConnection(connectionString))
                {
                    conSubmit.Open();
                    MySqlCommand cmdGen = new MySqlCommand("GenIDKontrak", conSubmit);
                    cmdGen.CommandType = System.Data.CommandType.StoredProcedure;
                    string genID = string.Empty;
                    using (MySqlDataReader dr = cmdGen.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string i = dr[0].ToString();
                            if (i == "")
                                genID = "K001";
                            else
                            {
                                int j = Convert.ToInt32(i);
                                j = j + 1;
                                genID = "K00" + j.ToString();
                            }

                        }
                        dr.Close();

                        string idPemohon = "";
                        MySqlCommand sqlIDPemohon = new MySqlCommand("RetrieveIDPemohon", conSubmit);
                        sqlIDPemohon.CommandType = CommandType.StoredProcedure;
                        sqlIDPemohon.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readIDPemohon = sqlIDPemohon.ExecuteReader();
                        while(readIDPemohon.Read())
                        {
                            idPemohon = (readIDPemohon["Maklumat_ID"].ToString());
                        }
                        readIDPemohon.Close();

                        string idPasangan = "";
                        MySqlCommand sqlIDPasangan = new MySqlCommand("RetrieveIDPasangan", conSubmit);
                        sqlIDPasangan.CommandType = CommandType.StoredProcedure;
                        sqlIDPasangan.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readIDPasangan = sqlIDPasangan.ExecuteReader();
                        while (readIDPasangan.Read())
                        {
                            idPasangan = (readIDPasangan["Pasangan_ID"].ToString());
                        }
                        readIDPasangan.Close();

                        string idPendapatan = "";
                        MySqlCommand sqlIDPendapatan = new MySqlCommand("RetrieveIDPendapatan", conSubmit);
                        sqlIDPendapatan.CommandType = CommandType.StoredProcedure;
                        sqlIDPendapatan.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readIDPendapatan = sqlIDPendapatan.ExecuteReader();
                        while (readIDPendapatan.Read())
                        {
                            idPendapatan = (readIDPendapatan["ID_Pendapatan"].ToString());
                        }
                        readIDPendapatan.Close();

                        string idStatus = "";
                        MySqlCommand sqlIDStatus = new MySqlCommand("RetrieveIDStatus", conSubmit);
                        sqlIDStatus.CommandType = CommandType.StoredProcedure;
                        sqlIDStatus.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readIDStatus = sqlIDStatus.ExecuteReader();
                        while (readIDStatus.Read())
                        {
                            idStatus = (readIDStatus["ID_Status"].ToString());
                        }
                        readIDStatus.Close();

                        string idTaraf = "";
                        MySqlCommand sqlIDTaraf = new MySqlCommand("RetrieveIDtaraf", conSubmit);
                        sqlIDTaraf.CommandType = CommandType.StoredProcedure;
                        sqlIDTaraf.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readIDTaraf = sqlIDTaraf.ExecuteReader();
                        while (readIDTaraf.Read())
                        {
                            idTaraf = (readIDTaraf["ID_Tempat"].ToString());
                        }
                        readIDTaraf.Close();
                                                
                        MySqlCommand sqlIDIC = new MySqlCommand("RetrieveICPemohon", conSubmit);
                        sqlIDIC.CommandType = CommandType.StoredProcedure;
                        sqlIDIC.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readIDIC = sqlIDIC.ExecuteReader();
                        while (readIDIC.Read())
                        {
                            idIC = (readIDIC["ID_ICPemohon"].ToString());
                        }
                        readIDIC.Close();

                        MySqlCommand sqlIDICP = new MySqlCommand("RetrieveICPasangan", conSubmit);
                        sqlIDICP.CommandType = CommandType.StoredProcedure;
                        sqlIDICP.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readIDICP = sqlIDICP.ExecuteReader();
                        while (readIDICP.Read())
                        {
                            idICP = (readIDICP["ID_ICPasangan"].ToString());
                        }
                        readIDICP.Close();

                        MySqlCommand sqlIDLahir = new MySqlCommand("RetrieveLahir", conSubmit);
                        sqlIDLahir.CommandType = CommandType.StoredProcedure;
                        sqlIDLahir.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readIDLahir = sqlIDLahir.ExecuteReader();
                        while (readIDLahir.Read())
                        {
                            idSL = (readIDLahir["ID_LahirPemohon"].ToString());
                        }
                        readIDLahir.Close();

                        MySqlCommand sqlIDLahirP = new MySqlCommand("RetrieveLahirPasangan", conSubmit);
                        sqlIDLahirP.CommandType = CommandType.StoredProcedure;
                        sqlIDLahirP.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readLahirPasangan = sqlIDLahirP.ExecuteReader();
                        while (readLahirPasangan.Read())
                        {
                            idSLP = (readLahirPasangan["ID_LahirPasangan"].ToString());
                        }
                        readLahirPasangan.Close();

                        MySqlCommand sqlPendapatan = new MySqlCommand("RetrievePendapatan", conSubmit);
                        sqlPendapatan.CommandType = CommandType.StoredProcedure;
                        sqlPendapatan.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readPendapatan = sqlPendapatan.ExecuteReader();
                        while (readPendapatan.Read())
                        {
                            idG = (readPendapatan["ID_Pendapatan"].ToString());
                        }
                        readPendapatan.Close();

                        MySqlCommand sqlMajikan = new MySqlCommand("RetrieveMajikan", conSubmit);
                        sqlMajikan.CommandType = CommandType.StoredProcedure;
                        sqlMajikan.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataReader readMajikan = sqlMajikan.ExecuteReader();
                        while (readMajikan.Read())
                        {
                            idM = (readMajikan["ID_Majikan"].ToString());
                        }
                        readMajikan.Close();

                        MySqlCommand sqlCreate = new MySqlCommand("CreateKontrak", conSubmit);
                        sqlCreate.CommandType = System.Data.CommandType.StoredProcedure;
                        sqlCreate.Parameters.AddWithValue("_idkontrak", genID);
                        sqlCreate.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        sqlCreate.Parameters.AddWithValue("_idpemohon", idPemohon);
                        sqlCreate.Parameters.AddWithValue("_idpasangan", idPasangan);
                        sqlCreate.Parameters.AddWithValue("_idpendapatan", idPendapatan);
                        sqlCreate.Parameters.AddWithValue("_idsalinanic", idIC);
                        sqlCreate.Parameters.AddWithValue("_idsalinanicp", idICP);
                        sqlCreate.Parameters.AddWithValue("_idsalinanlahir", idSL);
                        sqlCreate.Parameters.AddWithValue("_idsalinanlahirp", idSLP);
                        sqlCreate.Parameters.AddWithValue("_idsalinanmajikan", idM);
                        sqlCreate.Parameters.AddWithValue("_idsalinanpendapatan", idG);
                        sqlCreate.Parameters.AddWithValue("_idstatus", idStatus);
                        sqlCreate.Parameters.AddWithValue("_idtaraf", idTaraf);
                        sqlCreate.Parameters.AddWithValue("_jeniskontrak", "PPR");
                        sqlCreate.Parameters.AddWithValue("_statuskontrak", "PERMOHONAN");
                        sqlCreate.ExecuteNonQuery();
                    }
                }
            }
            catch(Exception E)
            {
                lblErrorDokumen.Text = E.Message;
            }
        }
    }
}