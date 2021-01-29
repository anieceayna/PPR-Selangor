using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class Pendaftaran : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
                {
                    sqlCon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("RegisterPengguna", sqlCon);
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    MySqlCommand sqlCheck = new MySqlCommand("CheckIC", sqlCon);
                    sqlCheck.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlCheck.Parameters.AddWithValue("_icpengguna", txtIC.Text.Trim());
                    var returnParameter = sqlCheck.Parameters.Add("@returnCheck", MySqlDbType.Int32);
                    returnParameter.Direction = System.Data.ParameterDirection.ReturnValue;
                    sqlCheck.ExecuteScalar();
                    int result = (int)returnParameter.Value;
                    if (result == 0)
                    {
                        sqlCmd.Parameters.AddWithValue("_idpengguna", Convert.ToInt32(hfPenggunaID.Value == "" ? "0" : hfPenggunaID.Value));
                        sqlCmd.Parameters.AddWithValue("_logid", Convert.ToInt32(hfLoginID.Value == "" ? "0" : hfLoginID.Value));
                        sqlCmd.Parameters.AddWithValue("_nama", txtNama.Text.Trim().ToUpper());
                        sqlCmd.Parameters.AddWithValue("_ic", txtIC.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("_alamat", txtAlamat.Text.Trim().ToUpper());
                        sqlCmd.Parameters.AddWithValue("_poskod", Convert.ToInt32(txtPoskod.Text.Trim()));
                        sqlCmd.Parameters.AddWithValue("_bandar", txtBandar.Text.Trim().ToUpper());
                        sqlCmd.Parameters.AddWithValue("_negeri", txtNegeri.Text.Trim().ToUpper());
                        sqlCmd.Parameters.AddWithValue("_emel", txtEmel.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("_tel", txtTel.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("_katalaluan", txtKataLaluan.Text.Trim());
                        sqlCmd.Parameters.AddWithValue("_desc", "Pendaftaran");
                        sqlCmd.ExecuteNonQuery();
                        Clear();

                        Response.Write("<script>alert('Rekod telah berjaya didaftarkan')</script>");
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Anda telah mendaftar No Kad Pengenalan tersebut.Sila Log Masuk')</script>");
                    }


                }
            }
            catch (Exception E)
            {
                Response.Write("<script>alert(E.Message)</script>");
                lblErrorMessage.Text = E.Message;
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Clear();
        }

        void Clear()
        {
            hfPenggunaID.Value = "";
            hfLoginID.Value = "";
            txtNama.Text = txtIC.Text = txtEmel.Text = txtTel.Text = txtAlamat.Text = txtPoskod.Text = txtBandar.Text = txtNegeri.Text = "";
            btnSubmit.Text = "Submit";
        }

      
    }
}