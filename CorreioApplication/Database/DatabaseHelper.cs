using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CorreioApplication.Database
{
    public class DatabaseHelper
    {
        private SqlConnection conn = new SqlConnection();
        private static readonly string connString = "Server=ISAQUE;Database=Correio;Trusted_Connection=True;";

        public void Connect()
        {
            try
            {
                conn.ConnectionString = connString;
                conn.Open();
            }
            catch (Exception)
            {
                return;
            }
        }

        /* Retorna a primeira tabela após executar a query. Usar para: SELECT */
        public DataTable GetOnDatabase(string query)
        {
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataSet data = new DataSet();
                adapter.Fill(data);
                return data.Tables[0];
            }
            catch (Exception)
            {
                return null;
            }
        }

        /* Retorna apenas o número de linhas afetadas. Usar para: INSERT, UPDATE, etc. */
        public int PostOnDatabase(string query)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = conn;
                return cmd.ExecuteNonQuery();
            } catch (Exception)
            {
                return 0;
            }
        }

        public void Disconnect()
        {
            try
            {
                if (conn.State != ConnectionState.Open) return;
                conn.Close();
                conn.Dispose();
            }
            catch (Exception)
            {
                return;
            }
        }

        public DataRow GetUsuarioByLogin(string email, string password)
        {
            Connect();
            DataTable usuario = GetOnDatabase("EXEC LoginUsuario @email = '" + email + "', @senha = '" + password + "'");
            Disconnect();
            if (usuario.Rows.Count == 0) return null;
            return usuario.Rows[0];
        }

        public DataRow GetUsuarioByID(int id)
        {
            Connect();
            DataTable usuario = GetOnDatabase("EXEC getUsuarioById @id = '" + id + "'");
            Disconnect();
            if (usuario.Rows.Count == 0) return null;
            return usuario.Rows[0];
        }
        public DataRow GetUsuarioByID(string id)
        {
            Connect();
            DataTable usuario = GetOnDatabase("EXEC getUsuarioById @id = '" + id + "'");
            Disconnect();
            if (usuario.Rows.Count == 0) return null;
            return usuario.Rows[0];
        }

        public DataRowCollection GetUsuariosBySala(string sala)
        {
            Connect();
            DataTable usuarios = GetOnDatabase("EXEC getUsuariosBySala @sala = '" + sala + "'");
            Disconnect();
            return usuarios.Rows;
        }

        public DataRow GetEstatisticas(int id)
        {
            Connect();
            DataTable usuario = GetOnDatabase("EXEC EstatisticasUsuario @id_usuario = '" + id + "'");
            Disconnect();
            return usuario.Rows[0];
        }

        public DataRowCollection GetCartasNaoLidas(int id)
        {
            Connect();
            DataTable cartas = GetOnDatabase("EXEC GetCartasRecebidasNaoLidas @id_usuario = '" + id + "'");
            Disconnect();
            return cartas.Rows;
        }
        public void MarkCartaAsRead(int id)
        {
            Connect();
            PostOnDatabase("EXEC MarkAsRead @id_carta = '" + id + "'");
            Disconnect();
        }

        public DataRowCollection GetAllCartas(int id)
        {
            Connect();
            DataTable cartas = GetOnDatabase("EXEC GetCartasRecebidas @id_usuario = '" + id + "'");
            Disconnect();
            return cartas.Rows;
        }

        public DataRow GetCartaInfo(int id)
        {
            Connect();
            DataTable usuario = GetOnDatabase("EXEC GetCartaInfo @id_carta = '" + id + "'");
            Disconnect();
            return usuario.Rows[0];
        }

        public int EnviarCorreio(int sender, int receiver, string msg)
        {
            Connect();
            int rowsModified = PostOnDatabase("EXEC EnviarCorreio @id_remetente = '"+sender+ "', @id_destinatario = '"+receiver+ "', @mensagem = '"+msg+"'");
            Disconnect();
            return rowsModified;
        }

        public int CreateAccount(string name, string email, string password, string sala)
        {
            Connect();
            int rowsModified = PostOnDatabase("EXEC RegistrarUsuario @nome = '"+name+"', @email = '"+email+"', @senha = '"+password+"', @sala = '"+sala+"'");
            Disconnect();
            return rowsModified;
        }
        
    }
}