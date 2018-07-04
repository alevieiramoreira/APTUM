
<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Gerenciamento.aspx.cs" Inherits="APTUM.Gerenciamento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
        <link rel="stylesheet" href="css.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/> <!--link do bootsrap-->
        <link rel="shortcut icon"  href="imagens/APTUMicon2.png"/>
        <title>
            APTUM - Gerenciamento
        </title>
    
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script> <!--link do jquery-->
 </head>
<body>
    <form runat="server">
        <nav> <!-- conjunto de links de navegação.-->
            <div class="black">
                <div class="logo"><!--A class onde insere o logo-->
                    <img src="imagens/aptum.png"/>
                </div>

                <div class="menu" id="desce">
                    <ul style="background-color: rgb(90,123,82);">
                        <a href="#Home"><li>Home</li></a>
                        <a href="#Produto"><li>E-Scale</li></a>
                        <a href="#Empresa"><li>APTUM™</li></a>
                        <a href="#Contatos"><li>Contatos</li></a>
                        <li class='semBorda'>
                               
                            <asp:Button Text="Voltar á página Perfil" ID="clickPerfil" runat="server" OnClick="clickPerfil_Click" cssClass="btnPerfil"/>
						
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="paginaGraf">
            <div id="containerGerenciamentoEsq">
                <div class="tituloGerenciamento">
                    Gerenciar Ambientes
                </div>
                <div class="btnGerenciamento" onclick="ambiente('cadastrar')">
                    Cadastrar Ambiente
                </div>
                <div class="btnGerenciamento"  onclick="ambiente('editar')">
                    Editar Ambiente
                </div>
                <div class="btnGerenciamento"  onclick="ambiente('excluir')">
                    Excluir Ambiente
                </div>
            </div>
            <div id="containerGerenciamentoDir">
                <div class="tituloGerenciamento">
                    Gerenciar Espécies
                </div>
                <div class="btnGerenciamento"  onclick="especie('cadastrar')">
                    Cadastrar Espécies
                </div>
                <div class="btnGerenciamento"  onclick="especie('editar')">
                    Editar Espécies
                </div>
                <div class="btnGerenciamento"  onclick="especie('excluir')">
                    Excluir Espécies
                </div>
            </div>
        </div>
        
        
        
        
        
        <div class="transparenciaGerenciamento" id="cadAmb">
            <div class="formAmbiente">
                <div class="x" onclick="x('cadAmb')">x</div>
                <asp:Label Text="" id="txtMsgCadAmb" runat="server" class="lbl"/>
                            <div class="campos">
                                <label class="lbl" for="txtNomeAmb">Nome do Ambiente</label>
                                <input type="text" id= "txtNomeAmb"/>
                            </div>
                            <div class="camposSmall">
                                <label class="lbl" for="txtMedida">Medida</label>
                                <input type="number" step="any" id= "txtMedida"/>
                            </div>
                
                            <div class="camposSmall">
                                <label class="lbl">Unidade de medida</label>
                                <div class='radios'>
                                    <input type="radio" name="undMed" value="2" id="2" checked="checked"/>
                                </div>
                                <div class='radios'>
                                    m2
                                </div>
                                
                                <div class='radios'>
                                    <input type="radio" name="undMed" id="3" value="3"/>
                                </div>
                                <div class='radios'>
                                    m3
                                </div>
                            </div>
                            <div class="campos">
                                <label class="lbl" for="txtEspecie">Especie</label>
                                <asp:DropDownList runat="server" id="txtEspecieAmbCad" onchange="minMaxEsp()">
                                </asp:DropDownList> 
                            </div>
                
                            
                            <div class="camposSmall">
                                <label class="lbl" for="txtMaxAmb">Temperatura maxima</label>
                                <label id= "txtMaxAmb"></label>
                            </div>
                                
                            <div class="camposSmall">    
                                <label class="lbl" for="txtMinAmb">Temperatura minima</label>
                                <label id= "txtMinAmb"></label>
                            </div>
                
                               <button type="button" onclick="cadastrarAmb();">Cadastrar Ambiente</button>
            </div>
        </div>
            
        
        <div class="transparenciaGerenciamento" id="edtAmb">
            <div class="formAmbiente">
                <div class="x" onclick="x('edtAmb')">x</div>
                
                            <div class="campos">
                                
                                <label class="lbl" for="txtAmbienteEdt" onchange="EdtAmbItem()">Ambiente á ser editado</label>
                                <select name="txtAmbienteEdt" id="txtAmbienteEdt" onchange="EdtAmbItem();">
                                  </select>
                            </div>

                
                         <asp:Label Text="" id="txtMsgEdtAmb" runat="server" class="lbl"/>

                            <div class="campos">
                                <label class="lbl" for="txtNomeAmbEdt">Nome do Ambiente</label>
                                <input type="text" id= "txtNomeAmbEdt"/>
                            </div>
                            <div class="camposSmall">
                                <label class="lbl" for="txtMedidaEdt">Medida</label>
                                <input type="number" step="any" id= "txtMedidaEdt"/>
                            </div>
                
                            <div class="camposSmall">
                                <label class="lbl">Unidade de medida</label>
                                <div class='radios'>
                                    <input type="radio" name="undMedEdt" value="2" id="2edt" checked="checked"/>
                                </div>
                                <div class='radios'>
                                    m2
                                </div>
                                
                                <div class='radios'>
                                    <input type="radio" name="undMedEdt" value="3" id="3edt"/>
                                </div>
                                <div class='radios'>
                                    m3
                                </div>
                            </div>
                            <div class="campos">
                                <label class="lbl" for="txtEspecieEdt">Especie</label>
                                   
                                <asp:DropDownList runat="server" id="txtEspecieAmbEdt" onchange="minMaxEspEdt()">
                                </asp:DropDownList> 
                            </div>
                
                            
                            <div class="camposSmall">
                                <label class="lbl" for="txtMaxAmbEdt">Temperatura maxima</label>
                                <label id="txtMaxAmbEdt"></label>
                            </div>
                                
                            <div class="camposSmall">    
                                <label class="lbl" for="txtMinAmbEdt">Temperatura minima</label>
                                <label id= "txtMinAmbEdt"></label>
                            </div>
                
                               <button type="button" onclick="editarAmb()">Salvar alterações</button>
            </div>
        </div>
        
        
        
        
        
        <div class="transparenciaGerenciamento" id="excAmb">
            <div class="formAmbiente">
                <div class="x" onclick="x('excAmb')">x</div>
                
                            <div class="campos">
                                <label class="lbl" for="txtAmbienteExc">Ambiente á ser excluido</label>
                                    <select name="txtAmbienteExc" id="txtAmbienteExc" onchange="ExcAmbItem()">
                                    </select>
                            </div>

                
                            <asp:Label Text="" id="txtMsgExcAmb" runat="server" class="lbl"/>
                
                            <div class="campos">
                                <label class="lbl" for="txtNomeAmbExc">Nome do Ambiente</label>
                                <label id= "txtNomeAmbExc"/>
                            </div>
                            <div class="camposSmall">
                                <label class="lbl" for="txtMedidaExc">Medida</label>
                                <label id="txtMedidaExc"/>
                            </div>
                
                            <div class="camposSmall">
                                <label class="lbl">Unidade de medida</label>
                                <div class='radios'>
                                    <input type="radio" name="undMedExc" value="m2" checked="checked" id="2exc" disabled="disabled"/>
                                </div>
                                <div class='radios'>
                                    m2
                                </div>
                                
                                <div class='radios'>
                                    <input type="radio" name="undMedExc" value="m3" id="3exc" disabled="disabled"/>
                                </div>
                                <div class='radios'>
                                    m3
                                </div>
                            </div>
                            <div class="campos">
                                <label class="lbl" for="txtEspecieExc">Especie</label>
                                   
                                <asp:DropDownList runat="server" id="txtEspecieAmbExc" Enabled="false">
                                </asp:DropDownList> 
                            </div>
                
                            
                            <div class="camposSmall">
                                <label class="lbl" for="txtMaxAmbExc">Temperatura maxima</label>
                                <label id= "txtMaxAmbExc"></label>
                            </div>
                                
                            <div class="camposSmall">    
                                <label class="lbl" for="txtMinAmbExc">Temperatura minima</label>
                                <label id= "txtMinAmbExc"></label>
                            </div>
                
                               <button type="button" onclick="excluirAmb()">Excluir Ambiente</button>
            </div>
        </div>
        
        
        
        
        
        
        
        <!--Form de cadastrar espécie-->
        <div class="transparenciaGerenciamento"  id="cadEsp">
            <div class="formEspecie">
                <div class="x" onclick="x('cadEsp')">x</div>

                <label id="txtMsgCadEsp" class="lbl"></label>
                        <div class="campos">
                               <label class="lbl" for="txtNomeEsp">Nome da Espécie</label>
                               <input type="text" id= "txtNomeEsp"/>
                           </div>


                           <div class="campos">
                               <label class="lbl" for="txtTemMaxSup">Temperatura Maxima Suportada em graus Celsius</label>
                               <input type="number" step="any" id="txtTemMaxSup"/>
                           </div>


                           <div class="campos">
                               <label class="lbl" for="txtTemMinSup">Temperatura Minima Suportada em graus Celsius</label>
                               <input type="number" step="any" id="txtTemMinSup"/>
                           </div>

                               <button type="button" onclick="cadastrarEsp()">Cadastrar Espécie</button>
            </div>
        </div>
        
        
        
        <!--Form de editar espécie-->
        <div class="transparenciaGerenciamento"  id="edtEsp">
            <div class="formEspecie">
                <div class="x" onclick="x('edtEsp')">x</div>
                <div class="campos" style="overflow: visible;">
                    <label class="lbl" for="especiesEdt">Espécie á ser editada</label>

                        <asp:DropDownList runat="server" name="especiesEdt" ID="especiesEdt" onchange="EdtEspItem()">
                                
                        </asp:DropDownList>
                </div>
                
                <label id="txtMsgEdtEsp" class="lbl"></label>
                        <div class="campos">
                            <label class="lbl" for="txtNomeEspEdt">Nome da Espécie</label>
                            <input type="text" id= "txtNomeEspEdt"/>
                        </div>


                        <div class="campos">
                            <label class="lbl" for="txtTemMaxSupEdt">Temperatura Maxima Suportada em graus Celsius</label>
                            <input type="number" step="any" id="txtTemMaxSupEdt"/>
                        </div>


                        <div class="campos">
                            <label class="lbl" for="txtTemMinSupEdt">Temperatura Minima Suportada em graus Celsius</label>
                            <input type="number" step="any" id="txtTemMinSupEdt"/>
                        </div>

                            <button type="button" onclick="editarEsp()">Salvar Alterações</button>
            </div>
        </div>
        
        
        
        <!--Form de excluir espécie-->
        <div class="transparenciaGerenciamento"  id="excEsp">
            <div class="formEspecie">
                <div class="x" onclick="x('excEsp')">x</div>
                    <div class="campos" style="overflow: visible;">
                        <label class="lbl" for="especiesExc">Espécie á ser excluída</label>
                        
                        <asp:DropDownList runat="server" name="especiesExc" ID="especiesExc"  onchange="ExcEspItem()">
                                
                        </asp:DropDownList>
                    </div>

                
                <label id="txtMsgExcEsp" class="lbl"></label>
                            <div class="campos">
                                <label class="lbl" for="txtNomeEspExc">Nome da Espécie</label>
                                <label id= "txtNomeEspExc"></label>
                            </div>


                            <div class="campos">
                                <label class="lbl" for="txtTemMaxSupExc">Temperatura Maxima Suportada em graus Celsius</label>
                                <label id="txtTemMaxSupExc"></label>
                            </div>


                            <div class="campos">
                                <label class="lbl" for="txtTemMinSupExc">Temperatura Minima Suportada em graus Celsius</label>
                                <label id="txtTemMinSupExc"></label>
                            </div>
                            
                                <button type="button" onclick="excluirEsp()">Excluir Espécie</button>
            </div>
        </div>
        
        
        
        </form>
        
        <script>


            // Função pra fazer o menu descer ao carregar
            var menu = document.getElementById('desce'); //Coloca o elemento com o ID 'menu' em uma variavel
            menu.style.marginTop = '-100px'; // Muda a margin-top do menu pra -100px

            onload = function () { //qndo a pagina carrega essa função é ativada
                menu.style.transition = '0.5s ease-in'; //muda a transição do menu pra um tempo de 0.5 segundos e ease-in(mais lento no começo da transição)
                menu.style.marginTop = '0'; //Muda a margin-top do menu de volta pra 0
            };
            
            
            /*Variaveis dos forms*/
                
                //Ambiente
                
                var cadAmb = document.getElementById('cadAmb');

                var edtAmb = document.getElementById('edtAmb');

                var excAmb = document.getElementById('excAmb');
            
                
                //Especie
                
                var cadEsp = document.getElementById('cadEsp');

                var edtEsp = document.getElementById('edtEsp');

                var excEsp = document.getElementById('excEsp');

                
                var 
                txtNomeEsp = 0,
                txtTemMaxSup = 0,
                txtTemMinSup = 0,
                txtMsg = "";
        

                attListaAmb();
            //-----------------------------------------------------------

            //função q chama Funçoes q colocam o formulario na tela dependendo da ação escolhida e que preenchem alguns campos automaticamente(como no editar e excluir)
            //Em relação ao ambiente
                function ambiente(acao) {

                    document.getElementById('txtMsgCadAmb').style.color = '#5a7b52';
                    document.getElementById('txtMsgEdtAmb').style.color = '#5a7b52';
                    document.getElementById('txtMsgExcAmb').style.color = '#5a7b52';

                if (acao == 'cadastrar') {
                    minMaxEsp();
                    cadAmb.style.left=0;
                }
                if (acao == 'editar') {
                    
                    EdtAmbItem();
                    edtAmb.style.left = 0;
                }
                if (acao == 'excluir') {
                    ExcAmbItem();
                    excAmb.style.left = 0;
                }
            }

            //Em relação ás especies
                function especie(acao) {


                    document.getElementById('txtMsgCadEsp').style.color = 'whitesmoke';
                    document.getElementById('txtMsgEdtEsp').style.color = 'whitesmoke';
                    document.getElementById('txtMsgExcEsp').style.color = 'whitesmoke';
                
                if (acao == 'cadastrar') {
                    
                    cadEsp.style.left = 0;
                }
                if (acao == 'editar') {
                    
                    EdtEspItem();
                    edtEsp.style.left=0;
                }
                if (acao == 'excluir') {
                    
                    ExcEspItem();
                    excEsp.style.left=0;
                }
            }


            //Função que verifica se os campos estão corretamente preenchidos 
            //e chama um método via AJAX pra fazer o insert dos dados da especie
            function cadastrarEsp(){
                
                txtNomeEsp = document.getElementById("txtNomeEsp");
                txtTemMaxSup = document.getElementById("txtTemMaxSup");
                txtTemMinSup = document.getElementById("txtTemMinSup");
                txtMsg = document.getElementById('txtMsgCadEsp');
                
                if (txtNomeEsp.value == "" || txtTemMaxSup.value == "" || txtTemMinSup.value == "") {
                    txtMsg.style.color = "#910000";
                    txtMsg.textContent = "Por favor preencha todos os campos!!!";

                }
                else if (txtTemMaxSup.value.replace(',', '.') > 100 || txtTemMaxSup.value.replace(',', '.') < -50
                    || txtTemMinSup.value.replace(',', '.') > 100 || txtTemMinSup.value.replace(',', '.') < -50) {
                    txtMsg.style.color = "#910000";
                    
                    txtMsg.textContent = "O sistema nãp suporta temperaturas maiores que 100 °C ou menores que -50 °C";
                }
                else if (txtTemMaxSup.value.replace(',', '.') - txtTemMinSup.value.replace(',', '.')<0) {
                    txtMsg.style.color = "#910000";
                    
                    txtMsg.textContent = "A temperatura mínima não pode ser mais alta que a temperatura máxima!!!";
                }
                else {
                            txtMsg.style.color = "Whitesmoke";
                            txtMsg.textContent = "Aguarde...";
                    var obj = {};
                    obj.nomeEsp = txtNomeEsp.value;
                    obj.max = txtTemMaxSup.value;
                    obj.min = txtTemMinSup.value;
                    
                    $.ajax({

                        type: "POST",
                        url: "Gerenciamento.aspx/CadastrarEspecie",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            txtMsg.style.color = "Whitesmoke";
                            txtMsg.textContent = "Espécie cadastrada com sucesso";

                            txtTemMaxSup.value = "";
                            txtTemMinSup.value = "";
                            txtNomeEsp.value = "";
                            
                            attLista();
                        },
                        error: function () {
                            txtMsg.style.color = "#910000";
                            txtMsg.textContent = "Um erro ocorreu, por favor tente novamente";
                        }

                    });
                }
             }


            //Função que verifica os campos e chama um método via AJAX que faz update nos dados alterados
            function editarEsp(){

                txtNomeEsp = document.getElementById("txtNomeEspEdt");
                txtTemMaxSup = document.getElementById("txtTemMaxSupEdt");
                txtTemMinSup = document.getElementById("txtTemMinSupEdt");
                
                lista = document.getElementById("especiesEdt");
                
                txtMsg = document.getElementById('txtMsgEdtEsp');
                
                if (txtNomeEsp.value == "" || txtTemMaxSup.value == "" || txtTemMinSup.value == "") {
                    txtMsg.style.color = "#910000";
                    txtMsg.textContent = "Por favor preencha todos os campos!!!";

                }
                else if (txtTemMaxSup.value.replace(',', '.') > 100 || txtTemMaxSup.value.replace(',', '.') < -50
                    || txtTemMinSup.value.replace(',', '.') > 100 || txtTemMinSup.value.replace(',', '.') < -50) {
                    txtMsg.style.color = "#910000";
                    
                    txtMsg.textContent = "O sistema nãp suporta temperaturas maiores que 100 °C ou menores que -50 °C";
                }
                else if (txtTemMaxSup.value.replace(',', '.') - txtTemMinSup.value.replace(',', '.')<0) {
                    txtMsg.style.color = "#910000";
                    txtMsg.textContent = "A temperatura mínima não pode ser mais alta que a temperatura máxima!!!";
                }
                else {
                            txtMsg.style.color = "Whitesmoke";
                            txtMsg.textContent = "Aguarde...";
                    var obj = {};
                    obj.nomeEsp = txtNomeEsp.value;
                    obj.max = txtTemMaxSup.value;
                    obj.min = txtTemMinSup.value;
                    obj.cod = lista.value;
                    
                    $.ajax({

                        type: "POST",
                        url: "Gerenciamento.aspx/EditarEspecie",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            txtMsg.style.color = "Whitesmoke";
                            txtMsg.textContent = "Alterações realizadas com sucesso";
                            attLista();
                        },
                        error: function () {
                            txtMsg.style.color = "#910000";
                            txtMsg.textContent = "Um erro ocorreu, por favor tente novamente";
                        }

                    });
                }
                
                
            }


            //Função que chama um método via AJAX que faz o Delete dos campos selecionados
            function excluirEsp(){
                
                txtNomeEsp = document.getElementById("txtNomeEspExc");
                txtTemMaxSup = document.getElementById("txtTemMaxSupExc");
                txtTemMinSup = document.getElementById("txtTemMinSupExc");
                txtMsg = document.getElementById('txtMsgExcEsp');
                txtMsg.style.backgroundColor="transparent"
                lista = document.getElementById("especiesExc");
                
                
                            txtMsg.style.color = "Whitesmoke";
                            txtMsg.textContent = "Aguarde...";
                var obj = {};
                obj.nomeEsp = txtNomeEsp.textContent;
                    obj.max = txtTemMaxSup.textContent;
                    obj.min = txtTemMinSup.textContent;
                    obj.cod = lista.value;
                    
                    $.ajax({

                        type: "POST",
                        url: "Gerenciamento.aspx/ExcluirEspecie",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            txtMsg.style.color = "Whitesmoke";
                            txtMsg.textContent = "Espécie excluida com sucesso";
                            attLista();
                        },
                        error: function () {
                            txtMsg.style.color = "#910000";
                            txtMsg.textContent = "Um erro ocorreu, por favor tente novamente";
                        }

                    });
                
            }
            
            
            
            
            
            //Função que verifica os campos preenchidos e chama um método via AJAX
            //que faz o insert dos dados do ambiente
            function cadastrarAmb() {
                //txtNomeAmb
                //txtMedida
                //2
                //3
                //txtEspecieAmbCad
                //txtMaxAmb
                //txtMinAmb

                var txtNomeAmb = document.getElementById("txtNomeAmb");
                var txtMedida = document.getElementById("txtMedida");
                var txtEspecieAmbCad = document.getElementById("txtEspecieAmbCad");
                var txtMaxAmb = document.getElementById("txtMaxAmb");
                var txtMinAmb = document.getElementById("txtMinAmb");
                    txtMsg = document.getElementById('txtMsgCadAmb');
                var txtCheck;
                if (document.getElementById('2').checked) {
                    txtCheck = document.getElementById('2');
                }
                if (document.getElementById('3').checked) {
                    txtCheck = document.getElementById('3');
                }


                if (txtNomeAmb.value == "" || txtMedida.value == "" || txtCheck.value == "") {
                    txtMsg.style.color = "#910000";
                    txtMsg.textContent = "Por favor preencha todos os campos!!!";

                }
                else {
                    txtMsg.style.color = "#5a7b52";
                    txtMsg.textContent = "Aguarde...";
                    var obj = {};
                    obj.nomeAmb = txtNomeAmb.value;
                    obj.medida = txtMedida.value;
                    obj.codEsp = txtEspecieAmbCad.value;
                    obj.tipo = txtCheck.value;

                    $.ajax({

                        type: "POST",
                        url: "Gerenciamento.aspx/CadastrarAmbiente",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            txtMsg.style.color = "#5a7b52";
                            txtMsg.textContent = "Ambiente cadastrado com sucesso";
                            
                            txtMedida.value = "";
                            txtNomeAmb.value = "";
                            
                            attListaAmb();
                        },
                        error: function () {
                            txtMsg.style.color = "#910000";
                            txtMsg.textContent = "Um erro ocorreu, por favor tente novamente";
                        }

                    });
                }
            }











            function editarAmb() {
                

                
                txtAmbienteEdt = document.getElementById("txtAmbienteEdt");

                txtNomeAmb = document.getElementById("txtNomeAmbEdt");
                txtMedida = document.getElementById("txtMedidaEdt");
                txtEspecieAmb = document.getElementById("txtEspecieAmbEdt");

                txtMaxAmb = document.getElementById("txtMaxAmbEdt");
                txtMinAmb = document.getElementById("txtMinAmbEdt");

                txtMsg = document.getElementById('txtMsgEdtAmb');




                var txtCheck;
                if (document.getElementById('2edt').checked) {
                    txtCheck = document.getElementById('2edt');
                }
                if (document.getElementById('3edt').checked) {
                    txtCheck = document.getElementById('3edt');
                }




                if (txtNomeAmb.value == "" || txtMedida.value == "" || txtCheck.value == "") {
                    txtMsg.style.color = "#910000";
                    txtMsg.textContent = "Por favor preencha todos os campos!!!";

                }
                else {
                    txtMsg.style.color = "#5a7b52";
                    txtMsg.textContent = "Aguarde...";
                    var obj = {};
                    obj.nomeAmb = txtNomeAmb.value;
                    obj.medida = txtMedida.value;
                    obj.codEsp = txtEspecieAmbEdt.value;
                    obj.tipo = txtCheck.value;
                    obj.cod = txtAmbienteEdt.value;

                    $.ajax({

                        type: "POST",
                        url: "Gerenciamento.aspx/EditarAmbiente",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            txtMsg.style.color = "#5a7b52";
                            txtMsg.textContent = "Alterações realizadas com sucesso";
                            

                            attListaAmb();

                        },
                        error: function () {
                            txtMsg.style.color = "#910000";
                            txtMsg.textContent = "Um erro ocorreu, por favor tente novamente";
                        }

                    });
                }    
                
                
            }










            function excluirAmb(){
                

                txtAmbienteExc = document.getElementById("txtAmbienteExc");

                txtNomeAmb = document.getElementById("txtNomeAmbExc");
                txtMedida = document.getElementById("txtMedidaExc");
                txtEspecieAmb = document.getElementById("txtEspecieAmbExc");

                txtMaxAmb = document.getElementById("txtMaxAmbExc");
                txtMinAmb = document.getElementById("txtMinAmbExc");

                txtMsg = document.getElementById('txtMsgExcAmb');




                var txtCheck;
                if (document.getElementById('2edt').checked) {
                    txtCheck = document.getElementById('2edt');
                }
                if (document.getElementById('3edt').checked) {
                    txtCheck = document.getElementById('3edt');
                }


                txtMsg.style.color = "#5a7b52";
                txtMsg.textContent = "Aguarde...";
                var obj = {};
                obj.cod = txtAmbienteExc.value;

                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/ExcluirAmbiente",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function () {

                        txtMsg.style.backgroundColor = "#5a7b52";
                        txtMsg.style.color = "#5a7b52";
                        txtMsg.textContent = "Ambiente excluido com sucesso";


                        attListaAmb();

                    },
                    error: function () {
                        txtMsg.style.color = "#910000";
                        txtMsg.textContent = "Um erro ocorreu, por favor tente novamente";
                    }


                });

            }


            //Função que 'fecha' o formulario (tira ele da tela qndo aperta o X) 
            //e limpa o campo de mensagem(que fica no topo) do formulario
            function x(obj){
                document.getElementById(obj).style.left = '-110vw';

                txtMsg.textContent = "";
                
                
            }


            //Função que verifica qual especie ta selecionada no formulario de editar especie
            //e chama um método via ajax pra fazer um select dos dados da especie selecionada e
            //retornar os resultados para que sejam colocados nos devidos campos
            function EdtEspItem() {


                lista = document.getElementById("especiesEdt");
                
                txtNomeEsp = document.getElementById("txtNomeEspEdt");
                txtTemMaxSup = document.getElementById("txtTemMaxSupEdt");
                txtTemMinSup = document.getElementById("txtTemMinSupEdt");
                
                txtMsg = document.getElementById('txtMsgEdtEsp');

                txtMsg.textContent = "Aguarde...";

                txtTemMaxSup.disabled = true;
                txtTemMinSup.disabled = true;
                txtNomeEsp.disabled = true;

                var obj = {};
                obj.itemSel = lista.value;
                obj.nomeItem = lista.options[lista.selectedIndex].text;
                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/MudarItemEspecie",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(resposta) {
                        
                    txtMsg.textContent = "Altere os campos que desejar";
                        txtNomeEsp.value = resposta.d[0];
                        txtTemMinSup.value = resposta.d[1].replace(',', '.');
                        txtTemMaxSup.value = resposta.d[2].replace(',', '.');
                        
                        txtTemMaxSup.disabled = false;
                        txtTemMinSup.disabled = false;
                        txtNomeEsp.disabled = false;
                
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                    });
            }




            //Função que verifica qual especie ta selecionada no formulario de EXCLUIR especie
            //e chama um método via ajax pra fazer um select dos dados da especie selecionada e
            //retornar os resultados para que sejam colocados nos devidos campos

            function ExcEspItem() {


                lista = document.getElementById("especiesExc");
                
                txtNomeEsp = document.getElementById("txtNomeEspExc");
                txtTemMaxSup = document.getElementById("txtTemMaxSupExc");
                txtTemMinSup = document.getElementById("txtTemMinSupExc");
                
                txtMsg = document.getElementById('txtMsgExcEsp');

                txtMsg.textContent = "Aguarde...";
                

                var obj = {};
                obj.itemSel = lista.value;
                obj.nomeItem = lista.options[lista.selectedIndex].text;
                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/MudarItemEspecie",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resposta) {
                        txtMsg.style.backgroundColor="#910000"
                    txtMsg.textContent = "Deseja excluir essa espécie? ATENÇÃO! TODOS OS AMBIENTES QUE CONTÉM ESSA ESPÉCIE TAMBÉM SERÃO EXCLUIDOS!!!";
                        txtNomeEsp.textContent = resposta.d[0];
                        txtTemMinSup.textContent = resposta.d[1].replace(',', '.');
                        txtTemMaxSup.textContent = resposta.d[2].replace(',', '.');
                        
                
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }


           
            //Função que verifica qual ambiente ta selecionada no formulario de editar ambiente
            //e chama um método via ajax pra fazer um select dos dados da especie selecionada e
            //retornar os resultados para que sejam colocados nos devidos campos

            function EdtAmbItem(){
                /*
                txtAmbienteEdt
                txtNomeAmbEdt
                txtMedidaEdt
                2edt
                3edt
                txtEspecieAmbEdt
                txtMaxAmbEdt
                txtMinAmbEdt
                */


                txtAmbienteEdt = document.getElementById("txtAmbienteEdt");

                txtNomeAmb = document.getElementById("txtNomeAmbEdt");
                txtMedida = document.getElementById("txtMedidaEdt");
                txtEspecieAmb = document.getElementById("txtEspecieAmbEdt");

                txtMaxAmb = document.getElementById("txtMaxAmbEdt");
                txtMinAmb = document.getElementById("txtMinAmbEdt");
                
                txtMsg = document.getElementById('txtMsgEdtAmb');

                txtMsg.textContent = "Aguarde...";


                txtAmbienteEdt.disabled = true;

                txtNomeAmb.disabled = true;
                txtMedida.disabled = true;
                txtEspecieAmb.disabled = true;

                txtMaxAmb.disabled = true;
                txtMinAmb.disabled = true;
                document.getElementById('3edt').disabled = true;
                document.getElementById('2edt').disabled = true;
                

                var obj = {};
                obj.itemSel = txtAmbienteEdt.value;
                obj.nomeItem = txtAmbienteEdt.options[txtAmbienteEdt.selectedIndex].text;
                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/MudarItemAmbiente",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resposta) {

                        txtMsg.textContent = "Altere os campos que desejar";

                        txtNomeAmb.value = resposta.d[0];
                        //txtMinAmb.textContent = resposta.d[1].replace(',', '.');
                        //txtMaxAmb.textContent = resposta.d[2].replace(',', '.');

                        txtMedida.value = resposta.d[1];

                        if (resposta.d[2] == 2) {
                            document.getElementById('2edt').checked = "checked";
                        }

                        if (resposta.d[2] == 3) {
                            document.getElementById('3edt').checked = "checked";
                        }


                        var opts = txtEspecieAmb.options;
                        for (var opt, j = 0; opt = opts[j]; j++) {
                            if (opt.value == resposta.d[3]) {
                                txtEspecieAmb.selectedIndex = j;
                                break;
                            }
                        }
                        

                        minMaxEspEdt();

                        document.getElementById('3edt').disabled = false;
                        document.getElementById('2edt').disabled = false;


                        txtAmbienteEdt.disabled = false;

                        txtNomeAmb.disabled = false;
                        txtMedida.disabled = false;
                        txtEspecieAmb.disabled = false;

                        txtMaxAmb.disabled = false;
                        txtMinAmb.disabled = false;
                        document.getElementById('3edt').disabled = false;
                        document.getElementById('2edt').disabled = false;

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });

            }




            //Função que verifica qual ambiente ta selecionada no formulario de excluir ambiente
            //e chama um método via ajax pra fazer um select dos dados da especie selecionada e
            //retornar os resultados para que sejam colocados nos devidos campos

            function ExcAmbItem() {


                txtAmbienteExc = document.getElementById("txtAmbienteExc");

                txtNomeAmb = document.getElementById("txtNomeAmbExc");
                txtMedida = document.getElementById("txtMedidaExc");
                txtEspecieAmb = document.getElementById("txtEspecieAmbExc");

                txtMaxAmb = document.getElementById("txtMaxAmbExc");
                txtMinAmb = document.getElementById("txtMinAmbExc");

                txtMsg = document.getElementById('txtMsgExcAmb');


                txtMsg.style.backgroundColor = "transparent";
                txtMsg.style.color = "#5a7b52";
                txtMsg.textContent = "Aguarde...";

                
                var obj = {};
                obj.itemSel = txtAmbienteExc.value;
                obj.nomeItem = txtAmbienteExc.options[txtAmbienteExc.selectedIndex].text;
                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/MudarItemAmbiente",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resposta) {
                        txtMsg.style.backgroundColor = "#910000";
                        txtMsg.style.color = "whitesmoke";
                        txtMsg.textContent = "Tem certeza que deseja Escluir esse ambiente? ATENÇÃO, OS DADOS EXCLUIDOS NÃO PODERÃO SER RECUPERADOS!!!";

                        txtNomeAmb.textContent = resposta.d[0];
                        
                        txtMedida.textContent = resposta.d[1];

                        if (resposta.d[2] == 2) {
                            document.getElementById('2exc').checked = "checked";
                        }

                        if (resposta.d[2] == 3) {
                            document.getElementById('3exc').checked = "checked";
                        }



                        var opts = txtEspecieAmb.options;
                        for (var opt, j = 0; opt = opts[j]; j++) {
                            if (opt.value == resposta.d[3]) {
                                txtEspecieAmb.selectedIndex = j;
                                break;
                            }
                        }


                        minMaxEspExc();

                        
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });

            }





            //Função pra atualizar as listas(dropDownList) das especies quando alguma delas é cadastrada, editada ou excluida
            function attLista() {
                especiesExc = document.getElementById("especiesExc");
                
                especiesEdt = document.getElementById("especiesEdt");

                
                txtNomeEspExc = document.getElementById("txtNomeEspExc");
                txtTemMaxSupExc = document.getElementById("txtTemMaxSupExc");
                txtTemMinSupExc = document.getElementById("txtTemMinSupExc");


                txtEspecieAmbCad = document.getElementById("txtEspecieAmbCad");
                txtEspecieAmbEdt = document.getElementById("txtEspecieAmbEdt");
                txtEspecieAmbExc = document.getElementById("txtEspecieAmbExc");
                

                especiesEdt.innerHTML = "";
                
                especiesExc.innerHTML = "";

                
                txtEspecieAmbCad.innerHTML = "";
                txtEspecieAmbEdt.innerHTML = "";
                txtEspecieAmbExc.innerHTML = "";
                

                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/AttListas",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resposta) {
                        
                        for (i = 0; i < (resposta.d[0]).length; i++) {
                            itemLista = document.createElement('option');
                            itemLista.setAttribute("value", (resposta.d[1])[i]);
                            especiesEdt.appendChild(itemLista);
                            itemLista.textContent = (resposta.d[0])[i];

                            if ((resposta.d[0])[i] == document.getElementById('txtNomeEspEdt').value) {
                                itemLista.selected = 'selected';
                            }


                            //lista de esp nos ambientes

                            itemListaCadAmb = document.createElement('option');
                            itemListaCadAmb.setAttribute("value", (resposta.d[1])[i]);
                            itemListaCadAmb.textContent = (resposta.d[0])[i];
                            txtEspecieAmbCad.appendChild(itemListaCadAmb);
                            
                            

                            itemListaEdtAmb = document.createElement('option');
                            itemListaEdtAmb.setAttribute("value", (resposta.d[1])[i]);
                            itemListaEdtAmb.textContent = (resposta.d[0])[i];
                            txtEspecieAmbEdt.appendChild(itemListaEdtAmb);
                            
                            
                            itemListaExcAmb = document.createElement('option');
                            itemListaExcAmb.setAttribute("value", (resposta.d[1])[i]);
                            itemListaExcAmb.textContent = (resposta.d[0])[i];
                            txtEspecieAmbExc.appendChild(itemListaExcAmb);
                            




                            itemListax = document.createElement('option');
                            itemListax.setAttribute("value", (resposta.d[1])[i]);
                            especiesExc.appendChild(itemListax);
                            itemListax.textContent = (resposta.d[0])[i];

                            especiesExc.options[0].selected = 'selected';



                            //fazer a excluir voltar pro primeiro com os dados certos
                            var obj = {};
                            obj.itemSel = especiesExc.value;
                            obj.nomeItem = especiesExc.options[especiesExc.selectedIndex].text;
                            $.ajax({

                                type: "POST",
                                url: "Gerenciamento.aspx/MudarItemEspecie",
                                data: JSON.stringify(obj),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (resposta) {
                                     txtNomeEspExc.textContent = resposta.d[0];
                                    txtTemMinSupExc.textContent = resposta.d[1].replace(',', '.');
                                    txtTemMaxSupExc.textContent = resposta.d[2].replace(',', '.');
                        
                
                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                }
                                });
                            
                        }

                
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            


            //Função pra colocar os valores minimo e maximo da especie no campo do formulario (labels de temperatura minima e maxima)
            //de cadastrar ambiente quando uma especie é selecionada
            function minMaxEsp() {
                
                var txtEspecieAmbCad = document.getElementById("txtEspecieAmbCad");
                var txtMaxAmb = document.getElementById("txtMaxAmb");
                var txtMinAmb = document.getElementById("txtMinAmb");
                var txtMsg = document.getElementById('txtMsgCadAmb');
                
                

                
                    var obj = {};
                    obj.codEsp = txtEspecieAmbCad.value;

                    $.ajax({

                        type: "POST",
                        url: "Gerenciamento.aspx/SelectEspecie",
                        data: JSON.stringify(obj),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (especie) {
                            txtMaxAmb.textContent = especie.d[2];
                            txtMinAmb.textContent = especie.d[1];
                        },
                        error: function () {
                            txtMsg.textContent = "Erro";
                        }

                    });

            }



            function minMaxEspEdt() {

                var txtEspecieAmbEdt = document.getElementById("txtEspecieAmbEdt");
                var txtMaxAmb = document.getElementById("txtMaxAmbEdt");
                var txtMinAmb = document.getElementById("txtMinAmbEdt");
                var txtMsg = document.getElementById('txtMsgEdtAmb');
                
                var obj = {};
                obj.codEsp = txtEspecieAmbEdt.value;

                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/SelectEspecie",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (especie) {
                        txtMaxAmb.textContent = especie.d[2];
                        txtMinAmb.textContent = especie.d[1];
                    },
                    error: function () {
                        txtMsg.textContent = "Erro";
                    }

                });

            }

            function minMaxEspExc() {

                var txtEspecieAmbExc = document.getElementById("txtEspecieAmbExc");
                var txtMaxAmb = document.getElementById("txtMaxAmbExc");
                var txtMinAmb = document.getElementById("txtMinAmbExc");
                var txtMsg = document.getElementById('txtMsgExcAmb');

                var obj = {};
                obj.codEsp = txtEspecieAmbExc.value;

                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/SelectEspecie",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (especie) {
                        txtMaxAmb.textContent = especie.d[2];
                        txtMinAmb.textContent = especie.d[1];
                    },
                    error: function () {
                        txtMsg.textContent = "Erro";
                    }

                });

            }





            //Função pra atualizar as listas(dropDownList) dos ambientes quando algum deles é cadastrado, editado ou excluido
            function attListaAmb() {

                /*
                txtAmbienteEdt
                txtAmbienteExc
                */
                //ta sem o negocio de voltar ao primeiro qndo excluir e editar


                txtAmbienteEdt = document.getElementById("txtAmbienteEdt");

                txtAmbienteExc = document.getElementById("txtAmbienteExc");

                

                

                txtAmbienteEdt.innerHTML = "";

                txtAmbienteExc.innerHTML = "";

                

                $.ajax({

                    type: "POST",
                    url: "Gerenciamento.aspx/AttListasAmb",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resposta) {

                        for (i = 0; i < (resposta.d[0]).length; i++) {
                            itemLista = document.createElement('option');
                            itemLista.setAttribute("value", (resposta.d[1])[i]);
                            txtAmbienteEdt.appendChild(itemLista);
                            itemLista.textContent = (resposta.d[0])[i];
                            

                            if ((resposta.d[0])[i] == document.getElementById('txtNomeAmbEdt').value) {
                                itemLista.selected = 'selected';
                            }




                            itemListax = document.createElement('option');
                            itemListax.setAttribute("value", (resposta.d[1])[i]);
                            txtAmbienteExc.appendChild(itemListax);
                            itemListax.textContent = (resposta.d[0])[i];

                            txtAmbienteExc.options[0].selected = 'selected';
                            ExcAmbItem();

                            
                        }


                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }



        </script>
    </body>
</html>
