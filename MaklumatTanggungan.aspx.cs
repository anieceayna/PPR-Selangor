using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class MaklumatTanggungan : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            displayTanggungan();
        }

        protected void displayTanggungan()
        {
            using (MySqlConnection sqlConGVTanggungan = new MySqlConnection(connectionString))
            {
                sqlConGVTanggungan.Open();
                MySqlCommand sqlGVTanggung = new MySqlCommand("GVTanggungan", sqlConGVTanggungan);
                sqlGVTanggung.CommandType = System.Data.CommandType.StoredProcedure;
                sqlGVTanggung.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                sqlDa.SelectCommand = sqlGVTanggung;
                System.Data.DataTable dtbl = new System.Data.DataTable();
                sqlDa.Fill(dtbl);
                viewFamily.DataSource = dtbl;
                viewFamily.DataBind();
            }
        }
        protected void SimpanTanggungan_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon6 = new MySqlConnection(connectionString))
                {
                    sqlCon6.Open();
                    MySqlCommand cmdGenT = new MySqlCommand("GenIDKeluarga", sqlCon6);
                    cmdGenT.CommandType = System.Data.CommandType.StoredProcedure;
                    string IDKeluarga = string.Empty;
                    using (MySqlDataReader dr = cmdGenT.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string i = dr[0].ToString();
                            if (i == "")
                                IDKeluarga = "F001";
                            else
                            {
                                int j = Convert.ToInt32(i);
                                j = j + 1;
                                IDKeluarga = "F00" + j.ToString();
                            }

                        }
                        dr.Close();
                    }

                    MySqlCommand sqlTanggungan = new MySqlCommand("MaklumatTanggungan", sqlCon6);
                    sqlTanggungan.CommandType = System.Data.CommandType.StoredProcedure;

                    if ((namaAhli.Text) != "")
                    {
                        sqlTanggungan.Parameters.AddWithValue("_idkeluarga", IDKeluarga);
                        sqlTanggungan.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        sqlTanggungan.Parameters.AddWithValue("_namaahli", namaAhli.Text.Trim().ToUpper());
                        sqlTanggungan.Parameters.AddWithValue("_hubunganahli", hubungan.Text.Trim().ToUpper());
                        sqlTanggungan.Parameters.AddWithValue("_dobahli", Convert.ToDateTime(dobKeluarga.Text).ToString("yyyy-MM-dd"));
                        sqlTanggungan.Parameters.AddWithValue("_icahli", icKeluarga.Text.Trim());
                        sqlTanggungan.Parameters.AddWithValue("_jantinaahli", jantinaKeluarga.Text.Trim().ToUpper());
                        sqlTanggungan.Parameters.AddWithValue("_pendapatanahli", Convert.ToDouble(pendapatanKeluarga.Text.Trim()));
                        sqlTanggungan.ExecuteNonQuery();
                        displayTanggungan();
                    }
                    sqlCon6.Close();
                }
            }
            catch (Exception E)
            {
                lblErrorTanggungan.Text = E.Message;
            }            
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            using(MySqlConnection sqlConDel = new MySqlConnection(connectionString))
            {
                string familyIC = Convert.ToString((sender as LinkButton).CommandArgument);
                sqlConDel.Open();
                MySqlCommand cmdDel = new MySqlCommand("DeleteTanggungan", sqlConDel);
                cmdDel.CommandType = System.Data.CommandType.StoredProcedure;
                cmdDel.Parameters.AddWithValue("_ickeluarga", familyIC.Trim());
                cmdDel.ExecuteNonQuery();
                displayTanggungan();
                sqlConDel.Close();
            }
            
        }
    }
}