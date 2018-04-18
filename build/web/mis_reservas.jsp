<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat,Entidades.*,Negocio.*"%>
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
    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
  </head>

  <body>
    <!-- Navigation -->
    <%@include file="nav_bar.jsp"%>

    <!-- Body -->

    <%if (session.getAttribute("Usuario") != null) {
        Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
        if (!usrActual.isAdm() && !usrActual.isMecanico()) {%>
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">historial de reservas</span>
    </h1>

    <div class="col-lg-10 col-centered well">
      
      <div style="overflow-x:auto;">
        <button class="tablink2" onclick="openPage('pendientes', this)" id="defaultOpen">Pendientes</button>
        <button class="tablink2" onclick="openPage('finalizadas', this)">Finalizadas</button>
      </div>
      
      <!-- PENDIENTES -->
      <div id="pendientes" class="tabcontent">
        <% if(usrActual.isHabilitado()) { %>
        <div align="right">
          <form method="POST" action="Reservar">
            <button type="submit" class="btn btn-nuevo" style="margin-bottom:0.5rem" title="Nueva Reserva"><span class="fa fa-plus-square"></span></button>
          </form>
        </div>
        <% }%>
        <div style="overflow-x:auto;">
          <table class="table display" id="rpendientesxusr">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>ID</th>
                <th>BICICLETA</th>                
                <th>INICIO</th>
                <th>FIN</th>
                <th>IMPORTE</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm");
                DecimalFormat df2 = new DecimalFormat("0.00");
                ArrayList<Reservas> reservas_activas = new ControladorReservas().getReservasPendientesXUsr(usrActual);               
                if (reservas_activas.size() > 0) {
                  for (Reservas r : reservas_activas) {%>
              <tr align="center" >
                <%String bicicleta = r.getBici().getModelo().getTipo().getNombre()+" - "+r.getBici().getModelo().getNombre()+" - "+r.getBici().getPatente();
                  String reserva = "R"+String.format("%5s",r.getId()).replace(' ', '0'); %>
                <td style="vertical-align:middle;font-size: 1rem;"><%=reserva %></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%=bicicleta  %></td>  
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaInicioP())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaFinP())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df2.format(r.getImporte())%></td>
                <td style="vertical-align:middle;">
                  <button class="btn btn-reset" title="Ver">                          
                    <span class="fa fa-eye"></span>
                  </button>
                </td>
                <td style="vertical-align:middle">
                  <button class="btn btn-eliminar" title="Cancelar">                          
                    <span class="fa fa-remove"></span>
                  </button>
                </td>
              </tr>        
              <% }
                }%>
            </tbody>
          </table>
        </div>
      </div>

      <!-- FINALIZADAS -->
      <div id="finalizadas" class="tabcontent">
        <div style="overflow-x:auto;">
          <table class="table display" id="rfinalizadasxusr">
            <thead style="color: #fff;background-color: #373a3c;">
              <tr align="center">
                <th>ID</th>
                <th>BICICLETA</th>                
                <th>INICIO</th>
                <th>FIN</th>
                <th>IMPORTE</th>
                <th>ESTADO</th>
                <th></th>
              </tr>
            </thead>
            <tbody>            
              <%ArrayList<Reservas> reservas_finalizadas = new ControladorReservas().getReservasFinalizadasXUsr(usrActual);               
                if (reservas_finalizadas.size() > 0) {
                  for (Reservas r : reservas_finalizadas) {%>
              <tr align="center" >
                <%String bicicleta = r.getBici().getModelo().getTipo().getNombre()+" - "+r.getBici().getModelo().getNombre()+" - "+r.getBici().getPatente();
                  String reserva = "R"+String.format("%5s",r.getId()).replace(' ', '0'); %>
                <td style="vertical-align:middle;font-size: 1rem;"><%=reserva %></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%=bicicleta  %></td>  
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaInicioR())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df.format(r.getFechaFinR())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;"><%= df2.format(r.getImporte())%></td>
                <td style="vertical-align:middle;font-size: 0.8rem;">
                  <span
                    <% if(r.getEstado()==EstadosReserva.FINALIZADA) { %>
                    class="label label-success"
                    <% } else if(r.getEstado()==EstadosReserva.CANCELADA) { %>
                    class="label label-danger"
                    <% } else if(r.getEstado()==EstadosReserva.ELIMINADA) { %>
                    class="label label-danger"
                    <% } else if(r.getEstado()==EstadosReserva.FALLAS) { %>
                    class="label label-mecanico"
                    <% } else { %>
                    class="label label-desconocido"
                    <% } %>><%=r.getEstado()%>
                  </span>
                </td>
                <td style="vertical-align:middle;">
                  <button class="btn btn-reset" title="Ver">                          
                    <span class="fa fa-eye"></span>
                  </button>
                </td>
              </tr>        
              <% }
                }%>
            </tbody>
          </table>
        </div>
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
    <script src="js/misreservas.js"></script>
   
  </body>
