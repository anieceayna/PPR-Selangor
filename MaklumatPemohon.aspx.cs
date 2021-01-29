using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class MaklumatPemohon : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                displayBack();
            }
        }

        private void displayBack()
        {
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                sqlCon.Open();


                MySqlCommand sqlCheck = new MySqlCommand("CheckIC", sqlCon);
                sqlCheck.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCheck.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                var returnParameter = sqlCheck.Parameters.Add("@returnCheck", MySqlDbType.Int32);
                returnParameter.Direction = System.Data.ParameterDirection.ReturnValue;
                sqlCheck.ExecuteScalar();
                int result = (int)returnParameter.Value;

                if (result == 1)
                {
                    MySqlCommand sqlRead = new MySqlCommand("defaultPPR", sqlCon);
                    sqlRead.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlRead.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    using (MySqlDataReader myReader = sqlRead.ExecuteReader())
                    {
                        while (myReader.Read())
                        {
                            namaPemohon.Text = (myReader["Nama_Pengguna"].ToString());
                            icPemohon.Text = (myReader["IC_Pengguna"].ToString());
                            telPemohon.Text = (myReader["Tel_pengguna"].ToString());

                        }
                        myReader.Close();
                    }
                }
                sqlCon.Close();
            }
        }

        protected void simpanPemohon_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon2 = new MySqlConnection(connectionString))
                {
                    sqlCon2.Open();
                    MySqlCommand cmdGen = new MySqlCommand("GenIDPemohon", sqlCon2);
                    cmdGen.CommandType = System.Data.CommandType.StoredProcedure;
                    string genID = string.Empty;
                    using (MySqlDataReader dr = cmdGen.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string i = dr[0].ToString();
                            if (i == "")
                                genID = "A001";
                            else
                            {
                                int j = Convert.ToInt32(i);
                                j = j + 1;
                                genID = "A00" + j.ToString();
                            }

                        }
                        dr.Close();
                    }

                    MySqlCommand sqlPemohon = new MySqlCommand("MaklumatPemohon", sqlCon2);
                    sqlPemohon.CommandType = System.Data.CommandType.StoredProcedure;

                    sqlPemohon.Parameters.AddWithValue("_idmaklumat", genID);
                    sqlPemohon.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    sqlPemohon.Parameters.AddWithValue("_alamatsurat", alamatPemohon.Text.Trim().ToUpper());
                    sqlPemohon.Parameters.AddWithValue("_poskodsurat", Convert.ToInt32(poskodPemohon.Text.Trim()));
                    sqlPemohon.Parameters.AddWithValue("_bandarsurat", bandarPemohon.Text.Trim().ToUpper());
                    sqlPemohon.Parameters.AddWithValue("_negerisurat", negeriPemohon.Text.Trim().ToUpper());
                    if(tempatKerja.Text == "")
                    {
                        sqlPemohon.Parameters.AddWithValue("_tempatkerja", "");
                        sqlPemohon.Parameters.AddWithValue("_alamatkerja", "");
                        sqlPemohon.Parameters.AddWithValue("_poskodkerja", 0);
                        sqlPemohon.Parameters.AddWithValue("_bandarkerja", "");
                        sqlPemohon.Parameters.AddWithValue("_negerikerja", "");
                        sqlPemohon.Parameters.AddWithValue("_telpejabat", "");
                    }
                    else
                    {
                        sqlPemohon.Parameters.AddWithValue("_tempatkerja", tempatKerja.Text.Trim().ToUpper());
                        sqlPemohon.Parameters.AddWithValue("_alamatkerja", alamatKerja.Text.Trim().ToUpper());
                        sqlPemohon.Parameters.AddWithValue("_poskodkerja", Convert.ToInt32(poskodKerja.Text.Trim()));
                        sqlPemohon.Parameters.AddWithValue("_bandarkerja", bandarKerja.Text.Trim().ToUpper());
                        sqlPemohon.Parameters.AddWithValue("_negerikerja", negeriKerja.Text.Trim().ToUpper());
                        sqlPemohon.Parameters.AddWithValue("_telpejabat", telPejabat.Text.Trim());
                    }                    
                    sqlPemohon.Parameters.AddWithValue("_tarikhlahir", Convert.ToDateTime(dobPemohon.Text).ToString("yyyy-MM-dd"));
                    sqlPemohon.Parameters.AddWithValue("_negerilahir", negeriLahir.Text.Trim().ToUpper());
                    if (Lelaki.Checked)
                        sqlPemohon.Parameters.AddWithValue("_jantina", "LELAKI");
                    else if (Perempuan.Checked)
                        sqlPemohon.Parameters.AddWithValue("_jantina", "PEREMPUAN");
                    sqlPemohon.Parameters.AddWithValue("_kaum", kaumList.SelectedItem.Text.Trim().ToUpper());
                    sqlPemohon.Parameters.AddWithValue("_agama", agamaList.SelectedItem.Text.Trim().ToUpper());
                    sqlPemohon.Parameters.AddWithValue("_pekerjaan", pekerjaanList.SelectedItem.Text.Trim().ToUpper());
                    sqlPemohon.ExecuteNonQuery();

                    using (MySqlConnection sqlCon3 = new MySqlConnection(connectionString))
                    {
                        MySqlCommand cmdGenP = new MySqlCommand("GenIDPasangan", sqlCon2);
                        cmdGenP.CommandType = System.Data.CommandType.StoredProcedure;
                        string IDPasangan = string.Empty;
                        using (MySqlDataReader dr = cmdGenP.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string i = dr[0].ToString();
                                if (i == "")
                                    IDPasangan = "P001";
                                else
                                {
                                    int j = Convert.ToInt32(i);
                                    j = j + 1;
                                    IDPasangan = "P00" + j.ToString();
                                }

                            }
                            dr.Close();
                        }

                        if(namaPasangan.Text != "")
                        {
                            MySqlCommand sqlPasangan = new MySqlCommand("MaklumatPasangan", sqlCon2);
                            sqlPasangan.CommandType = System.Data.CommandType.StoredProcedure;

                            if (alamatPasangan.Text != "")
                            {
                                sqlPasangan.Parameters.AddWithValue("_idpasangan", IDPasangan);
                                sqlPasangan.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                                sqlPasangan.Parameters.AddWithValue("_namapasangan", namaPasangan.Text.Trim().ToUpper());
                                sqlPasangan.Parameters.AddWithValue("_icpasangan", icPasangan.Text.Trim());
                                sqlPasangan.Parameters.AddWithValue("_alamatpasangan", alamatPasangan.Text.Trim().ToUpper());
                                sqlPasangan.Parameters.AddWithValue("_poskodpasangan", Convert.ToInt32(poskodPasangan.Text.Trim()));
                                sqlPasangan.Parameters.AddWithValue("_bandarpasangan", bandarPasangan.Text.Trim().ToUpper());
                                sqlPasangan.Parameters.AddWithValue("_negeripasangan", negeriPasangan.Text.Trim().ToUpper());
                                sqlPasangan.Parameters.AddWithValue("_telpasangan", telPasangan.Text.Trim());

                            }
                            else
                            {
                                sqlPasangan.Parameters.AddWithValue("_idpasangan", IDPasangan);
                                sqlPasangan.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                                sqlPasangan.Parameters.AddWithValue("_namapasangan", namaPasangan.Text.Trim().ToUpper());
                                sqlPasangan.Parameters.AddWithValue("_icpasangan", icPasangan.Text.Trim());
                                sqlPasangan.Parameters.AddWithValue("_alamatpasangan", "");
                                sqlPasangan.Parameters.AddWithValue("_poskodpasangan", 0);
                                sqlPasangan.Parameters.AddWithValue("_bandarpasangan", "");
                                sqlPasangan.Parameters.AddWithValue("_negeripasangan", "");
                                sqlPasangan.Parameters.AddWithValue("_telpasangan", "");
                            }

                            if (cacatPasangan.Text != "")
                            {
                                sqlPasangan.Parameters.AddWithValue("_kecacatan", cacatPasangan.Text.Trim());
                            }
                            else
                            {
                                sqlPasangan.Parameters.AddWithValue("_kecacatan", "");
                            }
                            sqlPasangan.ExecuteNonQuery();
                        }
                        
                        
                        sqlCon3.Close();
                    }

                }
            }
            catch (Exception E)
            {
                lblErrorPemohon.Text = E.Message;
            }
        }
    }

    
}