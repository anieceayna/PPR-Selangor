using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class LogiStaff : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ValidateStaff(object sender, EventArgs e)
        {
            int userId = 0;
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("Validate_Staff", sqlCon))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_icstaff", LoginStaff.UserName);
                    cmd.Parameters.AddWithValue("_katalaluan", LoginStaff.Password);
                    sqlCon.Open();
                    var returnParameter = cmd.Parameters.Add("@returnCheck", MySqlDbType.Int32);
                    returnParameter.Direction = System.Data.ParameterDirection.ReturnValue;
                    cmd.ExecuteScalar();
                    userId = (int)returnParameter.Value;
                    sqlCon.Close();
                }
                switch (userId)
                {
                    case -1:
                        FormsAuthentication.SetAuthCookie(LoginStaff.UserName, LoginStaff.RememberMeSet);
                        FormsAuthentication.RedirectFromLoginPage(LoginStaff.UserName, LoginStaff.RememberMeSet);
                        Response.Redirect("~/StaffDashboard.aspx");                  
                        break;

                    case -2:
                        LoginStaff.FailureText = "Username and/or password is incorrect.";
                        break;

                }
            }
        }
    }

    
}