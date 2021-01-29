using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.Security;


namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class StaffDashboard : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayInfo();
        }

        private void DisplayInfo ()
        {
            using (MySqlConnection sqlConn = new MySqlConnection(connectionString))
            {
                sqlConn.Open();

                MySqlCommand staff = new MySqlCommand("StaffDashboard", sqlConn);
                staff.CommandType = System.Data.CommandType.StoredProcedure;
                staff.Parameters.AddWithValue("_icstaff", User.Identity.Name);
                MySqlDataReader myKReader = staff.ExecuteReader();

                while (myKReader.Read())
                {
                    ICStaff.Text = (myKReader["IC_Staff"].ToString());
                    IDStaff.Text = (myKReader["ID_Staff"].ToString());
                    NamaStaff.Text = (myKReader["Nama_Staff"].ToString());
                    NoTelStaff.Text = (myKReader["Tel_Staff"].ToString());
                    EmailStaff.Text = (myKReader["Emel_Staff"].ToString());
                }
                myKReader.Close();

                MySqlCommand kirakontrak = new MySqlCommand("KiraKontrak", sqlConn);
                kirakontrak.CommandType = System.Data.CommandType.StoredProcedure;
                MySqlDataReader mySReader = kirakontrak.ExecuteReader();

                while (mySReader.Read())
                {
                    TotalPenyewa.Text = (mySReader["countKontrak"].ToString());
                }
                mySReader.Close();

                using (MySqlConnection sqlConGV = new MySqlConnection(connectionString))
                {
                    sqlConGV.Open();
                    MySqlCommand sqlGV = new MySqlCommand("StatistikKerja", sqlConGV);
                    sqlGV.CommandType = System.Data.CommandType.StoredProcedure;
                    MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                    sqlDa.SelectCommand = sqlGV;
                    System.Data.DataTable dtbl = new System.Data.DataTable();
                    sqlDa.Fill(dtbl);
                    gvKerja.DataSource = dtbl;
                    gvKerja.DataBind();
                    sqlConGV.Close();
                }
            }
            
        }

        protected void lnkApprove_Click(object sender, EventArgs e)
        {
            string pprID = "";
            double pprPrice = 0.00;
            using (MySqlConnection sqlConn1 = new MySqlConnection(connectionString))
            {
                sqlConn1.Open();

                MySqlCommand slcPPR = new MySqlCommand("SelectCatalog", sqlConn1);
                slcPPR.CommandType = System.Data.CommandType.StoredProcedure;
                MySqlDataReader myPPRReader = slcPPR.ExecuteReader();

                while (myPPRReader.Read())
                {
                    pprID = (myPPRReader["ID_PPR"].ToString());
                    pprPrice = Convert.ToDouble((myPPRReader["Harga_Unit"].ToString()));
                }
                sqlConn1.Close();
            }
            using (MySqlConnection conUpdate = new MySqlConnection(connectionString))
            {
                string contractID = Convert.ToString((sender as LinkButton).CommandArgument);
                conUpdate.Open();
                MySqlCommand updatestatus = new MySqlCommand("UpdateStatusKontrak", conUpdate);
                updatestatus.CommandType = System.Data.CommandType.StoredProcedure;

                updatestatus.Parameters.AddWithValue("_status", "LULUS");
                updatestatus.Parameters.AddWithValue("_idkontrak", contractID.Trim());
                updatestatus.Parameters.AddWithValue("_icstaff", User.Identity.Name);
                updatestatus.Parameters.AddWithValue("_sewa", pprPrice);
                updatestatus.Parameters.AddWithValue("_idppr", pprID.Trim());
                updatestatus.ExecuteNonQuery();
                conUpdate.Close();
            }
        }

        protected void lnkDisapprove_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlConn2 = new MySqlConnection(connectionString))
            {
                string contractID = Convert.ToString((sender as LinkButton).CommandArgument);
                sqlConn2.Open();
                MySqlCommand updatestatus = new MySqlCommand("UpdateStatusGagal", sqlConn2);
                updatestatus.CommandType = System.Data.CommandType.StoredProcedure;

                updatestatus.Parameters.AddWithValue("_status", "GAGAL");
                updatestatus.Parameters.AddWithValue("_idkontrak", contractID.Trim());
                updatestatus.Parameters.AddWithValue("_icstaff", User.Identity.Name);
                updatestatus.ExecuteNonQuery();
                sqlConn2.Close();
            }
        }
        protected void viewDetails_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlConIC = new MySqlConnection(connectionString))
            {
                sqlConIC.Open();
                string contractID = Convert.ToString((sender as LinkButton).CommandArgument);
                MySqlCommand getIC = new MySqlCommand("GetICPemohon", sqlConIC);
                getIC.CommandType = System.Data.CommandType.StoredProcedure;
                getIC.Parameters.AddWithValue("_idkontrak", contractID.Trim());
                MySqlDataReader myICReader = getIC.ExecuteReader();
                while (myICReader.Read())
                {
                    Session["Value"] = (myICReader["IC_Pengguna"].ToString());
                }
                myICReader.Close();            
            }
            Response.Redirect("ViewContract.aspx");
                

        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}