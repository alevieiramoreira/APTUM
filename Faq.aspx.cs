using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;


namespace Faq
{
    public partial class Faq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void bntEnviar_Click(object sender, EventArgs e)
        {
            // Especifica o servidor SMTP e a porta
            using (System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587))
            {
                try
                {
                    // EnableSsl ativa a comunicação segura com o servidor
                    client.EnableSsl = true;

                    // Especifica a credencial utilizada para envio da mensagem
                    client.UseDefaultCredentials = true;
                    client.Credentials = new System.Net.NetworkCredential("aptumtecnologiaBandtec@gmail.com", "Bandtec2018");

                    // Especifia o remetente e o destinatário da mensagem
                    System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage(
                        new System.Net.Mail.MailAddress($"{txtEmail.Text}", $"{TextNome.Text}", Encoding.UTF8),
                        new System.Net.Mail.MailAddress("aptumtecnologiaBandtec@gmail.com"));

                    // Preenche o corpo e o assunto da mensagem
                    message.BodyEncoding = Encoding.UTF8;
                    message.Body = $"{txtMenssagem.Text}";
                    message.SubjectEncoding = Encoding.UTF8;
                    message.Subject = $"{txtAssunto.Text}";

                    // Anexos devem ser adicionados através do método
                    // message.Attachments.Add()

                    // Envia a mensagem
                    client.Send(message);
                    Response.Write("<script>alert('Enviado com sucesso!')</script>");

                }
                    catch (Exception ex)
                {
                    // Exceções devem ser tratadas aqui!
                    Response.Write($"<script>alert('{ex.Message}')</script");
                }

               
            }
            
        }
    }
}