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
    public partial class NewLetter : System.Web.UI.Page
    {

        DataRow authorReplying;
        DatabaseHelper db;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedUserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            
            db = new DatabaseHelper();

            if(!IsPostBack)
            {

                if (Session["ReplyingTo"] != null)
                {
                    authorReplying = db.GetUsuarioByID(Session["ReplyingTo"].ToString());
                    string authorClass = authorReplying.Field<string>("sala").ToLower().Trim();
                    SelectClass(authorClass);
                }

                UpdateUsuarios();

                if (Session["ReplyingTo"] != null)
                {
                    SelectUser(Session["ReplyingTo"].ToString());
                    Session["ReplyingTo"] = null;
                }
            }

        }

        private void UpdateUsuarios()
        {
            ListaPeople.Items.Clear();
            string currentSala = FiltroSalas.SelectedValue;
            DataRowCollection users = db.GetUsuariosBySala(currentSala);
            for (int i = 0; i < users.Count; i++)
            {
                DataRow user = users[i];
                string user_id = user.Field<int>("id_usuario").ToString();
                if(user_id == Session["LoggedUserID"].ToString()) { continue; }
                ListItem item = new ListItem();
                item.Value = user_id;
                item.Text = user.Field<string>("nome");
                ListaPeople.Items.Add(item);
            }
        }

        private void SelectUser(string id)
        {
            for (int i = 0; i < ListaPeople.Items.Count; i++)
            {
                ListItem item = ListaPeople.Items[i];
                if (item.Value == id)
                {
                    item.Selected = true;
                    break;
                }
            }
        }

        private void SelectClass(string classToSet) {
            for (int i = 0; i < FiltroSalas.Items.Count; i++)
            {
                ListItem item = FiltroSalas.Items[i];
                item.Selected = false;
            }
            for (int i = 0; i < FiltroSalas.Items.Count; i++)
            {
                ListItem item = FiltroSalas.Items[i];
                if (item.Value == classToSet)
                {
                    item.Selected = true;
                    break;
                }
            }
        }

        protected void FiltroSalas_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateUsuarios();
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            if (ListaPeople.SelectedValue == "")
            {
                LblStatus.Text = "Select a person to send the correio.";
                return;
            }
            if(InputMensagem.Text.Trim().Length == 0)
            {
                LblStatus.Text = "Write a message on the left-side heart.";
                return;
            }

            int authorID = int.Parse(Session["LoggedUserID"].ToString());
            int receiverID = int.Parse(ListaPeople.SelectedValue);
            string mensagem = InputMensagem.Text;

            int rowsModified = db.EnviarCorreio(authorID, receiverID, mensagem);
            if(rowsModified > 0)
            {
                LblStatus.Text = "Correio sent!";
                InputMensagem.Text = "";
            }
            else
            {
                LblStatus.Text = "Couldn't send.";
            }
        }
    }
}