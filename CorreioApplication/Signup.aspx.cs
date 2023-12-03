using CorreioApplication.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CorreioApplication
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedUserID"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        private bool isClassValid(string sala)
        {
            sala = sala.ToLower().Trim();
            if (sala[0] != '1' && sala[0] != '2' && sala[0] != '3') return false;
            string curso = sala.Substring(1);
            if (curso != "ds" && curso != "edi" && curso != "ma" && curso != "elo" && curso != "adm") return false;
            return true;
        }

        protected void ButtonEntrar_Click(object sender, EventArgs e)
        {
            string name = InputName.Text;
            string email = InputEmail.Text;
            string password = InputPassword.Text;
            string sala = ListSalas.SelectedValue.Trim().ToLower();

            if (name.Trim().Length == 0) return;
            if (email.Trim().Length == 0) return;
            if (password.Trim().Length == 0) return;

            DatabaseHelper db = new DatabaseHelper();
            int usuarioCreation = db.CreateAccount(name, email, password, sala);

            if (usuarioCreation == 0)
            {
                LblAviso.Text = "Someone is already using this e-mail.";
                return;
            }

            DataRow usuario = db.GetUsuarioByLogin(email, password);

            Session["LoggedUserID"] = usuario.Field<int>("id_usuario");
            Response.Redirect("Home.aspx");
        }
    }
}