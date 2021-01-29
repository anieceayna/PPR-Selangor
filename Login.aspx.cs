using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using MySql.Data.MySqlClient;

namespace Permohonan_Perumahan_Rakyat_Selangor
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = @"Server=localhost;Database=phssb;Uid=root;Pwd=abc123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }

        protected void ValidateUser(object sender, EventArgs e)
        {
            int userId = 0;
            using (MySqlConnection sqlCon = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand("Validate_User",sqlCon))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("_icpengguna", Login1.UserName);
                    cmd.Parameters.AddWithValue("_katalaluan", Login1.Password);
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
                        if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                        {
                            FormsAuthentication.SetAuthCookie(Login1.UserName, Login1.RememberMeSet);
                            Response.Redirect(Request.QueryString["ReturnUrl"]);
                        }
                        else
                        {
                            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
                        }
                        break;
                        
                    case -2:
                        Login1.FailureText = "Username and/or password is incorrect.";
                        break;

                }
            }
        }
    }
}