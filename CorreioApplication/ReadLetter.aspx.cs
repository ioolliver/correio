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
    public partial class ReadLetter : System.Web.UI.Page
    {

        private int authorID;
        private int cartaID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedUserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (Session["CartaToReadID"] == null)
            {
                Response.Redirect("Home.aspx");
                return;
            }

            cartaID = int.Parse(Session["CartaToReadID"].ToString());

            DatabaseHelper db = new DatabaseHelper();
            DataRow carta = db.GetCartaInfo(cartaID);

            authorID = carta.Field<int>("id_remetente");
            string mensagemCarta = carta.Field<string>("mensagem");
            string authorName = carta.Field<string>("remetenteNome");
            string authorSala = carta.Field<string>("remetenteSala");

            LblMensagem.Text = mensagemCarta;
            LblAutor.Text = "Sent by: " + authorName + " " + FormatSalaString(authorSala);

        }

        private string FormatSalaString(string sala)
        {
            return sala[0] + "º" + sala.Substring(1).ToUpper();
        }

        protected void BtnMarkAsRead_Click(object sender, EventArgs e)
        {
            DatabaseHelper db = new DatabaseHelper();
            db.MarkCartaAsRead(cartaID);
        }

        protected void BtnReply_Click(object sender, EventArgs e)
        {
            Session["ReplyingTo"] = authorID;
            Response.Redirect("NewLetter.aspx");
        }
    }
}