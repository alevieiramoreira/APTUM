<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="APTUM.perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="height: 100%; width: 100%;">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	<title>APTUM - Perfil</title>
	<link rel="stylesheet" href="css.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/> <!--link do bootsrap-->
	<link rel="shortcut icon" href="imagens/APTUMicon2.png"/>

	<script src="https://code.jquery.com/jquery-3.3.1.js"></script> <!--link do jquery-->

	<script src="moment.min.js"></script>
	<script src="Chart.js"></script>
	<script src="utils.js"></script>
</head>
<body style="height: 100%; width: 100%;">
    <nav>
			<!-- conjunto de links de navegação.-->
			<div class="logo">
				<!--A class onde insere o logo-->
				<img src="imagens/aptum.png"/>
			</div>
            
        <form runat="server" >
			<div class="menu" id="desce">
               
				<ul>
                     <div id="listaSelectAmb">
                         <asp:Label runat="server" Text="Ambiente monitorado" ID="lblSeelctAmb" CssClass="lbl"/>
                        
                            <select id="txtAmb" name="txtAmb" onchange="trocarAmb()">
                                
                            </select>
                        
                        
                    </div>
					<a href="index.html"><li>Home</li></a>
					<a href="produto.html"><li>E-Scale</li></a>
					<a href="empresa.html"><li>APTUM™</li></a>
					<a href="faq.aspx"><li>Contatos</li></a>

                    <asp:Button Text="Gerenciar Ambientes e Espécies" runat="server" OnClick="Unnamed_Click" cssClass="btnPerfil"/>
						
					
				</ul>
			</div>
                         
                    </form>
		</nav>


		<div class="paginaGraf">
			<div id="areaGraf">

				<canvas id="chart"></canvas>
				<div id="areaTabela">


					<div id="caixaRolagemTabela">
						<table id="tabelaTitulo">
							<tr>
								<th>Data</th>
								<th>Hora</th>
								<th>Temperatura</th>
								<th>Média</th>
							</tr>
						</table>
						<table id="tabelaDados"></table>
					</div>
				</div>
			</div>

			<div id="areaTerm">
				<div class="termTolerancia">
					<div id="tolerancia">

					</div>
					<div class="txtTolerancia" id="txtTolMaxima">

						<!--Máx-->
						<div id="numTolMax"></div>
					</div>
					<div class="txtTolerancia" id="txtTolMinima">
						<!--Min-->
						<div id="numTolMin"></div>
					</div>
				</div>
				<div id="termTrack">
					<div id="termBar">

					</div>
				</div>
				<div class="termHiddenTrack">
					<div id="txtTemp">

					</div>
				</div>
			</div>
			<div id="areaDados">
                

					<div class='infoAmbiente' id="txtNomeCli" runat="server" style="margin-top: 15%; color: whitesmoke;">
                        NOME DO USER
					</div>
				<div id='tituloDados'>Dados dos últimos <span id="maxRegistrosCalculados"></span> registros</div>
				<div id='areaCirculo'>
					<div class='espaçoCirculo'>
						<div class='tituloCirculo'></div>
						<div class='circuloDadosCima' id='Media'></div>
						<div class='tituloCirculo'>Média</div>
					</div>

					<div class='espaçoCirculo'>
						<div class='tituloCirculo'></div>
						<div class='circuloDadosCima' id="DesvPad"></div>
						<div class='tituloCirculo'>Desvio Padrão</div>
					</div>

					<div class='espaçoCirculo'>
						<div class='tituloCirculo'>Moda</div>
						<div class='circuloDadosCima' style="padding-top: 0; height: 70px;">
							<div class='lugarzinhoNoCirculo' id='Moda'></div>

							<div class='lugarzinhoNoCirculo' id='Freq'></div>
						</div>
						<div class='tituloCirculo'>Frequência</div>
					</div>

				</div>
				<div class="QuartilInfo">
					<div class="AreaQuartil">
						<div class="TituloQuartil">
							Min
						</div>
						<div class="Quartil" id="txtMin">
							0.00
						</div>
					</div>
					<div class="AreaQuartil">
						<div class="TituloQuartil">
							1º Quartil
						</div>
						<div class="Quartil" id="txtQ1">
							0.00
						</div>
					</div>
					<div class="AreaQuartil">
						<div class="TituloQuartil">
							Mediana
						</div>
						<div class="Quartil" id="txtQ2">
							0.00
						</div>
					</div>
					<div class="AreaQuartil">
						<div class="TituloQuartil">
							3º Quartil
						</div>
						<div class="Quartil" id="txtQ3">
							0.00
						</div>
					</div>
					<div class="AreaQuartil">
						<div class="TituloQuartil">
							Max
						</div>
						<div class="Quartil" id="txtMax">
							0.00
						</div>
					</div>
				</div>
				<div class="dadosAmbiente">
					<div class='infoAmbiente' id="txtNomeAmb" runat="server">
						Ambiente:
					</div>
					<div class='infoAmbiente'>
						<div>Tolerância: </div> <span id='lblToleranciaMin' runat="server">-100</span>°C - <span id='lblToleranciaMax' runat="server">100</span>ºC
					</div>
					<div class='infoAmbiente' id="txtAreaAmb" runat="server">
						Área:
					</div>
					<div class='infoAmbiente' id="txtEspecieAmb" runat="server">
						Animal:
					</div>
				</div>
			</div>
		</div>



        <div class="transparenciaGerenciamento" id="rel">
            <div class="form">
                
                <div class="camposSmall" style="overflow:visible;">
                    Gerar Relatórios:
                </div>
                <div class="campos" style="overflow:visible;">
                    <select id="txtRel" name="txtRel" onchange="Gerar()">
                        <option value="0">Ultima Hora Simplificado (10 em 10 minutos)</option>
                        <option value="1">Ultima Hora Detalhado (por segundo)</option>
                        <option value="2">Ultimas 24 Horas</option> 
                        <option value="3">Ultima Semana</option>    
                        <option value="4">Ultimo Mês</option>    
                        <option value="5">Ultimo Ano</option>    
                        <option value="6">Especificar Data:</option>   
                    </select>
                </div>
                <div class="x" onclick="x()">x</div>
                <div class="formSide"></div>
            </div>
        </div>
        

        <script type="text/javascript">
                        var menu = document.getElementById('desce'); //Coloca o elemento com o ID 'menu' em uma variavel
		menu.style.marginTop = '-100px'; // Muda a margin-top do menu pra -100px

		onload = function () { //qndo a pagina carrega essa função é ativada
			menu.style.transition = '0.5s ease-in'; //muda a transição do menu pra um tempo de 0.5 segundos e ease-in(mais lento no começo da transição)
			menu.style.marginTop = '0'; //Muda a margin-top do menu de volta pra 0

		};

		// Scrolling Effect

		$(window).on("scroll load", function () { //Rola a janela para uma posição específica no documento e a tag "scroll" e uma tag que faz a exibição do objeto.
			$('nav').addClass('black');//Onde as condiçoes são quando a barra de navegação conhecida como "nav" nao estiver no topo vai adicionar a "cor" escolhida

		});


		//Rolagem lisa qndo clica nos links do menu
		$(document).ready(function () {

			$("a").on('click', function (event) { // Adiciona rolagem pra todos os links (tag <a>)


				if (this.hash !== "") { // ativa "Se href do link não tiver vazio"

					event.preventDefault(); // Previne comportamentos padrão qndo clica em links


					var hash = this.hash; //  Guarda o 'href' em uma variavel

					//Usando o método animate() do jQuery pra adicionar a rolagem lisa
					$('html, body').animate({
						scrollTop: $(hash).offset().top
					}, 800, function () { // O número (800) é quantos milisegundos demora pra rolar até o local


						window.location.hash = hash; // Adiciona hash (#) no URL (endereço da pagina) quando termina de rolar (Isso é um comportamento padrão só q foi prevenido lá em cima)
					});
				} // Fim do if
			});
		});

            



                /*----------------------------------------------Tentem entender a index da Marise antes-------------------------------------------------*/
                var context = document.getElementById("chart").getContext("2d");
                context.canvas.height = '100';
                context.canvas.width = '250';


                var configuration = {
                    type: 'line',

                    data: {

                        datasets: [{
                            label: "Temperatura por segundo",
                            type: 'line',
                            fill: true,
                            backgroundColor: "rgba(230,230,230,0.8)",
                            borderColor: "rgba(230,230,230,1)",
                            borderWidth: 2,
                            pointRadius: 10,
                            pointHoverRadius: 15,
                            showLine: true

                        }]
                    },

                    options: {
                        legend: {
                            labels: {
                                fontColor: "rgb(230,230,230)",
                                fontSize: 11
                            }
                        },
                        responsive: true,
                        title: {
                            display: true,
                            text: 'AMBIENTE 1',
                            fontColor: "rgba(230,230,230,1)"
                        },
                        tooltips: {
                            mode: 'index',
                            intersect: false,
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true
                        },
                        scales: {
                            xAxes: [{
                                //type: 'value',
                                fontColor: "rgba(230,230,230,0.7)",
                                display: false,
                                distribution: 'series',
                                ticks: {
                                    fontColor: "rgba(230,230,230,1)",
                                    beginAtZero: true,
                                }
                            }],
                            yAxes: [{
                                scaleLabel: {
                                    fontColor: "rgba(230,230,230,0.7)",
                                    display: true,
                                    labelString: 'Temperatura'
                                },
                                ticks: {
                                    fontColor: "rgba(230,230,230,1)",
                                    beginAtZero: true
                                }
                            }]
                        },
                        animation: {
                            duration: 100,
                        }
                    }
                };

                var chart = new Chart(context, configuration);

                //Função para obter os dados de temperatura do server
                //Seria mais interessante fazer isso com WebSocket, porém para fins academicos, os dados serão atualizados via HTTP

                //Esse atributo dentro do contexto serve para saber qual foi o último índice processado, assim eliminado os outros elementos na
                //hora de montar/atualizar o gráfico
                this.lastIndexTemp = 0;
                this.time = 0;

                var obj = [];
                var termometro = document.getElementById('termBar');
                var txtTemp = document.getElementById('txtTemp');
                var escala = 0.5;



                var maxColuna = 50;


                var lblToleranciaMax = document.getElementById('lblToleranciaMax');
                var lblToleranciaMin = document.getElementById('lblToleranciaMin');


                var toleranciamin = -100;
                var toleranciamax = 100;


                var lblTolMaximaTerm = document.getElementById("txtTolMaxima");

                var numTolMax = document.getElementById("numTolMax");

                var lblTolMinimaTerm = document.getElementById("txtTolMinima");

                var numTolMin = document.getElementById("numTolMin");

                var tolerancia = document.getElementById('tolerancia');


            


                var txtMedia = document.getElementById('Media');
                var txtModa = document.getElementById('Moda');
                var txtFreq = document.getElementById('Freq');
                var txtDesvPad = document.getElementById('DesvPad');
                var txtMin = document.getElementById('txtMin');
                var txtQ1 = document.getElementById('txtQ1');
                var txtQ2 = document.getElementById('txtQ2');
                var txtQ3 = document.getElementById('txtQ3');
                var txtMax = document.getElementById('txtMax');

                var tabela = document.getElementById('tabelaDados');

            var txtAmb = document.getElementById('txtAmb');

            

            var toleranciamin;

            var toleranciamax;

            function get_data() {

                


                    var parametros = {};
                    parametros.itemSel = txtAmb.value;
                
                
                    $.ajax({

                        type: "POST",
                        url: "perfil.aspx/MudarItemAmbiente",
                        data: JSON.stringify(parametros),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (resposta) {
                            //0=nome 1=medida 2=tipomedida 3=codanimal 4codAmb 5=nomeEsp 6=min 7=max

                            toleranciamin = resposta.d[6];
                            toleranciamax = resposta.d[7];
                        
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                        }
                    });
                
                
                    toleranciamax = toleranciamax.replace(',', '.');
                    toleranciamin = toleranciamin.replace(',', '.');


                    lblTolMaximaTerm.style.top = (100 - toleranciamax) * escala - 7 + "%";

                    numTolMax.textContent = toleranciamax + ' °C';
                    lblTolMinimaTerm.style.top = (100 - toleranciamin) * escala + "%";
                    numTolMin.textContent = toleranciamin + ' °C';
                    lblToleranciaMax.textContent = toleranciamax;
                    lblToleranciaMin.textContent = toleranciamin;

                    
                    tolerancia.style.height = (toleranciamax - toleranciamin) * escala + '%';
                    tolerancia.style.top = (100 - toleranciamax) * escala + "%";
                    tolerancia.style.bottom = 'auto';
                    /*
                       var http = new XMLHttpRequest();
                       http.open('GET', 'http://localhost:3000/api', false);
                       http.send(null);
        
        
                       var objeto = JSON.parse(http.responseText);
        
                       if (objeto.data.length === 0){
                           return;
                       }
        
                       obj = objeto.data;
                    */
                
                    $.ajax({

                        type: "POST",
                        url: "perfil.aspx/SelectTemp",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (resposta) {
                            //0=nome 1=medida 2=tipomedida 3=codanimal 4codAmb 5=nomeEsp 6=min 7=max

                            obj[obj.length] =resposta.d.replace(',','.');

                        
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                        }
                    });
                
                    //obj[obj.length] = obj[obj.length - 1] + (Math.floor(Math.random() * 5) - 2);




                    var hoje, agora, min, q1, q2, q3, max;




                    var temp = obj[obj.length - 1];

                    if (obj[obj.length - 1] < 0) {

                        termometro.style.top = '50%';

                        termometro.style.bottom = 'auto';
                        termometro.style.height = (obj[obj.length - 1] * -1) * escala + '%';
                        txtTemp.style.top = 49 + (obj[obj.length - 1] * -1) * escala + '%';
                        txtTemp.style.bottom = 'auto';

                    }
                    else {
                        termometro.style.top = 'auto';
                        termometro.style.bottom = '50%';
                        termometro.style.height = (obj[obj.length - 1]) * escala + '%';

                        txtTemp.style.bottom = 46 + (obj[obj.length - 1]) * escala + '%';
                        txtTemp.style.top = 'auto';
                    }

                    if ((obj[obj.length - 1] - toleranciamax) > 0) {

                        termometro.style.backgroundColor = 'rgba(230,90,80,1)';
                        chart.data.datasets[0].backgroundColor = 'rgba(230,90,80,0.7)';
                        chart.update;
                    }
                    else if ((obj[obj.length - 1] - toleranciamin) < 0) {
                        termometro.style.backgroundColor = 'rgba(40,90,200,1)';
                        chart.data.datasets[0].backgroundColor = 'rgba(30,130,200,0.7)';
                        chart.update;

                    }
                    else {
                        termometro.style.backgroundColor = 'rgba(230,230,230,1)';
                        chart.data.datasets[0].backgroundColor = 'rgba(230,230,230,0.7)';
                        chart.update;
                    }


                    txtTemp.textContent = obj[obj.length - 1];
                

                if (obj.length === 0) {
                        
                        return;
                }
                
                    var _lastIndexTemp = this.lastIndexTemp;
                    this.lastIndexTemp = obj.length;
                listTemp = obj.slice(_lastIndexTemp);

                    listTemp.forEach(data => {
                        //Máximo de 60 itens exibidos no gráfico
                        if (chart.data.labels.length == 10 && chart.data.datasets[0].data.length == 10) {
                            chart.data.labels.shift();
                            chart.data.datasets[0].data.shift();
                        }

                        chart.data.labels.push(this.time++);
                        chart.data.datasets[0].data.push(parseFloat(data));
                        chart.update();
                    });
                
                    var moda = calcmoda(obj);
                    
                }

                setInterval(() => {
                    get_data();
            }, 1000);



                setInterval(function() {

                    //---------------------------MÉDIA---------------------------------------

                    $.ajax({

                        type: "POST",
                        url: "perfil.aspx/SelectMedia",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (resposta) {
                            //0=nome 1=medida 2=tipomedida 3=codanimal 4codAmb 5=nomeEsp 6=min 7=max

                            var Med = ((resposta.d).replace(',', '.'));
                            txtMedia.textContent = (Med * 1).toFixed(1) + "°C";

                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {

                        }
                    });


                    //----------------------QUARTIL--------------------------------------------
                    
                    $.ajax({

                        type: "POST",
                        url: "perfil.aspx/SelectQuartil",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (resposta) {
                            

                            var min = resposta.d[0];
                            var q1 = resposta.d[1];
                            var q2 = resposta.d[2];
                            var q3 = resposta.d[3];
                            var max = resposta.d[4];
                            var desvPad = resposta.d[5];

                            txtMin.textContent = min + " ºC";
                            txtQ1.textContent = q1 + " ºC";
                            txtQ2.textContent = q2 + " ºC";
                            txtQ3.textContent = q3 + " ºC";
                            txtMax.textContent = max + " ºC";

                            txtDesvPad.textContent = desvPad + "°C";


                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                        }
                    });
                    //---------------------------------------------------------------------------

                }, 1000);


                function calcmoda(lista) {
                    var msg = "\n ";
                    var freq = 0;
                    var qtdRepete = []; //Array q conta qntas vezes o numero repete
                    for (i = 0; i < lista.length; i++) {
                        var numComp = lista[i];
                        qtdRepete[i] = 0; //Começa no 0

                        for (j = 0; j < 600; j++) {
                            if (numComp == lista[lista.length-j-1]) {
                                qtdRepete[i]++; // Se o numero aparecer aumenta 1 (ele aparece ao menos 1 vez)
                            }
                        }
                        msg += "O número " + numComp + " se repete: " + qtdRepete[i] + " vez(es)\n ";
                    }

                    var qtd = 0;
                    var indexMaisRepete = 0;
                    for (i = 0; i < qtdRepete.length; i++) {
                        if (qtdRepete[i] > qtd) {
                            qtd = qtdRepete[i];
                            indexMaisRepete = i;
                            freq = ((qtd * 100) / lista.length).toFixed(0);
                        }
                    }

                    txtModa.textContent = lista[indexMaisRepete] + "°C";
                    txtFreq.textContent = freq + "%";

                    return (lista[indexMaisRepete]);
                }


                function dataAtual() {
                    var hoje = new Date();
                    var dd = hoje.getDate();
                    var mm = hoje.getMonth() + 1; //Janeiro é 0!
                    var aaaa = hoje.getFullYear();



                    if (dd < 10) { //Se for menor q dez pra ficar, por exemplo: 01/01/1999 no lugar de 1/1/1999
                        dd = '0' + dd;
                    }

                    if (mm < 10) {
                        mm = '0' + mm;
                    }

                    hoje = dd + '/' + mm + '/' + aaaa;
                    return (hoje);
                }

                function horaAtual() {
                    var agora = new Date();
                    var segundo = agora.getSeconds();
                    var minuto = agora.getMinutes();
                    var hora = agora.getHours();
                    agora = hora + ":" + minuto + ":" + segundo;
                    return (agora);
                }

                var colunaAtual = 0;



                var lastDate = "";

                setInterval (function() {
                    var temp, media, ano, mes, dia, hora, minuto, segundo;


                    $.ajax({

                        type: "POST",
                        url: "perfil.aspx/SelectHistorico",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (resposta) {

                            temp = resposta.d[0];
                            media = resposta.d[1];
                            ano = resposta.d[2];
                            mes = resposta.d[3];
                            dia = resposta.d[4];
                            hora = resposta.d[5];
                            minuto = resposta.d[6];
                            segundo = resposta.d[7];

                            if (lastDate != ano + "/" + mes + "/" + dia + " " + hora + " " + minuto + " " + segundo) {

                                lastDate = ano + "/" + mes + "/" + dia + " " + hora + " " + minuto + " " + segundo;

                                var tr = document.createElement('tr'); /*Cria uma elemento 'div' e armazena ele na variavel classTel*/
                                tr.setAttribute("id", "tr" + colunaAtual); /*Adiciona o atributo (class='telefone') na variavel classTel*/

                                tabela.insertAdjacentElement('afterbegin', tr); /*Insere o elemento classTel dentro do tels no site*/

                                var tdHoje = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
                                tdHoje.textContent = dia + "/" + mes + "/" + ano;

                                var tdAgora = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
                                tdAgora.textContent = hora + ":" + minuto + ":" + segundo;

                                var tdTemp = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
                                tdTemp.textContent = temp + " ºC";

                                var tdMedia = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
                                tdMedia.textContent = media + " ºC";

                                tr.appendChild(tdHoje); /*Coloca o elemento newTel dentro do elemento classTel no site*/
                                tr.appendChild(tdAgora); /*Coloca o elemento newTel dentro do elemento classTel no site*/
                                tr.appendChild(tdTemp); /*Coloca o elemento newTel dentro do elemento classTel no site*/
                                tr.appendChild(tdMedia); /*Coloca o elemento newTel dentro do elemento classTel no site*/
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {

                        }
                    });
                    
                    
                    if (colunaAtual >= maxColuna) {
                        var excluir = document.getElementById('tr' + (colunaAtual - maxColuna));
                        tabela.removeChild(excluir);
                        excluir = undefined;
                    }

                    colunaAtual++;

                }, 10000);


            listarAmb();
            function listarAmb() {

                txtAmb = document.getElementById("txtAmb");

                txtAmb.innerHTML = "";




                $.ajax({

                    type: "POST",
                    url: "perfil.aspx/AttListasAmb",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resposta) {

                        for (i = 0; i < (resposta.d[0]).length; i++) {
                            itemLista = document.createElement('option');
                            itemLista.setAttribute("value", (resposta.d[1])[i]);
                            txtAmb.appendChild(itemLista);
                            itemLista.textContent = (resposta.d[0])[i];


                            if ((resposta.d[0])[i] == document.getElementById('txtNomeAmb').value) {
                                itemLista.selected = 'selected';
                            }
                            trocarAmb();
                        }

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }


                

            function trocarAmb() {
                    var txtAmb = document.getElementById("txtAmb");


                    var lblTolMaximaTerm = document.getElementById("txtTolMaxima");

                    var numTolMax = document.getElementById("numTolMax");

                    var lblTolMinimaTerm = document.getElementById("txtTolMinima");

                    var numTolMin = document.getElementById("numTolMin");

                    var tolerancia = document.getElementById('tolerancia');

                    var txtNomeAmb = document.getElementById('txtNomeAmb');
                    var txtAreaAmb = document.getElementById('txtAreaAmb');
                    var txtEspecieAmb = document.getElementById('txtEspecieAmb');

                    var txtNomeCli = document.getElementById('txtNomeCli');


                    
                
                    var obj = {};
                    obj.itemSel = txtAmb.value;
                    obj.nomeItem = txtAmb.options[txtAmb.selectedIndex].text;

                $.ajax({

                    type: "POST",
                    url: "perfil.aspx/MudarItemAmbiente",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resposta) {
                        //0=nome 1=medida 2=tipomedida 3=codanimal 4codAmb 5=nomeEsp 6=min 7=max
                        
                        
                        numTolMax.textContent = resposta.d[7];
                        
                        
                        numTolMin.textContent = resposta.d[6];
  

                        txtNomeAmb.textContent = resposta.d[0];

                        if (resposta.d[2].includes("2")) {
                            txtAreaAmb.textContent = resposta.d[1] + " m²";
                        }
                        else if (resposta.d[2].includes("3")) {
                            txtAreaAmb.textContent = resposta.d[1] + " m³";
                        }

                        txtEspecieAmb.textContent = resposta.d[5];
                        
                        

                        var opts = txtAmb.options;
                        for (var opt, j = 0; opt = opts[j]; j++) {
                            if (opt.value == resposta.d[4]) {
                                txtAmb.selectedIndex = j;
                            }
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                    });

            }



            function relatorio() {
                rel = document.getElementById('rel');
                rel.style.left = 0;

                Gerar();
            }

            function x() {
                document.getElementById('rel').style.left = '-110vw';
            }
            function Gerar() {

                var txtRel = document.getElementById('txtRel');
                var valorS = txtRel.value;

                var hoje = new Date();
                var dd = hoje.getDate();
                var mm = hoje.getMonth() + 1; //Janeiro é 0!
                var aaaa = hoje.getFullYear();
                
                if (dd < 10) { //Se for menor q dez pra ficar, por exemplo: 01/01/1999 no lugar de 1/1/1999
                    dd = '0' + dd;
                }

                if (mm < 10) {
                    mm = '0' + mm;
                }
                
                var agora = new Date();
                var segundo = agora.getSeconds();
                var minuto = agora.getMinutes();
                var hora = agora.getHours();
                


                //2018-06-19 18:40:00

                if (valorS == 0) {
                    alert("SELECT TEMP_MOMENTO, TEMP_MEDIA, DATA_HISTORICO FROM TB_HISTORICO WHERE DATA_HISTORICO > DateAdd(Hour, -4, Current_timestamp)");
                }
                else if (valorS == 1) {
                    alert("SELECT TEMPERATURA_TEMP, DATA_TEMP, COD_AMBIENTE FROM TB_TEMPERATURA_REAL WHERE DATA_TEMP > DateAdd(Hour, -4, Current_timestamp)");

                }
                else if (valorS == 2) {
                    alert("SELECT TEMP_MOMENTO, TEMP_MEDIA, DATA_HISTORICO FROM TB_HISTORICO WHERE DATA_HISTORICO > '" + aaaa + "-" + mm + "-" + (hoje.getDate() - 1)+" "+hora+":"+minuto+":"+segundo+"'");

                }
                else if (valorS == 3) {
                    alert("SELECT TEMP_MOMENTO, TEMP_MEDIA, DATA_HISTORICO FROM TB_HISTORICO WHERE DATA_HISTORICO > '" + aaaa + "-" + mm + "-" + (hoje.getDate()-7) + " " + hora + ":" + minuto + ":" + segundo +"'");

                }
                else if (valorS == 4) {
                    alert("SELECT TEMP_MOMENTO, TEMP_MEDIA, DATA_HISTORICO FROM TB_HISTORICO WHERE DATA_HISTORICO > '" + aaaa + "-" + hoje.getMonth() + "-" + dd+ " " + hora + ":" + minuto + ":" + segundo + "'");

                }
                else if (valorS == 5) {
                    alert("SELECT TEMP_MOMENTO, TEMP_MEDIA, DATA_HISTORICO FROM TB_HISTORICO WHERE DATA_HISTORICO > '" + (hoje.getFullYear()-1) + "-" + hoje.getMonth() + "-" + dd + " " + hora + ":" + minuto + ":" + segundo + "'");

                }
                else if (valorS == 6) {
                    alert("...");

                }
            }

        </script>

</body>
</html>
