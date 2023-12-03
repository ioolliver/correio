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
    public partial class AllCorreios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedUserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            UpdateInbox();
        }

        private void LerCarta(object sender, EventArgs e)
        {
            Button btnSender = (Button)sender;
            Session["CartaToReadID"] = btnSender.ID;
            Response.Redirect("ReadLetter.aspx");
        }

        private void UpdateInbox()
        {
            int userID = int.Parse(Session["LoggedUserID"].ToString());
            DatabaseHelper db = new DatabaseHelper();
            DataRowCollection cartas = db.GetAllCartas(userID);

            int notRead = 0;

            HtmlGenericControl listaInbox = (HtmlGenericControl)FindControl("DivInboxList");
            for (int i = 0; i < cartas.Count; i++)
            {
                DataRow carta = cartas[i];

                string nomeRemetente = carta.Field<string>("RemetenteNome");
                int cartaId = carta.Field<int>("id_carta");
                bool read = carta.Field<bool>("lido");

                HtmlGenericControl cartaDiv = new HtmlGenericControl("div");

                Label labelCartaDiv = new Label();
                labelCartaDiv.Text = nomeRemetente;
                cartaDiv.Controls.Add(labelCartaDiv);

                if (!read)
                {
                    notRead++;
                    labelCartaDiv.CssClass = "not-read";
                }

                Button btnLerDiv = new Button();
                btnLerDiv.Text = "Read";
                btnLerDiv.ID = cartaId.ToString();
                btnLerDiv.Click += LerCarta;
                cartaDiv.Controls.Add(btnLerDiv);

                listaInbox.Controls.Add(cartaDiv);
            }
            LblTotal.Text = "Total: " + cartas.Count.ToString();
            LblNotRead.Text = "Not read: " + notRead.ToString();
            LblRead.Text = "Read: " + (cartas.Count - notRead).ToString();
        }
    }
}