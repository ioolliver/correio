using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CorreioApplication.Database;

namespace CorreioApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedUserID"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void ButtonEntrar_Click(object sender, EventArgs e)
        {
            string email = InputEmail.Text;
            string password = InputPassword.Text;

            if (email.Trim().Length == 0) return;
            if (password.Trim().Length == 0) return;

            DatabaseHelper db = new DatabaseHelper();
            DataRow usuario = db.GetUsuarioByLogin(email, password);
            
            if(usuario == null)
            {
                LblAviso.Text = "Verify your login info.";
                return;
            }

            Session["LoggedUserID"] = usuario.Field<int>("id_usuario");
            Response.Redirect("Home.aspx");
        }
    }
}