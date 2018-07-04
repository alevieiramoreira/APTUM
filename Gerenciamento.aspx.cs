using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;

namespace APTUM
{
    public partial class Gerenciamento : System.Web.UI.Page
    {
        static string codCliente = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                codCliente = Request.QueryString["id"];
            }

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdEsp = new SqlCommand($"Select ESPECIES_ANIMAL, id_animal from tb_especies where cod_Cliente = " + codCliente, conn))
                {

                    using (SqlDataReader readerEsp = cmdEsp.ExecuteReader())

                        while (readerEsp.Read() == true)
                        {
                            string nomeEspItem = readerEsp.GetString(0);
                            int idEspItem = readerEsp.GetInt32(1);
                            ListItem especieSelecionar = new ListItem(nomeEspItem, "" + idEspItem);
                            especiesEdt.Items.Add(especieSelecionar);

                            especiesExc.Items.Add(especieSelecionar);

                            txtEspecieAmbCad.Items.Add(especieSelecionar);
                            txtEspecieAmbEdt.Items.Add(especieSelecionar);
                            txtEspecieAmbExc.Items.Add(especieSelecionar);

                        }
                }
            }


        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

            Response.Redirect("perfil.aspx?id=" + codCliente);
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {

            Response.Redirect("relatorios.aspx?id=" + codCliente);
        }



        [WebMethod]

        public static void CadastrarEspecie(string nomeEsp, string max, string min)
        {


            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdEspecie = new SqlCommand($"INSERT INTO TB_ESPECIES (ESPECIES_ANIMAL, TEMP_MIN, TEMP_MAX, cod_cliente) " +
                    $"VALUES (@NomeEspecie, @TempMin, @TempMax, @cod_cliente)", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    cmdEspecie.Parameters.AddWithValue("@NomeEspecie", nomeEsp);
                    cmdEspecie.Parameters.AddWithValue("@TempMin", min);
                    cmdEspecie.Parameters.AddWithValue("@TempMax", max);

                    cmdEspecie.Parameters.AddWithValue("@cod_cliente", codCliente);
                    

                    cmdEspecie.ExecuteNonQuery();
                }

            }


        }



        [WebMethod]

        public static void EditarEspecie(string nomeEsp, string max, string min, string cod)
        {


            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdEspecie = new SqlCommand($"UPDATE TB_ESPECIES SET ESPECIES_ANIMAL='"+nomeEsp+"', TEMP_MIN='"+min+"', TEMP_MAX='"+max+"' where ID_ANIMAL = "+cod, conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {


                    cmdEspecie.ExecuteNonQuery();
                }

            }


        }

        [WebMethod]
        public static void ExcluirEspecie(string nomeEsp, string max, string min, string cod)
        {


            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdEspecie = new SqlCommand($"DELETE FROM TB_Ambiente where Cod_ANIMAL = " + cod, conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {


                    cmdEspecie.ExecuteNonQuery();
                }

                using (SqlCommand cmdEspecie = new SqlCommand($"DELETE FROM TB_ESPECIES where ID_ANIMAL = " + cod, conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {


                    cmdEspecie.ExecuteNonQuery();
                }

            }


        }



        [WebMethod]

        public static void CadastrarAmbiente(string nomeAmb, string medida, string codEsp, string tipo)
        {


            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdEspecie = new SqlCommand($"INSERT INTO TB_AMBIENTE (NOME_AMBIENTE, NUMERO_MEDIDA, COD_ANIMAL, TIPO_MEDIDA, cod_cliente) " +
                    $"VALUES (@NomeAmb, @Medida, @CodEsp, @tipo, @cod_cliente)", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    cmdEspecie.Parameters.AddWithValue("@NomeAmb", nomeAmb);
                    cmdEspecie.Parameters.AddWithValue("@Medida", medida);
                    cmdEspecie.Parameters.AddWithValue("@CodEsp", codEsp);
                    cmdEspecie.Parameters.AddWithValue("@tipo", tipo);

                    cmdEspecie.Parameters.AddWithValue("@cod_cliente", codCliente);


                    cmdEspecie.ExecuteNonQuery();
                }

            }


        }




        [WebMethod]

        public static void EditarAmbiente(string nomeAmb, string medida, string codEsp, string tipo, string cod)
        {


            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdEAmbiente = new SqlCommand($"UPDATE TB_AMBIENTE SET NOME_AMBIENTE='" + nomeAmb + "', NUMERO_MEDIDA='" + medida + "', COD_ANIMAL='" + codEsp + "', TIPO_MEDIDA = '"+tipo+"' where ID_AMBIENTE = " + cod, conn))
                
                {


                    cmdEAmbiente.ExecuteNonQuery();
                }

            }


        }




        [WebMethod]
        public static void ExcluirAmbiente(string cod)
        {


            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdAmbiente = new SqlCommand($"UPDATE TB_HISTORICO SET COD_AMBIENTE = NULL where COD_AMBIENTE = " + cod, conn))

                {


                    cmdAmbiente.ExecuteNonQuery();
                }

                using (SqlCommand cmdAmbiente = new SqlCommand($"UPDATE TB_TEMPERATURA_REAL SET COD_AMBIENTE = NULL where COD_AMBIENTE = " + cod, conn))

                {


                    cmdAmbiente.ExecuteNonQuery();
                }

                using (SqlCommand cmdAmbiente = new SqlCommand($"DELETE FROM TB_AMBIENTE where ID_AMBIENTE = " + cod, conn))
                
                {


                    cmdAmbiente.ExecuteNonQuery();
                }
                

            }


        }







        [WebMethod]
        public static string[] MudarItemEspecie(string itemSel, string nomeItem)
        {


            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdEspecie = new SqlCommand($"SELECT ESPECIES_ANIMAL, TEMP_MIN, TEMP_MAX from TB_ESPECIES WHERE ID_ANIMAL = "+ itemSel+"", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdEspecie.ExecuteReader())
                    {
                        
                        string[] especie = new string[3];
                        
                        //Obtém os registros, um por vez
                        while (reader.Read() == true)
                        {
                            especie[0] = reader.GetString(0);
                            especie[1] = reader.GetDecimal(1)+"";
                            especie[2] = reader.GetDecimal(2)+"";
                            
                        }
                        return especie;
                    }
                    
                }

            }


        }






        [WebMethod]
        public static string[] MudarItemAmbiente(string itemSel, string nomeItem)
        {


            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdAmbiente = new SqlCommand($"SELECT NOME_AMBIENTE, NUMERO_MEDIDA, TIPO_MEDIDA, COD_ANIMAL from TB_AMBIENTE WHERE ID_AMBIENTE = " + itemSel + "", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdAmbiente.ExecuteReader())
                    {

                        string[] ambiente = new string[4];

                        //Obtém os registros, um por vez
                        while (reader.Read() == true)
                        {
                            ambiente[0] = reader.GetString(0);
                            ambiente[1] = reader.GetInt32(1) + "";
                            ambiente[2] = reader.GetString(2) + "";
                            ambiente[3] = reader.GetInt32(3) + "";

                        }
                        return ambiente;
                    }

                }

            }


        }




        [WebMethod]
        public static Object[] AttListas()
        {

        

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                int qtd = 0;

                using (SqlCommand cmdEsp = new SqlCommand($"select count(id_animal) from tb_especies where cod_Cliente = " + codCliente + " ", conn))
                {

                    using (SqlDataReader readerEsp = cmdEsp.ExecuteReader())
                    {
                        if (readerEsp.Read() == true)
                        {
                            qtd = readerEsp.GetInt32(0);
                        }


                    }
                }

                    using (SqlCommand cmdEsp = new SqlCommand($"Select ESPECIES_ANIMAL, id_animal from tb_especies where cod_Cliente = " + codCliente+"", conn))
                {

                    using (SqlDataReader readerEsp = cmdEsp.ExecuteReader())
                    {
                        

                        string[] nome = new string[qtd];

                        string[] id = new string[qtd];

                        int contador = 0;

                        while (readerEsp.Read() == true)
                        {

                            nome[contador] = readerEsp.GetString(0);

                            id[contador] = ""+readerEsp.GetInt32(1);
                            contador++;
                        }

                        return new Object[] { nome, id };
                    }
                }
            }
        }



        [WebMethod]
        public static string[] SelectEspecie(string codEsp)
        {

            string nomeEsp, max, min;
            string[] especie = new string[4];

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();


                using (SqlCommand cmdEsp = new SqlCommand($"Select ESPECIES_ANIMAL, TEMP_MIN, TEMP_MAX from tb_especies where cod_Cliente = " + codCliente + " and id_animal = "+codEsp, conn))
                {

                    using (SqlDataReader readerEsp = cmdEsp.ExecuteReader())
                    {
                        if (readerEsp.Read() == true)
                        {
                            nomeEsp = readerEsp.GetString(0)+"";
                            max = readerEsp.GetDecimal(1)+"";
                            min = readerEsp.GetDecimal(2)+"";

                            especie[0] = nomeEsp;
                            especie[1] = max;
                            especie[2] = min;
                            especie[3] = codEsp;
                        }


                    }
                }

                return especie;
            }
        }





        [WebMethod]
        public static Object[] AttListasAmb()
        {



            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                int qtd = 0;

                using (SqlCommand cmdAmb = new SqlCommand($"select count(ID_AMBIENTE) from TB_AMBIENTE where cod_Cliente = " + codCliente + " ", conn))
                {

                    using (SqlDataReader readerAmb = cmdAmb.ExecuteReader())
                    {
                        if (readerAmb.Read() == true)
                        {
                            qtd = readerAmb.GetInt32(0);
                        }


                    }
                }

                using (SqlCommand cmdAmb = new SqlCommand($"Select NOME_AMBIENTE, ID_AMBIENTE from TB_AMBIENTE where cod_Cliente = " + codCliente + "", conn))
                {

                    using (SqlDataReader readerAmb = cmdAmb.ExecuteReader())
                    {


                        string[] nome = new string[qtd];

                        string[] id = new string[qtd];

                        int contador = 0;

                        while (readerAmb.Read() == true)
                        {

                            nome[contador] = readerAmb.GetString(0);

                            id[contador] = "" + readerAmb.GetInt32(1);
                            contador++;
                        }

                        return new Object[] { nome, id };
                    }
                }
            }
        }

        protected void clickPerfil_Click(object sender, EventArgs e)
        {

            Response.Redirect("perfil.aspx?id=" + codCliente);
        }
    }
}