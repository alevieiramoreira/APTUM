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
    public partial class perfil : System.Web.UI.Page
    {
        static string codCliente = "";
        protected void Page_Load(object source, EventArgs e)
        {
            

            codCliente = Request.QueryString["id"];
            decimal tempMaxAgr = 0;
            decimal tempMinAgr = 0;

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                // Cria um comando para selecionar registros da tabela, trazendo todas as pessoas que nasceram depois de 1/1/1900
                using (SqlCommand cmd = new SqlCommand("SELECT NOME_CLIENTE FROM tb_cliente WHERE id_cliente = '" + codCliente + "'", conn))
                {

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {
                            string nomeCliente = reader.GetString(0);

                            txtNomeCli.InnerText = "Bem vindo(a) "+nomeCliente;

                        }
                        else
                        {

                            Response.Redirect("login.aspx");
                        }
                    }
                }

                int qtd = 0;

                
                

            }
        }
        
        

        protected void Unnamed_Click(object sender, EventArgs e)
        {

            Response.Redirect("gerenciamento.aspx?id=" + codCliente);
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {

            Response.Redirect("relatorios.aspx?id=" + codCliente);
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




        [WebMethod]
        public static string[] MudarItemAmbiente(string itemSel)
        {
            if(itemSel == "" || itemSel == null)
            {
                itemSel = "0";
            }
            string[] lista = new string[8];

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdAmbiente = new SqlCommand($"SELECT NOME_AMBIENTE, NUMERO_MEDIDA, TIPO_MEDIDA, COD_ANIMAL,ID_AMBIENTE from TB_AMBIENTE WHERE ID_AMBIENTE = " + itemSel, conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdAmbiente.ExecuteReader())
                    {


                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {
                            lista[0] = reader.GetString(0);
                            lista[1] = reader.GetInt32(1) + "";
                            lista[2] = reader.GetString(2) + "";
                            lista[3] = reader.GetInt32(3) + "";
                            lista[4] = reader.GetInt32(4) + "";

                        }
                    }

                }

                using (SqlCommand cmdAmbiente = new SqlCommand($"SELECT ESPECIES_ANIMAL, TEMP_MIN, TEMP_MAX from TB_ESPECIEs WHERE id_animal = " + lista[3] + "", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdAmbiente.ExecuteReader())
                    {


                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {
                            lista[5] = reader.GetString(0)+"";
                            lista[6] = reader.GetDecimal(1) + "";
                            lista[7] = reader.GetDecimal(2) + "";

                        }
                    }

                }
                return lista;

            }


        }








        [WebMethod]
        public static string SelectTemp()
        {

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                string temp = "";
                using (SqlCommand cmdAmbiente = new SqlCommand($"SELECT TEMPERATURA_TEMP from tb_temperatura_real where ID_TEMPeratura = (select max(ID_TEMPERATURA) from tb_temperatura_real)", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdAmbiente.ExecuteReader())
                    {
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {
                            temp = reader.GetDecimal(0) + "";
                        }

                    }

                }


                using (SqlCommand cmdAmbiente = new SqlCommand($"DELETE  from tb_temperatura_real where ID_TEMPeratura < (select (max(ID_TEMPERATURA)-4000) from tb_temperatura_real)", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdAmbiente.ExecuteReader())
                    {

                    }

                }
                return temp;

            }
        }



        [WebMethod]
        public static string SelectMedia()
        {

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdAmbiente = new SqlCommand($"SELECT avg(TEMPERATURA_TEMP) from tb_temperatura_real where ID_TEMPeratura <= (select max(ID_TEMPERATURA) from tb_temperatura_real) and ID_TEMPeratura >= (select (max(ID_TEMPERATURA)-600) from tb_temperatura_real)", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdAmbiente.ExecuteReader())
                    {
                        string temp = "";
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {
                            temp = reader.GetDecimal(0) + "";
                        }

                        return temp;
                    }

                }


            }


        }





        [WebMethod]
        public static double[] SelectQuartil()
        {

            //select distinct round(percentile_cont(0) within group(ORDER BY TEMPERATURA_TEMP)
            //over(PARTITION BY 1), 2) FROM TB_TEMPERATURA_REAL

            //select distinct round(percentile_cont(0.25) within group(ORDER BY TEMPERATURA_TEMP)
            //over(PARTITION BY 1), 2) FROM TB_TEMPERATURA_REAL

            //select distinct round(percentile_cont(0.5) within group(ORDER BY TEMPERATURA_TEMP)
            //over(PARTITION BY 1), 2) FROM TB_TEMPERATURA_REAL

            //select distinct round(percentile_cont(0.75) within group(ORDER BY TEMPERATURA_TEMP)
            //over(PARTITION BY 1), 2) FROM TB_TEMPERATURA_REAL

            //select distinct round(percentile_cont(1) within group(ORDER BY TEMPERATURA_TEMP)
            //over(PARTITION BY 1), 2) FROM TB_TEMPERATURA_REAL

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                double[] quartil = new double[6];
                int min = 0, q1=1, q2=2, q3=3, max=4;


                using (SqlCommand cmdAmbiente = new SqlCommand($"select distinct " +
                    $"round(percentile_cont(0) within group(ORDER BY TEMPERATURA_TEMP) over(PARTITION BY 1), 1), " +
                    $"round(percentile_cont(0.25) within group(ORDER BY TEMPERATURA_TEMP) over(PARTITION BY 1), 1)," +
                    $"round(percentile_cont(0.5) within group(ORDER BY TEMPERATURA_TEMP) over(PARTITION BY 1), 1)," +
                    $"round(percentile_cont(0.75) within group(ORDER BY TEMPERATURA_TEMP) over(PARTITION BY 1), 1)," +
                    $"round(percentile_cont(1) within group(ORDER BY TEMPERATURA_TEMP) over(PARTITION BY 1), 1), " +
                    $"round(sqrt(var(TEMPERATURA_TEMP) over (PARTITION BY 1)), 1)" +
                    $"FROM TB_TEMPERATURA_REAL " +
                    $"where ID_TEMPeratura <= (select max(ID_TEMPERATURA) from tb_temperatura_real) " +
                    $"and ID_TEMPeratura >= (select (max(ID_TEMPERATURA)-600) from tb_temperatura_real)", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdAmbiente.ExecuteReader())
                    {
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {
                            quartil[min] = reader.GetDouble(min);

                            quartil[q1] = reader.GetDouble(q1);

                            quartil[q2] = reader.GetDouble(q2);

                            quartil[q3] = reader.GetDouble(q3);

                            quartil[max] = reader.GetDouble(max);


                            quartil[5] = reader.GetDouble(5);
                        }
                        
                    }

                }
                

                return quartil;

            }


        }



        [WebMethod]
        public static string[] SelectHistorico()
        {

            using (SqlConnection conn = new SqlConnection("Server=tcp:biapc.database.windows.net,1433;Initial Catalog=tb_expl;Persist Security Info=False;User ID=bia_pc;Password=b123456@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();

                using (SqlCommand cmdAmbiente = new SqlCommand($"SELECT TEMP_MOMENTO, TEMP_MEDIA, " +
                    $"DATA_HISTORICO " +
                    $"from tb_historico " +
                    $"WHERE ID_HISTORICO = (SELECT MAX(ID_HISTORICO) from tb_historico)", conn))
                //Lembrar de add o cod_ambiente na tb_especie no banco e colocar aqui tbm
                {
                    using (SqlDataReader reader = cmdAmbiente.ExecuteReader())
                    {
                        string temp = "", media = "", ano = "", mes = "", dia = "", hora = "", minuto = "", segundo = "";
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {
                            temp = reader.GetDecimal(0) + "";
                            media = reader.GetDecimal(1)+"";
                            ano = reader.GetDateTime(2).Year + "";
                            mes = reader.GetDateTime(2).Month + "";
                            dia = reader.GetDateTime(2).Day + "";
                            hora = reader.GetDateTime(2).Hour + "";
                            minuto = reader.GetDateTime(2).Minute + "";
                            segundo = reader.GetDateTime(2).Second + "";
                        }

                        return new string[8] { temp, media, ano, mes, dia, hora, minuto, segundo };
                    }

                }


            }


        }



    }
}