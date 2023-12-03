using CorreioApplication.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CorreioApplication
{
    public partial class Home : System.Web.UI.Page
    {

        int userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedUserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            userID = int.Parse(Session["LoggedUserID"].ToString());

            UpdateUserInfo();
            UpdateEstatisticas();
            UpdateInbox();
        }

        private void LerCarta(object sender, EventArgs e)
        {
            Button btnSender = (Button) sender;
            Session["CartaToReadID"] = btnSender.ID;
            Response.Redirect("ReadLetter.aspx");
        }

        private void UpdateInbox()
        { 
            DatabaseHelper db = new DatabaseHelper();
            DataRowCollection cartas = db.GetCartasNaoLidas(userID);
            
            LblNotifications.Text = cartas.Count.ToString();
            
            HtmlGenericControl listaInbox = (HtmlGenericControl) FindControl("DivInboxList");
            for (int i = 0; i < cartas.Count; i++)
            {
                DataRow carta = cartas[i];

                string nomeRemetente = carta.Field<string>("RemetenteNome");
                int cartaId = carta.Field<int>("id_carta");

                HtmlGenericControl cartaDiv = new HtmlGenericControl("div");

                Label labelCartaDiv = new Label();
                labelCartaDiv.Text = nomeRemetente;

                Button btnLerDiv = new Button();
                btnLerDiv.Text = "Read";
                btnLerDiv.ID = cartaId.ToString();
                btnLerDiv.Click += LerCarta;

                cartaDiv.Controls.Add(labelCartaDiv);
                cartaDiv.Controls.Add(btnLerDiv);

                listaInbox.Controls.Add(cartaDiv);
            }
        }

        private void UpdateUserInfo()
        {
            DatabaseHelper db = new DatabaseHelper();
            DataRow usuario = db.GetUsuarioByID(userID);
            string usuarioName = usuario.Field<string>("nome");
            string usuarioClass = usuario.Field<string>("sala");
            LblHello.Text = "Hello, " + usuarioName + "! How are you doing?";
            LblSala.Text = "Class: " + FormatSalaString(usuarioClass);
        }

        private void UpdateEstatisticas()
        {
            DatabaseHelper db = new DatabaseHelper();
            DataRow estatisticas = db.GetEstatisticas(userID);
            int estatisticaReceived = estatisticas.Field<int>("Recebidas");
            int estatisticaSent = estatisticas.Field<int>("Enviadas");
            LblReceived.Text = "Received: " + estatisticaReceived.ToString();
            LblSent.Text = "Sent: " + estatisticaSent.ToString();
        }

        private string FormatSalaString(string sala)
        {
            return sala[0] + "º" + sala.Substring(1).ToUpper();
        }

        protected void BtnLogOff_Click(object sender, EventArgs e)
        {
            Session["LoggedUserID"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void BtnSeeAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllCorreios.aspx");
        }

        protected void BtnNewLetter_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewLetter.aspx");
        }
    }
}