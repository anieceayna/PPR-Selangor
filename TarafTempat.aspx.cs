using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class TarafTempat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void simpanTaraf_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon7 = new MySqlConnection(connectionString))
                {
                    sqlCon7.Open();
                    MySqlCommand cmdGenT = new MySqlCommand("GenIDTaraf", sqlCon7);
                    cmdGenT.CommandType = System.Data.CommandType.StoredProcedure;
                    string IDTaraf = string.Empty;
                    using (MySqlDataReader dr = cmdGenT.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string i = dr[0].ToString();
                            if (i == "")
                                IDTaraf = "T001";
                            else
                            {
                                int j = Convert.ToInt32(i);
                                j = j + 1;
                                IDTaraf = "T00" + j.ToString();
                            }

                        }
                        dr.Close();
                    }

                    MySqlCommand sqlRumah = new MySqlCommand("TarafPemohon", sqlCon7);
                    sqlRumah.CommandType = System.Data.CommandType.StoredProcedure;

                    sqlRumah.Parameters.AddWithValue("_idtempat", IDTaraf);
                    sqlRumah.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    sqlRumah.Parameters.AddWithValue("_taraftempat", rumahPemohon.SelectedItem.Text.Trim());
                    sqlRumah.Parameters.AddWithValue("_alamattempat", alamatRumah.Text.Trim().ToUpper());
                    sqlRumah.Parameters.AddWithValue("_poskodtempat", Convert.ToInt32(poskodRumah.Text.Trim()));
                    sqlRumah.Parameters.AddWithValue("_bandartempat", bandarRumah.Text.Trim().ToUpper());
                    sqlRumah.Parameters.AddWithValue("_negeritempat", negeriRumah.Text.Trim().ToUpper());
                    sqlRumah.ExecuteNonQuery();
                    sqlCon7.Close();
                }
            }
            catch (Exception E)
            {
                lblErrorTaraf.Text = E.Message;
            }
        }
    }
}