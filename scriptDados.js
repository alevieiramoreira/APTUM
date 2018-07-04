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



		
		var obj = [-3,0,3, 1,0];
		
		var escala = 0.5;



		var maxColuna = 50;

		var toleranciamax = 32;
		var toleranciamin = 15;

		var tabela = document.getElementById('tabelaDados');
		


		function get_data() {


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
                  
			obj[obj.length] = obj[obj.length - 1] + (Math.floor(Math.random() * 5) - 2);
			 
			 
			 
			 
			var hoje, agora, min, q1, q2, q3, max;

			


			var temp = obj[obj.length - 1];

			
			

			

			if (obj.length === 0) {
				return;
			}
			var _lastIndexTemp = this.lastIndexTemp;
			this.lastIndexTemp = obj.length;
			listTemp = obj.slice(_lastIndexTemp);
			




			//---------------------------MÉDIA---------------------------------------
			var base;
			var listaDados = [];

			if (obj.length - 1 <= maxColuna) {
				base = obj.length - 1;
			}
			else {
				base = maxColuna;
			}
            


			var media = 0;
			for (i = base; i >= 1; i--) {
				media += obj[obj.length - i];
				listaDados.push(obj[obj.length - i]);
			}
			media = media / base;
			
			//------------------------------------------------------------------------


			var moda = calcmoda(listaDados);
			var dp = desvioPadrao(media, listaDados);
			var listaQ = quartil(listaDados);


			hoje = dataAtual();
			agora = horaAtual();


			addDadoTabela(hoje, agora, temp, media, moda, dp, listaQ[0], listaQ[1], listaQ[2], listaQ[3], listaQ[4]);

		}

		setInterval(() => {
			get_data();
		}, 1000);



		function calcmoda(lista) {
			var msg = "\n ";
			var freq = 0;
			var qtdRepete = []; //Array q conta qntas vezes o numero repete
			for (i = 0; i < lista.length; i++) {
				var numComp = lista[i];
				qtdRepete[i] = 0; //Começa no 0

				for (j = 0; j < lista.length; j++) {
					if (numComp == lista[j]) {
						qtdRepete[i]++; // Se o numero aparecer aumenta 1 (ele aparece ao menos 1 vez)
					}
				}
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


			return (lista[indexMaisRepete]);
			//window.alert(indexMaisRepete+" "+qtd);
			//window.alert(msg + "\n numero "+ lista[indexMaisRepete]+" indice: "+indexMaisRepete+" repete: "+qtd);
		}

		function desvioPadrao(media, lista) {
			var variancia = 0;
			var desvioPadrao;

			for (i = 0; i < lista.length; i++) {
				variancia += (lista[i] - media) * (lista[i] - media);
			}
			variancia = variancia / lista.length;
			desvioPadrao = Math.sqrt(variancia);
			
			return (desvioPadrao.toFixed(2));
		}

		function quartil(lista) {
			lista = lista.sort(comparar);

			function comparar(a, b) {
				return a - b;
			}

			var indexQ2 = 0;
			min = lista[0];
			max = lista[lista.length - 1];

			if ((lista.length % 2) == 0) {
				indexQ2 = Math.floor(lista.length / 2);
				q2 = (lista[indexQ2 - 1] + lista[indexQ2]) / 2;

				q1 = (lista[Math.floor((indexQ2 - 1) - Math.floor((indexQ2 + 1) / 2))] + lista[indexQ2 - Math.floor((indexQ2 + 1) / 2)]) / 2;

				q3 = (lista[Math.floor((indexQ2 - 1) + Math.floor((indexQ2 + 1) / 2))] + lista[indexQ2 + Math.floor((indexQ2 + 1) / 2)]) / 2;

			}
			else {
				indexQ2 = Math.floor(lista.length / 2);
				q2 = lista[indexQ2];
				q1 = lista[indexQ2 - Math.floor((indexQ2 / 2) + 1)];
				q3 = lista[indexQ2 + Math.floor((indexQ2 / 2) + 1)];
			}



            min = min.toFixed(2);
            q1 = q1.toFixed(2);
            q2 = q2.toFixed(2);
            q3 = q3.toFixed(2);
            max = max.toFixed(2);

			
			listaQ = [min, q1, q2, q3, max];
			return (listaQ);

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

		function addDadoTabela(hoje, agora, temp, media, moda, dp, min, q1, q2, q3, max) {


			var tr = document.createElement('tr'); /*Cria uma elemento 'div' e armazena ele na variavel classTel*/
			tr.setAttribute("id", "tr" + colunaAtual); /*Adiciona o atributo (class='telefone') na variavel classTel*/

			tabela.insertAdjacentElement('afterbegin', tr); /*Insere o elemento classTel dentro do tels no site*/

			var tdHoje = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdHoje.textContent = hoje;

			var tdAgora = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdAgora.textContent = agora;

			var tdTemp = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdTemp.textContent = temp + " ºC";

			var tdMedia = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdMedia.textContent = media.toFixed(2) + " ºC";

			var tdModa = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdModa.textContent = moda + " ºC";

			var tdDp = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdDp.textContent = dp + " ºC";

			var tdMin = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdMin.textContent = min + " ºC";

			var tdQ1 = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdQ1.textContent = q1 + " ºC";

			var tdQ2 = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdQ2.textContent = q2 + " ºC";

			var tdQ3 = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdQ3.textContent = q3 + " ºC";

			var tdMax = document.createElement('td'); /*cria um elemento 'input' e guarda na variavel 'newTel' */
			tdMax.textContent = max + " ºC";

			tr.appendChild(tdHoje); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdAgora); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdTemp); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdMedia); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdModa); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdDp); /*Coloca o elemento newTel dentro do elemento classTel no site*/

			tr.appendChild(tdMin); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdQ1); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdQ2); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdQ3); /*Coloca o elemento newTel dentro do elemento classTel no site*/
			tr.appendChild(tdMax); /*Coloca o elemento newTel dentro do elemento classTel no site*/


			if (colunaAtual >= maxColuna) {
				var excluir = document.getElementById('tr' + (colunaAtual - maxColuna));
				tabela.removeChild(excluir);
				excluir = undefined;
			}

			colunaAtual++;
		}