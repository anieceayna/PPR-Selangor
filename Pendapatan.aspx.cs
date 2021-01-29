using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class Pendapatan : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void maklumatPendapatan_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon4 = new MySqlConnection(connectionString))
                {
                    sqlCon4.Open();
                    MySqlCommand cmdGenG = new MySqlCommand("GenIDGaji", sqlCon4);
                    cmdGenG.CommandType = System.Data.CommandType.StoredProcedure;
                    string IDGaji = string.Empty;
                    using (MySqlDataReader dr = cmdGenG.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string i = dr[0].ToString();
                            if (i == "")
                                IDGaji = "G001";
                            else
                            {
                                int j = Convert.ToInt32(i);
                                j = j + 1;
                                IDGaji = "G00" + j.ToString();
                            }

                        }
                        dr.Close();
                    }

                    MySqlCommand sqlPendapatan = new MySqlCommand("Pendapatan", sqlCon4);
                    sqlPendapatan.CommandType = System.Data.CommandType.StoredProcedure;

                    sqlPendapatan.Parameters.AddWithValue("_idpendapatan", IDGaji);
                    sqlPendapatan.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    sqlPendapatan.Parameters.AddWithValue("_gajipemohon", Convert.ToDouble(pendapatanPemohon.Text.Trim()));
                    sqlPendapatan.Parameters.AddWithValue("_gajipasangan", Convert.ToDouble(pendapatanPasangan.Text.Trim()));
                    jumlahPendapatan.Text = hiddenTotal.Value;
                    sqlPendapatan.Parameters.AddWithValue("_gajirumah", Convert.ToDouble(jumlahPendapatan.Text.Trim()));
                    sqlPendapatan.ExecuteNonQuery();
                    sqlCon4.Close();
                }
            }
            catch (Exception E)
            {
                lblErrorPendapatan.Text = E.Message;
            }
        }
    }
}