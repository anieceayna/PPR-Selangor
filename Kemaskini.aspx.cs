using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class Kemaskini : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            displayBack();
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
                    MySqlCommand sqlRead = new MySqlCommand("defaultKemaskini", sqlCon);
                    sqlRead.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlRead.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    using (MySqlDataReader myReader = sqlRead.ExecuteReader())
                    {
                        while (myReader.Read())
                        {
                            txtTel.Text = hiddenPhone.Value;
                            txtAlamat.Text = hiddenAlamat.Value;
                            txtPoskod.Text = hiddenPoskod.Value;
                            txtBandar.Text = hiddenBandar.Value;
                            txtNegeri.Text = hiddenNegeri.Value;
                            txtKataLaluan.Text = hiddenPw.Value;
                            txtNama.Text = (myReader["Nama_Pengguna"].ToString());
                            txtIC.Text = (myReader["IC_Pengguna"].ToString());
                            txtTel.Text = (myReader["Tel_Pengguna"].ToString());
                            txtEmel.Text = (myReader["Emel_Pengguna"].ToString());
                            txtAlamat.Text = (myReader["Alamat_Pengguna"].ToString());
                            txtPoskod.Text = (myReader["Poskod_Pengguna"].ToString());
                            txtBandar.Text = (myReader["Bandar_Pengguna"].ToString());
                            txtNegeri.Text = (myReader["Negeri_Pengguna"].ToString());
                            txtKataLaluan.Text = (myReader["Kata_Laluan"].ToString());
                        }
                        myReader.Close();
                    }
                }
                else
                {
                    txtNama.Text = "checkIC salah la tu";
                }
                sqlCon.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    txtAlamat.Text = hiddenAlamat.Value;
                    txtPoskod.Text = hiddenPoskod.Value;
                    txtBandar.Text = hiddenBandar.Value;
                    txtNegeri.Text = hiddenNegeri.Value;
                    txtTel.Text = hiddenPhone.Value;
                    txtEmel.Text = hiddenEmel.Value;
                    txtKataLaluan.Text = hiddenNewPw.Value;
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("UpdatePengguna", sqlCon);
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    sqlCmd.Parameters.AddWithValue("_alamat", txtAlamat.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_poskod", Convert.ToInt32(txtPoskod.Text.Trim()));
                    sqlCmd.Parameters.AddWithValue("_bandar", txtBandar.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_negeri", txtNegeri.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_tel", txtTel.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_emel", txtEmel.Text.Trim());
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