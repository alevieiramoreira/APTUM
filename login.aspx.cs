using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APTUM
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        { 
        if (txtusuario.Text == "" || txtsenha.Text == "") {
                lblMsg.Text = "Preencha todos os campos!";
             }
            else
            {
                lblMsg.Text = "";
                string usuario = txtusuario.Text;
                string senha = txtsenha.Text;

                // Cria e abre a conexão com o banco de dados (essa string só serve para acessar o banco localmente)
                // Veja mais strings de conexão em http://www.connectionstrings.com/
                using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
                {
                    conn.Open();

                    // Cria um comando para selecionar registros da tabela, trazendo todas as pessoas que nasceram depois de 1/1/1900
                    using (SqlCommand cmd = new SqlCommand("SELECT Id_login,cod_cliente,email_login  FROM tb_login WHERE email_login = '" + usuario + "' AND senha_login = '" + senha + "'", conn))
                    {

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            //Obtém os registros, um por vez
                            if (reader.Read() == true)
                            {
                                int id = reader.GetInt32(0);
                            int codCliente = reader.GetInt32(1);
                            string email = reader.GetString(2);

                            Response.Redirect("gerenciamento.aspx?id="+codCliente);
                            }
                            else
                            {
                                lblMsg.Text = "Dados não encontrados";
                            }
                        }
                    }
                }



            }
        }
    }
}