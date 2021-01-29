using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class StatusPemohon : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void simpanKahwin_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon5 = new MySqlConnection(connectionString))
                {
                    sqlCon5.Open();
                    MySqlCommand cmdGenS = new MySqlCommand("GenIDStatus", sqlCon5);
                    cmdGenS.CommandType = System.Data.CommandType.StoredProcedure;
                    string IDStatus = string.Empty;
                    using (MySqlDataReader dr = cmdGenS.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string i = dr[0].ToString();
                            if (i == "")
                                IDStatus = "S001";
                            else
                            {
                                int j = Convert.ToInt32(i);
                                j = j + 1;
                                IDStatus = "S00" + j.ToString();
                            }

                        }
                        dr.Close();
                    }
                    MySqlCommand sqlTaraf = new MySqlCommand("StatusPemohon", sqlCon5);
                    sqlTaraf.CommandType = System.Data.CommandType.StoredProcedure;

                    sqlTaraf.Parameters.AddWithValue("_idstatus", IDStatus);
                    sqlTaraf.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    sqlTaraf.Parameters.AddWithValue("_tarafperkahwinan", tarafKahwin.SelectedItem.Text.Trim());
                    sqlTaraf.Parameters.AddWithValue("_kecacatan", cacatKesihatan.Text.Trim());
                    sqlTaraf.Parameters.AddWithValue("_masalahkesihatan", masalahKesihatan.Text.Trim());
                    sqlTaraf.ExecuteNonQuery();
                    sqlCon5.Close();
                }
            }
            catch (Exception E)
            {
                lblErrorKahwin.Text = E.Message;
            }
        }
    }
}