using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Security;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class Home : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            displayBack();
        }

        private void displayBack()
        {            
            using (MySqlConnection sqlConn = new MySqlConnection(connectionString))
            {
                sqlConn.Open();


                MySqlCommand sqlCheck = new MySqlCommand("CheckIC", sqlConn);
                sqlCheck.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCheck.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                var returnParameter = sqlCheck.Parameters.Add("@returnCheck", MySqlDbType.Int32);
                returnParameter.Direction = System.Data.ParameterDirection.ReturnValue;
                sqlCheck.ExecuteScalar();
                int result = (int)returnParameter.Value;

                if (result == 1)
                {
                    MySqlCommand sqlRead = new MySqlCommand("HomeProfile", sqlConn);
                    sqlRead.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlRead.Parameters.AddWithValue("_icpengguna", User.Identity.Name);

                    MySqlCommand sqlKRead = new MySqlCommand("HomeKontrak", sqlConn);
                    sqlKRead.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlKRead.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    MySqlDataReader myKReader = sqlKRead.ExecuteReader();
                    while(myKReader.Read())
                    {
                        Properti.Text = (myKReader["Properti"].ToString());
                    }
                    myKReader.Close();
                    using (MySqlDataReader myReader = sqlRead.ExecuteReader())
                    {
                        while (myReader.Read())
                        {
                            NamaPenuh.Text = (myReader["Nama_Pengguna"].ToString());
                            IC.Text = (myReader["IC_Pengguna"].ToString());
                            NoTel.Text = (myReader["Tel_Pengguna"].ToString());
                            Emel.Text = (myReader["Emel_Pengguna"].ToString());
                            
                        }
                        myReader.Close();
                    }

                    using(MySqlConnection sqlConGV = new MySqlConnection(connectionString))
                    {
                        sqlConGV.Open();
                        MySqlCommand sqlGV = new MySqlCommand("GVUser", sqlConGV);
                        sqlGV.CommandType = System.Data.CommandType.StoredProcedure;
                        sqlGV.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                        MySqlDataAdapter sqlDa = new MySqlDataAdapter();
                        sqlDa.SelectCommand = sqlGV;
                        System.Data.DataTable dtbl = new System.Data.DataTable();
                        sqlDa.Fill(dtbl);
                        viewProperty.DataSource = dtbl;
                        viewProperty.DataBind();
                    }

                    MySqlCommand sqlBill = new MySqlCommand("DisplayBill", sqlConn);
                    sqlBill.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlBill.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    MySqlDataReader myBillReader = sqlBill.ExecuteReader();
                    while (myBillReader.Read())
                    {
                        bilSemasa.Text = (myBillReader["Sewa_Unit"].ToString());
                    }
                    myBillReader.Close();
                }
                sqlConn.Close();
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        
    }

}