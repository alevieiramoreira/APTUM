<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="APTUM.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
      <title>APTUM - Login</title>
      <link rel="stylesheet" href="css.css"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/> <!--link do bootsrap-->
      <link rel="shortcut icon"  href="imagens/APTUMicon2.png"/>

      <script src="https://code.jquery.com/jquery-3.3.1.js"></script> <!--link do jquery-->
</head>
<body>
     <div id="backVideo">
            
            <video autoplay muted loop id="videoID">
            </video>
            
        </div>
    
          <div id="frontVideo">
    <div id="caixa">
                  <div class="tituloForm">Entre na sua conta</div>
    <form id="form" runat="server">
        <div>
             <asp:Label Text="" ID="lblMsg" runat="server" ForeColor="Red"/>

            <asp:TextBox runat="server" ID="txtusuario" placeholder="Usuário" MaxLength="80"/>
             <!--<input type="text" id= "usuario" placeholder="Usuário"/>--> 
            <asp:TextBox runat="server" ID="txtsenha" placeholder="Senha" TextMode="Password" MaxLength="80"/>
            <!-- <input id= "senha" type="password" placeholder="Senha"/> -->
                        <br/>
            <asp:Button Text="Entrar" runat="server" type="submit" class="btnEntrar" OnClick="btnEntrar_Click" />
             <!-- <button type= "submit">Entrar</button>-->
                        <div class="ou">OU</div>
                        <a href="Cadastro.aspx">  
							<button type="button">Cadastrar-se</button>
						</a>
 

        </div>
    </form>
         </div>
          </div>
          
          <a href="index.html">
              <div class="logo"><!--A class onde insere o logo-->
                    <img src="imagens/aptum.png"/>
              </div>
          </a>
          
       

             <script type="text/javascript">
                 var videos = ['v0.mp4',/*'v1.mp4',*/ 'v2.mp4', 'v3.mp4', 'v4.mp4', 'v5.mp4', /*'v6.mp4',*/'v7.mp4',/*'v8.mp4',*/'v9.mp4','v10.mp4','v11.mp4','v12.mp4','v13.mp4','v14.mp4'];
                 var videoFundo = videos[Math.floor(Math.random()*videos.length)];
                 var video = document.getElementById('videoID');
                 var fonteVideo = document.createElement('source');
                 fonteVideo.setAttribute('src', 'Videos/'+videoFundo);
                 video.appendChild(fonteVideo);
                 video.play();
	  

      </script>
</body>
</html>
