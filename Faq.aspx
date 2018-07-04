<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faq.aspx.cs" Inherits="Faq.Faq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
      <title>APTUM</title>
      <link rel="stylesheet" href="faq.css"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/> <!--link do bootsrap-->
      <link rel="shortcut icon"  href="imagens/APTUMicon2.png"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header id="Home">
                <nav class="black"> <!-- conjunto de links de navegação.-->
                    <div class="logo"><!--A class onde insere o logo-->
                        <img src="imagens/aptum.png"/>
                    </div>

                    <div class="menu" id="desce">
                        <ul>
                              <a href="index.html"><li>Home</li></a>
                              <a href="Produto.html"><li>E-Scale</li></a>
                              <a href="Empresa.html"><li>APTUM™</li></a>
                              <a  href="#Contatos"><li>Contatos</li></a>
                              <li class='semBorda'><a href="login.aspx" class="l">Login</a><a href="cadastro.aspx" class="l">Cadastre-se</a></li> <!--Class 'semBorda' usada na tag <li> botão login pra não ter borda quando dar hover-->

                        </ul>
                    </div>
                </nav>
                     
            </header>


            <section>
                  <div class="faq"> 
                  	<div class="faqcaixa">
                  		 <div class="faq1">
                  		 		<div id="caixa">
                                       <h1>Perguntas Frequentes</h1>
									<div class="subir">
										<div class="pergunta" style="height:70px;"><img src="imagens/duvidas.png" height="50" width="50"/>
											<p class="textos">Por que na minha tela de perfil as temperaturas estão totalmente desreguladas?</p>
										</div>
										<div class="resposta">
											<p class="texto1"> 
Certifique-se de que o equipamento não foi manipulado ou se não houve alguma queda de energia.
<br/>Verifique se os cabos coloridos (cabos Jumpers) estão conectados na ordem correta. 
<br/>Cabo preto: Entrada GND. / Cabo verde: entrada 5 volts. / Cabo branco: Entrada A0 a A5. 
<br/>Para melhor entendimento, consulte o manual do usuário.

</p>
										</div>
									</div>
								<!--///////////////////////////////////////////////////////////////////////////////////-->
								<div class="subir">
										<div class="pergunta"><img src="imagens/duvidas.png" height="50" width="50"/>
											<p class="textos">Por que meu sensor está muito quente?</p>
										</div>
										<div class="resposta">
											<p class="texto1">Verifique se o sensor (LM35) está colocado da maneira correta. Confira as instruções no manual de instalação de usuário. 

</p>
										</div>
									</div>
								<!--///////////////////////////////////////////////////////////////////////////////////-->
								<div class="subir">
										<div class="pergunta"><img src="imagens/duvidas.png" height="50" width="50"/>
											<p class="textos">Por que não consigo efetuar o meu Cadastro?</p>
										</div>
										<div class="resposta">
											<p class="texto1">Verifique-se de ter preenchido todos os campos solicitados (com exceção de complemento), para que o cadastro seja efetuado com sucesso.
</p>
										</div>
									</div>
								<!--///////////////////////////////////////////////////////////////////////////////////-->
								<div class="subir">
										<div class="pergunta"><img src="imagens/duvidas.png" height="50" width="50"/>
											<p class="textos">Por que não consigo obter resposta dos e-mails enviados para APTUM ?</p>
										</div>
										<div class="resposta">
											<p class="texto1">Certifique-se que a escrita de seu email foi digitada corretamente. Se o erro persistir, entre em contato por telefone ou celular: (11)0000-0000 (11)98389-0234.
</p>
										</div>
									</div>
								<!--///////////////////////////////////////////////////////////////////////////////////-->
								<div class="subir">
										<div class="pergunta"><img src="imagens/duvidas.png" height="50" width="50"/>
											<p class="textos">Meu Arduino parou de funcionar, o que eu devo fazer?</p>
										</div>
										<div class="resposta">
											<p class="texto1">Entre em contato com nossa central de atendimento. Nós enviaremos um técnico especializado para manutenção e reparo do aparelho. Se necessário, efetuaremos a troca completa do E-SCALE.
