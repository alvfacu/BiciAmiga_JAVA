<%@page import="Entidades.Modelos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Bicicletas"%>
<%@page import="Negocio.ControladorBicicletas"%>
<%@page import="Entidades.TiposBicicleta"%>
<!DOCTYPE html>

  <head>

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
    <!-- Navigation -->
    <%@include file="nav_bar.jsp"%>

    <!-- Body -->
    <%
      if (session.getAttribute("Usuario") != null) {
        Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
        if ((usrActual.isAdm()) || (!usrActual.isAdm() && !usrActual.isMecanico())) {
          ArrayList<Modelos> modelos_dispo = null;
          int tipo = 0;
          int modelo = 0;
          if(request.getParameter("idTipo")!= null) {
            try {
              tipo = Integer.valueOf(request.getParameter("idTipo"));
              if(tipo<0){ 
                response.sendRedirect("error.jsp");
                return;
              }
            }
            catch(Exception exception1){
              response.sendRedirect("error.jsp");
              return;
            }
          }
          
          if(request.getParameter("idModelo")!= null) {
            try {
              modelo = Integer.valueOf(request.getParameter("idModelo"));
              if(modelo<0){ 
                response.sendRedirect("error.jsp");
                return;
              }
            }
            catch(Exception exception1){
              response.sendRedirect("error.jsp");
              return;
            }
          }
          
          if(tipo>0 && modelo>0){
            modelos_dispo = new ControladorBicicletas().getModelosDisponiblesXTipoXModelo(tipo,modelo);
          }
          else if (tipo>0 && modelo==0){
            modelos_dispo = new ControladorBicicletas().getModelosDisponiblesXTipo(tipo);
          }
          else if (tipo==0 && modelo>0){
            modelos_dispo = new ControladorBicicletas().getModelosDisponiblesXModelo(modelo);
          }
          else {
            modelos_dispo = new ControladorBicicletas().getModelosDisponibles();
          }          
    %>
    
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">Nueva reserva</span>
    </h1>

    <div class="col-lg-10 col-centered well">
      <div class="container">
        <div class="row">
          <% if(tipo==0) { %>
            <div class="col-lg-12 col-xs-12">
          <% } else { %>
            <div class="col-lg-6 col-xs-6">
          <% } %>
            <select class="form-control" name="tipo" id="tipo" placeholder="Tipo de Bicicleta" title="Tipo de Bicicleta" required="true" 
                    onchange="window.open('reservar.jsp?idTipo='+document.getElementById('tipo').value,'_self');">
              <option value="" disabled selected>Seleccione Tipo de Bicicleta</option>
              <% for (TiposBicicleta t : new ControladorBicicletas().getTiposBicicleta()) {%>                    
              <option value="<%=t.getId()%>"
              <% if(tipo==t.getId()) { %>
              selected="true"
              <% } %>
              ><%=t.getNombre()%></option>
              <%}%>
            </select>
          </div>
          <%if(tipo>0) { %>
          <br>
          <div class="col-lg-6 col-xs-6">
            <select class="form-control" name="modelo" id="modelo" placeholder="Modelo de Bicicleta" title="Modelo de Bicicleta" required="true" 
                    onchange="window.open('reservar.jsp?idTipo='+document.getElementById('tipo').value+'&idModelo='+document.getElementById('modelo').value,'_self');">
              <option value="" disabled selected>Seleccione Modelo de Bicicleta</option>
              <% for (Modelos m : new ControladorBicicletas().getModelosXTipo(tipo)) {%>                    
              <option value="<%=m.getId()%>"
              <% if(modelo==m.getId()) { %>
              selected="true"
              <% } %>
              ><%=m.getNombre()%></option>
              <% } %>
            </select>
          </div>
          <% } %>
        </div>
        <hr />
        <%if(modelos_dispo.size()>0 ) { %>
        <div class="row text-center text-lg-left">
          <% for(Modelos m : modelos_dispo) { %>
            <div class="col-lg-4 col-md-5 col-xs-6">
              <p style="margin-bottom: 0.5rem;text-align: center;"><b><%=m.getTipo().getNombre()+" - "+m.getNombre() %></b></p>
              <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" style="display: block; margin:auto;" src="<%=m.getUrl1()%>" alt="<%= m.getNombre()%>">                
              </a>
            </div>
          <% } %>
        </div>
        <% } else { %>
          No existen bicicletas disponibles
        <% } %>
      </div>
    </div>

    <% } else {
          response.sendRedirect("error.jsp");
        }
      } else {
        response.sendRedirect("login.jsp");
      }%>

    <!-- Footer -->
    <%@include file="footer.jsp"%>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>    
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 
    <script>
    </script>
  </body>
