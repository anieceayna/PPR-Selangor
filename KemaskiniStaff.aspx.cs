using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class KemaskiniStaff : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            displaySBack();
        }

        private void displaySBack()
        {
            using (MySqlConnection sqlConStaff = new MySqlConnection(connectionString))
            {
                sqlConStaff.Open();


                MySqlCommand sqlCheck = new MySqlCommand("CheckICStaff", sqlConStaff);
                sqlCheck.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCheck.Parameters.AddWithValue("_icstaff", User.Identity.Name);
                var returnParameter = sqlCheck.Parameters.Add("@returnCheck", MySqlDbType.Int32);
                returnParameter.Direction = System.Data.ParameterDirection.ReturnValue;
                sqlCheck.ExecuteScalar();
                int result = (int)returnParameter.Value;

                if (result == 1)
                {
                    MySqlCommand sqlRead = new MySqlCommand("DefaultKemaskiniStaff", sqlConStaff);
                    sqlRead.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlRead.Parameters.AddWithValue("_icstaff", User.Identity.Name);
                    using (MySqlDataReader myReader = sqlRead.ExecuteReader())
                    {
                        while (myReader.Read())
                        {
                            txtSTel.Text = hiddenPhone.Value;
                            txtSAlamat.Text = hiddenAlamat.Value;
                            txtSPoskod.Text = hiddenPoskod.Value;
                            txtSBandar.Text = hiddenBandar.Value;
                            txtSNegeri.Text = hiddenNegeri.Value;
                            txtKataLaluan.Text = hiddenPw.Value;
                            txtSNama.Text = (myReader["Nama_Staff"].ToString());
                            txtSIC.Text = (myReader["IC_Staff"].ToString());
                            txtSTel.Text = (myReader["Tel_Staff"].ToString());
                            txtSEmel.Text = (myReader["Emel_Staff"].ToString());
                            txtSAlamat.Text = (myReader["Alamat_Staff"].ToString());
                            txtSPoskod.Text = (myReader["Poskod_Staff"].ToString());
                            txtSBandar.Text = (myReader["Bandar_Staff"].ToString());
                            txtSNegeri.Text = (myReader["Negeri_Staff"].ToString());
                            txtKataLaluan.Text = (myReader["Kata_Laluan"].ToString());
                        }
                        myReader.Close();
                    }
                }
                sqlConStaff.Close();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    txtSAlamat.Text = hiddenAlamat.Value;
                    txtSPoskod.Text = hiddenPoskod.Value;
                    txtSBandar.Text = hiddenBandar.Value;
                    txtSNegeri.Text = hiddenNegeri.Value;
                    txtSTel.Text = hiddenPhone.Value;
                    txtSEmel.Text = hiddenEmel.Value;
                    txtKataLaluan.Text = hiddenNewPw.Value;
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("UpdateStaff", sqlCon);
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_icstaff", User.Identity.Name);
                    sqlCmd.Parameters.AddWithValue("_alamat", txtSAlamat.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_poskod", Convert.ToInt32(txtSPoskod.Text.Trim()));
                    sqlCmd.Parameters.AddWithValue("_bandar", txtSBandar.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_negeri", txtSNegeri.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_tel", txtSTel.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_emel", txtSEmel.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_katalaluan", txtKataLaluan.Text.Trim());
                    sqlCmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Rekod telah berjaya dikemaskini')</script>");


                }
            }
            catch (Exception E)
            {
                Response.Write("<script>alert(E.Message)</script>");
                lblErrorMessage.Text = E.Message;
            }
        }

    }
}