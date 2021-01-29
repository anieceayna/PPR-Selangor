using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class Permohonan_PPR : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void checkEligibility_Click(object sender, EventArgs e)
        {
            using(MySqlConnection conEl = new MySqlConnection(connectionString))
            {
                conEl.Open();
                MySqlCommand sqlEl = new MySqlCommand("CheckEligibility", conEl);
                sqlEl.CommandType = System.Data.CommandType.StoredProcedure;
                sqlEl.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                var returnParameter = sqlEl.Parameters.Add("@returnCheck", MySqlDbType.Int32);
                returnParameter.Direction = System.Data.ParameterDirection.ReturnValue;
                sqlEl.ExecuteScalar();
                int result = (int)returnParameter.Value;
                if(result == 1)
                {
                    MySqlCommand sqlEl2 = new MySqlCommand("Check2ndEligibility", conEl);
                    sqlEl2.CommandType = System.Data.CommandType.StoredProcedure;
                    sqlEl2.Parameters.AddWithValue("_icpengguna", User.Identity.Name);
                    var return2Parameter = sqlEl2.Parameters.Add("@return2Check", MySqlDbType.Int32);
                    return2Parameter.Direction = System.Data.ParameterDirection.ReturnValue;
                    sqlEl2.ExecuteScalar();
                    int result2 = (int)return2Parameter.Value;
                    if(result2 == 0)
                    {
                        Response.Write("<script>alert('Anda telah membuat permohonan, sila semak status permohonan anda.')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Anda layak untuk memohon. Sila ke bahagian yang seterusnya.')</script>");
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Anda layak untuk memohon. Sila ke bahagian yang seterusnya.')</script>");
                }
                conEl.Close();
            }
            
        }
    }
    
}