</p>
										</div>
									</div>
								<!--///////////////////////////////////////////////////////////////////////////////////-->	
                                       <!--///////////////////////////////////////////////////////////////////////////////////-->
								<div class="subir">
										<div class="pergunta"><img src="imagens/duvidas.png" height="50" width="50"/>
											<p class="textos">A umidade do meu ambiente afetou meu Arduino, o que devo fazer?</p>
										</div>
										<div class="resposta">
											<p class="texto1">Desconecte seu Arduino de sua fonte de alimentação. Em seguida verifique o estado do produto e certifique-se de que não há deterioração de seus meios. Reconecte o Arduino para reinicialização. Caso haja algum defeito no produto, contate nosso suporte por um dos canais de atendimento.</p>
										</div>
									</div>
								<!--///////////////////////////////////////////////////////////////////////////////////-->	
                                       <!--///////////////////////////////////////////////////////////////////////////////////-->
								<div class="subir">
										<div class="pergunta"><img src="imagens/duvidas.png" height="50" width="50"/>
											<p class="textos">Quanto suporta o meu Sensor ?</p>
										</div>
										<div class="resposta">
											<p class="texto1">O Sensor (LM35) suporta temperaturas entre -55°C e 150°C,passando disso pode levar a queima ou perda do mesmo.</p>
										</div>
									</div>
								<!--///////////////////////////////////////////////////////////////////////////////////-->	

						</div>

						<div class="caixa2">
						<div class="tituloForm">Entre em Contato</div>
                            <asp:TextBox runat="server" ID="txtEmail" type="text" CssClass="lblassunto" placeholder="Email"/><br/><br/>
                            <asp:TextBox runat="server" ID="TextNome" type="text" CssClass="lblassunto" placeholder="Nome"/><br/><br/>
						    <!--<input type="email" id= "email" placeholder="Email do Usuario"/>--> 
                            <asp:TextBox runat="server" ID="txtAssunto" type="text" CssClass="lblassunto" placeholder="Assunto"/><br/><br/>
                            <!--<input id= "asuunto" type="text" placeholder="Assunto"/>-->
                            <asp:TextBox runat="server" TextMode="multiline" ID="txtMenssagem" type="text" CssClass="lblmenssagem" placeholder="Menssagem"/>
                            <!--<textarea id= "mensagem" placeholder="Mensagem"/></textarea>--> 
                        <br/>
                            <asp:Button Text="Enviar" runat="server" ID="bntEnviar" OnClick="bntEnviar_Click"/>
                            <!--<button type= "submit">Enviar</button>-->
							
						</div>

                  	 </div>  
                  </div>
               </div>
            </section>
    

        <footer>            
            <div class="rodape" id="Contatos">
				<div class='areasRodape'>
					<div class='tituloAreaRodape'>Localização</div>
						<div class='icone'>
							<img src='imagens/local.png'/>
						</div>

					<div class='conteudoAreaRodape'>
						Rua Haddock Lobo
						<br/> 595
					</div>	

					<div class='conteudoAreaRodape'>
						Cerqueira César 
						<br/>São Paulo - SP
					</div>

				</div>
				
				<div class='areasRodape'>
					<div class='tituloAreaRodape'>Redes Sociais</div>
						<br/>

					<div class='icone'>
						<a href="http://facebook.com"><img src='imagens/facebook2.png'/></a>
					</div>

					<div class='icone'>
						<a href="http://facebook.com"><img src='imagens/twitter2.png'/></a>
					</div>

					<div class='icone'>
						<a href="http://facebook.com"><img src='imagens/instagram2.png'/></a>
					</div>

					<div class='icone'>
						<a href="http://facebook.com"><img src='imagens/linkedin2.png'/></a>
					</div>

					<div class='icone'>
						<a href="http://facebook.com"><img src='imagens/gmail.png'/></a>
					</div>
				</div>
				
				<div class='areasRodape'>
					<div class='tituloAreaRodape' style="border-top: solid 0px;">Fale conosco</div> <!--Mudem pra a border-top pra 1px se quiserem a linha no meio do rodapé-->
					<div class='icone'>
						<img src='imagens/contato.png'/>
					</div>
					<div class='conteudoAreaRodape'>0800 777 7000
						<br/> 4002-8922
					</div>			
					<div class='conteudoAreaRodape'>APTUM Enterprise
						<br/> aptumtecnologia@gmail.com
					</div>
				</div>
				
						<div class='areasRodape'>
					<div class='tituloAreaRodape' style="border-top: solid 0px;">Alguma Dúvida?</div> <!--Mudem pra a border-top pra 1px se quiserem a linha no meio do rodapé-->
					<div class='icone'>
						<img src='imagens/duvidas.png'/>
					</div>
					<a href="Faq.aspx">
					    <div class="botaoj">Ajuda</div>
                    </a>
				</div>
				
				<div class="areaRodapeDireitosReservados">
					APTUM™
					<br/>
					2018
					<br/>
					Todos os direitos reservados
					<br/>
					<div class='icone'>
						<img src='imagens/camaleaoicon.png'/>
					</div>
				</div>
				
            </div>
        </footer>

     <script type="text/javascript">
                 
                 var menu = document.getElementById('desce'); //Coloca o elemento com o ID 'menu' em uma variavel
                 menu.style.marginTop='-100px'; // Muda a margin-top do menu pra -100px
                 
                 onload = function(){ //qndo a pagina carrega essa função é ativada
                     menu.style.transition='0.5s ease-in'; //muda a transição do menu pra um tempo de 0.5 segundos e ease-in(mais lento no começo da transição)
                     menu.style.marginTop='0'; //Muda a margin-top do menu de volta pra 0
                     
         };



     
	  
	  
	  //Rolagem lisa qndo clica nos links do menu
	  $(document).ready(function(){
	  
	  $("a").on('click', function(event) { // Adiciona rolagem pra todos os links (tag <a>)

		
		if (this.hash !== "") { // ativa "Se href do link não tiver vazio"
		  
		  event.preventDefault(); // Previne comportamentos padrão qndo clica em links

		  
		  var hash = this.hash; //  Guarda o 'href' em uma variavel

		  //Usando o método animate() do jQuery pra adicionar a rolagem lisa
		  $('html, body').animate({
			scrollTop: $(hash).offset().top
		  }, 800, function(){ // O número (800) é quantos milisegundos demora pra rolar até o local
	   
			
			window.location.hash = hash; // Adiciona hash (#) no URL (endereço da pagina) quando termina de rolar (Isso é um comportamento padrão só q foi prevenido lá em cima)
		  });
		} // Fim do if
	  });
	});

      </script>
     



        </div>
    </form>
</body>
</html>
