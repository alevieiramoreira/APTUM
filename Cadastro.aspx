﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="APTUM.cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
          <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>APTUM - Cadastro</title>
      <link rel="stylesheet" href="css.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> <!--link do bootsrap-->
      <link rel="shortcut icon"  href="imagens/APTUMicon2.png">

      <script src="https://code.jquery.com/jquery-3.3.1.js"></script> <!--link do jquery-->
</head>
   <body onload="tipoCliente('')">
            
        <div id="backVideo">
            
            <video autoplay muted loop id="videoID">
            </video>
            
        </div>
          <div id="frontVideo">
              <div id="caixaCadastro">
                  <div class="tituloForm">Cadastre-se no E-Scale</div>
                  
                  <asp:Label ID="msgErro" Text="" ForeColor="#91000"/>
                  <div id="posicaoTipoCli">
                            <div class="divTipoCli" style="overflow: visible;">
                              <button type="button" id="btnTipoCliF" onclick="tipoCliente('fis')">Sou um cliente Físico (Para uso pessoal do produto)</button>
                            </div>

                            <div class="divTipoCli" style="overflow: visible;">
                              <button type="button" id="btnTipoCliJ" onclick="tipoCliente('jur')">Sou um cliente Jurídico (Para uso organizacional do produto)</button>
                            </div>
                   </div>
                  
                  <form id="cadastro" runat="server">
                      
                      
                        <asp:HiddenField id="jr" Value="" runat="server"/>          
                        <div class="campos fis">
                           <asp:Label Text="Nome" runat="server" CssClass="lbl"/>
                            <!-- <label class="lbl" for="nome">Nome</label>-->
                           <asp:TextBox runat="server" id="txtNomeFis" />
                            <!--<input type="text" id= "nome"/>-->
                        </div>
                      
                        <div class="camposSmall fis">
                            <asp:Label Text="Sexo" runat="server" cssClass="lbl"/>
                                
                            <div class='radios'>
                                <asp:RadioButton runat="server" GroupName="sexo" value="m"  ID = "f" type="radio"/>
                                    <!--<input type="radio" name="sexo" value="m">-->
                                </div>
                                <div class='radios'>
                                    M
                                </div>
                                
                                <div class='radios'>
                                    <asp:RadioButton runat="server" GroupName="sexo" value="f" ID="m" type="radio"/>
                                    <!--<input type="radio" name="sexo" value="f">-->
                                </div>
                                <div class='radios'>
                                    F
                                </div>
                        </div>
                      
                        <div class="camposSmall fis">
                            <asp:Label Text="Data de Nascimento" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="dn">Data de nascimento</label>-->
                            <asp:TextBox ID="numData" runat="server" type="date" />
                            <!--<input type="date" id= "dn"/>-->
                        </div>
                      
                        <div class="campos fis">
                           <asp:Label Text="CPF" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="cpf">CPF</label>-->
                             <asp:TextBox runat="server" ID="txtCPF" />
                            <!--<input type="text" id= "cpf"/>-->
                        </div>
                      
                      
                        <div class="campos jur">
                            <asp:Label Text="Nome Fantasia" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="nomeF">Nome Fantasia</label>-->
                            <asp:TextBox runat="server" ID="txtNomeFantasia" />
                            <!--<input type="text" id= "nomeF"/>-->
                        </div>
                        
                        <div class="campos jur">
                            <asp:Label Text="Razão Social" runat="server" cssClass="lbl" />
                           <!-- <label class="lbl" for="Razao">Razão Social</label>-->
                            <asp:TextBox runat="server" ID="txtRazao" />
                            <!--<input type="text" id= "Razao"/>-->
                        </div>
                        
                        
                        <div class="campos jur">
                            <asp:Label Text="CNPJ" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="CNPJ">CNPJ</label>-->
                            <asp:TextBox runat="server" ID="numCNPJ" />
                            <!--<input type="text" id= "CNPJ"/>-->
                        </div>
                      
                        <div class="campos jur fis">
                            <asp:Label Text="E-Mail" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="Email">E-Mail</label>-->
                            <asp:TextBox runat="server" ID="txtEmail" />
                            <!--<input type="email" id= "Email"/>-->
                        </div>

                        

                        
                        <div class="campos jur fis">
                            <asp:Label Text="Senha" runat="server" CssClass="lbl" />
                            <!--<label class="lbl" for="senha">Senha</label>-->
                            <asp:TextBox runat="server" ID="txtSenha" TextMode="Password"/>
                            <!--<input id= "senha" type="password"/> -->
                        </div>

                        
                        <div class="campos jur fis">
                            <asp:Label Text="Confirmação de senha" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="cnfrmSenha">Confirme sua senha</label>-->
                            <asp:TextBox runat="server" ID="txtConfSenha" TextMode="Password"/>
                            <!--<input id= "cnfrmSenha" type="password"/> -->
                        </div>
                        
                        
                        <div class="campos jur fis">
                            <asp:Label Text="CEP" runat="server" cssClass="lbl"  />
                            <!--<label class="lbl" for="CEP">CEP</label>-->
                            <asp:TextBox runat="server" ID="numCEP" />
                            <!--<input id= "CEP" type="text"/> -->
                        </div>
                        
                        
                        <div class="camposSmall jur fis">
                            <asp:Label Text="Estado" runat="server" cssClass="lbl" />
                            <!---<label class="lbl" for="cidade">Estado</label>-->
                            <asp:TextBox runat="server" ID="txtEstado" />
                            <!--<input id= "estado" type="text"/> -->
                        </div>

                        <div class="camposSmall jur fis">
                            <asp:Label Text="Cidade" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="cidade">Cidade</label>-->
                            <asp:TextBox runat="server" ID="txtCidade" />
                            <!--<input id="cidade" type="text" />-->
                        </div>
                        
                        <div class="campos jur fis">
                            <asp:Label Text="Bairro" runat="server" cssClass="lbl" /> 
                            <!--<label class="lbl" for="bairro">Bairro</label>-->
                            <asp:TextBox runat="server" ID="txtBairro" />
                            <!--<input id= "bairro" type="text"/> -->
                        </div>
                        
                        
                        <div class="campos jur fis">
                            <asp:Label Text="Rua" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="rua">Rua</label>-->
                            <asp:TextBox runat="server" ID="txtRua" />
                            <!--<input id= "rua" type="text"/> -->
                        </div>
                        
                        <div class="camposSmall jur fis">
                            <asp:Label Text="Número de Estabelecimento" runat="server" cssClass="lbl" />
                            <!--<label class="lbl" for="numero">Numero do estabelecimento</label>-->
                            <asp:TextBox runat="server" ID="numEstabelecimento" />
                            <!--<input id= "numero" type="text"/> -->
                        </div>
						
			<div class="camposSmall jur fis">
                            
                <asp:Label Text="Complemento" runat="server" cssClass="lbl"/>
                <!--<label class="lbl" for="complemento">Complemento</label>-->
                <asp:TextBox runat="server" ID="txtComplemento" />            
                <!--<input id= "complemento" type="text"/> -->
                        </div>
                        
                        
                        <div class="campos jur fis" style="height: 80px; margin-bottom: 0;">
                            <div id="tels">
                               <asp:Label Text="Telefones" runat="server" cssClass ="lbl"/>
                                <!--<label class="lbl">Telefones</label>-->
                                <div class="telefone">
                                    <asp:TextBox runat="server" id="numTelefone" />
                                    <!--input id="telefone0" type="text"/> -->
                                </div>

                              
                                <div class="telefone">
                                    <asp:TextBox runat="server" id="numTelefone1"  />
                                    <!--input id="telefone0" type="text"/> -->
                            </div>
                             
                                

                            </div>
                            </div>
                      
                        
                        
                        
                        
                        <div class="campos jur fis" style="overflow: visible;">
                            <asp:Button Text="Realizar Cadastro" runat="server" ID="btnCadastrar" CssClass="btnCadastro" OnClick="btnCadastrar_Click"/>
                            <!--<button type= "submit">Realizar Cadastro</button>-->
                        </div>
                        
                        
                        <div class="campos jur fis" style="overflow: visible;">
                            <asp:Button Text="Ir para Login" runat="server" ID="btnIrLogin" CssClass="btnEntrar" OnClick="btnIrLogin_Click" />
                            <!--<a  href="login.html">
                                <button type="button">Ir para Login</button>
                            </a>-->
                        </div>
                      
                  </form>
              </div>
          </div>
          
          <a href="index.html">
              <div class="logo"><!--A class onde insere o logo-->
                    <img src="imagens/aptum.png">
              </div>
          </a>
          

             <script type="text/javascript">
                 var videos = ['v0.mp4', 'v1.mp4', 'v2.mp4', 'v3.mp4', 'v4.mp4', 'v5.mp4', 'v6.mp4', 'v7.mp4', 'v8.mp4', 'v9.mp4', 'v10.mp4', 'v11.mp4', 'v12.mp4', 'v13.mp4', 'v14.mp4'];
                 var videoFundo = videos[Math.floor(Math.random() * videos.length)];
                 var video = document.getElementById('videoID');
                 var fonteVideo = document.createElement('source');
                 fonteVideo.setAttribute('src', 'Videos/' + videoFundo);
                 video.appendChild(fonteVideo);
                 video.play();



                 //   /* Função de criar campos de telefone qndo clica no botão */
                 //   var newIdTel = 0; /*variável com o numero que será colocado no ID do campo criado para identificação futuramente*/

                 //   function addTel(){
                 //       newIdTel++; /*Aumenta o numero q vai pro ID sempre que a função é chamada (qndo o botão é clicado)*/
                 //       var tels = document.getElementById('tels');/*Guarda o elemento com id = 'tels' na variavel tels*/

                 //       var classTel = document.createElement('div'); /*Cria uma elemento 'div' e armazena ele na variavel classTel*/
                 //       classTel.setAttribute("class", "telefone"); /*Adiciona o atributo (class='telefone') na variavel classTel*/

                 //       tels.appendChild(classTel); /*Insere o elemento classTel dentro do tels no site*/

                 //       var newTel = document.createElement('input'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
                 //       newTel.setAttribute('type', 'text'); /*adiciona o atributo (type = 'text' no newTel)*/
                 //       newTel.setAttribute('id', 'telefone'+newIdTel); /*adiciona o atributo 'id' com o valor que ta na variavel newIdTel
                 //*                                                        Exemplo: se a newIdTel = 2 fica --> (id = 'telefone2') */

                 //       classTel.appendChild(newTel); /*Coloca o elemento newTel dentro do elemento classTel no site*/
                 //   }
                 //   
                 function tipoCliente(tipo) {
                     var campos = document.getElementsByClassName('campos');
                     var camposSmall = document.getElementsByClassName('camposSmall');
                     var divTipoCli = document.getElementsByClassName("divTipoCli");

                     var jur = document.getElementsByClassName('jur');
                     var fis = document.getElementsByClassName('fis');
                     var tipobtn = document.getElementById('jr');
                     tipobtn.value = tipo


                     for (i = 0; i < campos.length; i++) {
                         campos[i].style.display = "none";
                     }
                     for (i = 0; i < camposSmall.length; i++) {
                         camposSmall[i].style.display = "none";
                     }

                     if (tipo === 'jur') {
                         for (i = 0; i < jur.length; i++) {
                             jur[i].style.display = "block";
                         }
                     }
                     else if (tipo === 'fis') {
                         for (i = 0; i < fis.length; i++) {
                             fis[i].style.display = "block";
                         }
                     }

                     if (tipo != '') {
                         for (i = 0; i < divTipoCli.length; i++) {
                             divTipoCli[i].classList.add("camposSmall");

                             document.getElementById('btnTipoCliF').textContent = "Cliente Físico";
                             document.getElementById('btnTipoCliJ').textContent = "Cliente Jurídico";
                             var ptc = document.getElementById('posicaoTipoCli');
                             ptc.style.position = "absolute";
                             ptc.style.width = "50%";
                             divTipoCli[i].style.display = "block";
                         }

                     }
                 }

      </script>
     
    
</body>
</html>
