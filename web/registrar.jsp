<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BiciAmiga - Rosario</title>

    <!-- Bootstrap core CSS -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/business-casual.min.css" rel="stylesheet">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"> 

  </head>

  <body>

    <h1 class="site-heading text-center text-white d-none d-lg-block">
      <span class="site-heading-upper text-primary mb-3">Recorre Rosario de la manera más cómoda</span>
      <a class="site-heading-lower" href="index.jsp" style="color:#ffff; text-decoration: none" >BiciAmiga</a>
    </h1>

    <!-- Navigation -->
    <%@include file="nav_bar.jsp"%>

    <!-- Body -->
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">Formulario de registro</span>
    </h1> 
    <div class="container text-center">
      <form class="form-text" method="POST" action="AltaUsuario">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="form-group">
                <input type="text" name="usuario" id="usuario" placeholder="Usuario" class="form-control" autofocus="true" required="true">
                <p id="mensajeDisponibilidad"></p>
              </div>
              <div class="row">
                <div class="col-sm-6 form-group">
                  <input type="password" name="pass" id="pass" placeholder="Contraseña" class="form-control" onmouseover="this.setAttribute('type', 'text')"               
                         onmouseout="this.setAttribute('type', 'password')" autofocus="true" required="true">
                </div>	
                <div class="col-sm-6 form-group">
                  <input type="password" id="repass" placeholder="Repita Contraseña" class="form-control" onmouseover="this.setAttribute('type', 'text')"               
                         onmouseout="this.setAttribute('type', 'password')" autofocus="true" required="true">
                </div>
              </div>
              <div class="form-group">
                <input type="text" name="apenom" id="apenom" placeholder="Apellido y Nombre" class="form-control" autofocus="true" required="true">
              </div>			
              <div class="form-group">
                <input type="text" name="domicilio" id="domicilio" placeholder="Domicilio" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="documento" id="documento" placeholder="Documento de Identidad" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="telefono" id="telefono" placeholder="Teléfono de contacto" class="form-control" autofocus="true" required="true">
              </div>		
              <div class="form-group">
                <input type="email" name="email" id="email" placeholder="Email de contacto" class="form-control" autofocus="true" required="true">
              </div>
              <button type="submit" id="enviar" class="btn btn-lg btn-primary btn-block">Registrarse a BiciAmiga</button>
            </div>              
          </div>
        </div>
      </form>
    </div>
    <br>
    <br>

    <!-- Footer -->
    <%@include file="footer.jsp"%>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="js/existeUsuario.js"></script>
    <script>
        $(document).ready(function () {
          handleEvents();
        });

        function handleEvents() {                   
          $("#repass").keyup(function (event) {
            //Store the password field objects into variables ...
            var pass1 = $('#pass').val();
            var pass2 = $('#repass');
            //Set the colors we will be using ...
            var goodColor = "#66cc66";
            var badColor = "#ff6666";
            //Compare the values in the password field 
            //and the confirmation field
            if (pass1 === pass2.val()) {
              $("#enviar").removeAttr('disabled');                 
              pass2.css("backgroundColor", goodColor);            
            } else {
              $("#enviar").attr('disabled', 'disabled');
              pass2.css("backgroundColor", badColor);
            }
          }) ;
        }
    </script>
  </body>

</html>