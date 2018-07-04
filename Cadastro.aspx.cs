using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace APTUM
{
    public partial class cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        #region Cadastro
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {

            // Cria e abre a conexão com o banco de dados (essa string só serve para acessar o banco localmente)
            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                #region Inserindo Endereço

                int idEndereco;

                using (SqlCommand cmdEndereco = new SqlCommand("INSERT INTO TB_ENDERECO (rua_end, cep_end, estado_end, bairro_end, cidade_end) " +
                                "OUTPUT INSERTED.ID_ENDERECO values (@RuaEnd, @CepEnd, @EstadoEnd, @BairroEnd, @CidadeEnd)", conn))
                {
                    // Esses valores poderiam vir de qualquer outro lugar, como uma TextBox...
                    cmdEndereco.Parameters.AddWithValue("@RuaEnd", txtRua.Text);
                    cmdEndereco.Parameters.AddWithValue("@CepEnd", numCEP.Text);
                    cmdEndereco.Parameters.AddWithValue("@EstadoEnd", txtEstado.Text);
                    cmdEndereco.Parameters.AddWithValue("@BairroEnd", txtBairro.Text);
                    cmdEndereco.Parameters.AddWithValue("@CidadeEnd", txtCidade.Text);

                    //Criando variavel que recebera o código que foi gerado ao executar a query acima
                    idEndereco = (int)cmdEndereco.ExecuteScalar();


                }
                #endregion

                int idCliente = 0;
                if (jr.Value == "fis")
                {
                    #region Inserindo dados Cliente Físico


                    using (SqlCommand cmdCadastro = new SqlCommand("INSERT INTO TB_CLIENTE (Nome_cliente, CPF_cliente, sexo_cliente, data_nasc, tipo_cliente, cod_endereco, NUMERO_END, COMPLEMENTO_END) " +
                        " OUTPUT INSERTED.ID_CLIENTE values (@NomeCliente, @CPF, @SexoCliente, @DataNasc, @TipoCliente, @codendereco,@numEnd, @compEnd) ", conn))
                    {
                        cmdCadastro.Parameters.AddWithValue("@NomeCliente", txtNomeFis.Text);
                        cmdCadastro.Parameters.AddWithValue("@CPF", txtCPF.Text);

                        string sexo = "";
                        if (f.Checked)
                        {
                            sexo = "f";
                        }
                        else if (m.Checked)
                        {
                            sexo = "m";
                        }
                        cmdCadastro.Parameters.AddWithValue("@SexoCliente", sexo);
                        cmdCadastro.Parameters.AddWithValue("@DataNasc", numData.Text);
                        cmdCadastro.Parameters.AddWithValue("@TipoCliente", jr.Value);

                        //adicionando chave estrangeira
                        cmdCadastro.Parameters.AddWithValue("@codendereco", idEndereco);
                        cmdCadastro.Parameters.AddWithValue("@numEnd", numEstabelecimento.Text);
                        cmdCadastro.Parameters.AddWithValue("@compEnd", txtComplemento.Text);

                        //Criando variavel que recebera o código que foi gerado ao executar a query acima
                        idCliente = (int)cmdCadastro.ExecuteScalar();
                    }
                    #endregion
                }
                else if (jr.Value == "jur")
                {
                    #region Inserindo dados Cliente Jurídico
                    using (SqlCommand cmdCadastro = new SqlCommand("INSERT INTO TB_CLIENTE (Nome_cliente, Razao_social, CNPJ_cliente, tipo_cliente, cod_endereco)" +
                            " OUTPUT INSERTED.ID_CLIENTE values (@NomeCliente, @RazaoSocial, @CNPJ, @TipoCliente, @codendereco) ", conn))
                    {
                        // Esses valores poderiam vir de qualquer outro lugar, como uma TextBox...
                        cmdCadastro.Parameters.AddWithValue("@NomeCliente", txtNomeFantasia.Text);
                        cmdCadastro.Parameters.AddWithValue("@RazaoSocial", txtRazao.Text);
                        cmdCadastro.Parameters.AddWithValue("@CNPJ", numCNPJ.Text);
                        cmdCadastro.Parameters.AddWithValue("@TipoCliente", jr.Value);

                        //inserindo chave estrangeira
                        cmdCadastro.Parameters.AddWithValue("@codendereco", idEndereco);

                        idCliente = (int)cmdCadastro.ExecuteScalar();
                    }
                    #endregion
                }
                #region Inserindo Dados Login
                using (SqlCommand cmdLogin = new SqlCommand("INSERT INTO TB_LOGIN (email_login, senha_login, cod_cliente, status_login)" +
                            " OUTPUT INSERTED.ID_LOGIN values (@EmailLogin, @SenhaLogin, @codCliente, '0')", conn))
                {
                    // Esses valores poderiam vir de qualquer outro lugar, como uma TextBox...
                    cmdLogin.Parameters.AddWithValue("@EmailLogin", txtEmail.Text);
                    cmdLogin.Parameters.AddWithValue("@SenhaLogin", txtSenha.Text);

                    //adicionando chave estrangeira
                    cmdLogin.Parameters.AddWithValue("@codCliente", idCliente);

                    cmdLogin.ExecuteNonQuery();
                }
                #endregion

                #region Inserindo Telefone
                using (SqlCommand cmdTelefone = new SqlCommand("INSERT INTO TB_TELEFONE(telefone, cod_cliente) OUTPUT INSERTED.ID_TELEFONE " +
                    "values (@telefone, @codCliente)", conn))
                {
                    // Esses valores poderiam vir de qualquer outro lugar, como uma TextBox...
                    cmdTelefone.Parameters.AddWithValue("@Telefone", numTelefone.Text);


                    //adicionando chave estrangeira
                    cmdTelefone.Parameters.AddWithValue("@codCLiente", idCliente);

                    //Criando variavel que recebera o código que foi gerado ao executar a query acima
                    cmdTelefone.ExecuteNonQuery();
                }
                #endregion

            }



            Response.Redirect("login.aspx");
        }
        #endregion

        #region Ir para página Login
        protected void btnIrLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        #endregion
    }
}