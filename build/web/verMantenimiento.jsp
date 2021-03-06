<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat,java.text.DateFormat,Entidades.*,Negocio.*,java.util.ArrayList"%>
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

  <%SimpleDateFormat dateOnly = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat timeOnly = new SimpleDateFormat("HH:mm");
    DecimalFormat df2 = new DecimalFormat("0.00");
    if(session.getAttribute("Usuario") != null) {      
      if(request.getParameter("idMant")!= null) {
        try {
          int valor = Integer.valueOf(request.getParameter("idMant"));
          if(valor<0){ 
            response.sendRedirect("error.jsp");
            return;
          }
        }
        catch(Exception exception1){
          response.sendRedirect("error.jsp");
          return;
        }
      }
      else {
        response.sendRedirect("error.jsp");
        return;
      }
      
      Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
      if (usrActual.isMecanico()) {
        Mantenimientos manteActual = new ControladorMantenimientos().getMantenimientoFinalizado(Integer.valueOf(request.getParameter("idMant")));
        if (manteActual != null) { %>
  <h1 class="site-heading text-center text-white d d-lg-block">
    <span class="site-heading-upper text-primary mb-3">MANTENIMIENTO FINALIZADO</span>
  </h1>
  <div class="container text-center">
    <form class="form-text">
      <div class="col-lg-7 col-centered well">
        <div class="row">
          <div class="col-sm-12" align="left">
            <div class="form-group">
              <input hidden="true" id="idMant" name="idMant" value='<%= manteActual.getId() %>'>
              <label>&nbsp;Bicicleta</label>
              <input type="text" value='<%= manteActual.getBici().getModelo().getTipo().getNombre() + " - " + manteActual.getBici().getModelo().getNombre() + " - " + manteActual.getBici().getPatente() %>' name="bicicleta" id="bicicleta" placeholder="Bicicleta" title="Bicicleta" class="form-control" autofocus="true" readonly="true">
            </div>
            <div class="row">
              <div class="col-sm-4 form-group">
                <label>&nbsp;Fecha Ingreso</label>
                <input type="text" value='<%= dateOnly.format(manteActual.getFechaIngreso().getTime())%>' name="fec_ingreso" id="fec_ingreso" placeholder="Fecha Ingreso" title="Fecha Ingreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <label>&nbsp;Hora Ingreso</label>
                <input type="text" value='<%= timeOnly.format(manteActual.getFechaIngreso().getTime())%>' name="hr_ingreso" id="hr_ingreso" placeholder="Hora Ingreso" title="Hora Ingreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <label>&nbsp;Km Ingreso</label>
                <input type="text" value='<%= df2.format(manteActual.getKmIngreso()) %>' name="km_ingreso" id="km_ingreso" placeholder="KM Ingreso" title="KM Ingreso" class="form-control" readonly="true">
              </div>
            </div>
            <div class="row margin1top">
              <div class='col-md-9 col-centered margin1bottom'>
                <table class="table display tablamantenimiento" id="tipos_mant">
                  <thead class="encabezado">
                    <tr align="center">
                      <th>DETALLE</th>
                      <th>COMPLETADO</th>
                    </tr>
                  </thead>
                  <tbody>            
                    <% ArrayList<DetallesMantenimiento> detalles = new ControladorMantenimientos().getDetallesXMantenimiento(manteActual.getId());
                      if (detalles.size() > 0) {
                        for (DetallesMantenimiento det : detalles) {%>                    
                    <tr align="center" >                      
                      <td class="vertical" title="<%= det.getTipo().getDescripcion()%>">
                        <%= det.getTipo().getNombre()%>
                      </td>
                      <td class="vertical" ><input type="checkbox" class="checkTabla" name='checkbox' disabled="true" onchange="activarBoton()" value='<%= det.getTipo().getId() %>'
                        <% if(det.isCompletado()) { %>
                        checked="checked"
                        <% } %>></td>
                    </tr>                
                    <% }
                      }%>
                  </tbody>
                </table>
              </div>
            </div>
            <input hidden="true" id="cantReq" name="cantReq" value='<%= detalles.size() %>'>
            <div class="row">
              <div class="col-sm-4 form-group">
                <label>&nbsp;Fecha Egreso</label>
                <input type="text" name="fec_egreso" value='<%= dateOnly.format(manteActual.getFechaEgreso().getTime())%>' id="fec_egreso" placeholder="Fecha Egreso" title="Fecha Egreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <label>&nbsp;Hora Egreso</label>
                <input type="text" name="hr_egreso" value='<%= timeOnly.format(manteActual.getFechaEgreso().getTime())%>' id="hr_egreso" placeholder="Hora Egreso" title="Hora Egreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <label>&nbsp;Km Egreso</label>
                <input type="text" value='<%= df2.format(manteActual.getKmEgreso()) %>' name="km_egreso" id="km_egreso" placeholder="KM Egreso" title="KM Egreso" class="form-control" readonly="true">
              </div>
            </div>
            <div class="form-group">
              <label>&nbsp;Comentarios</label>
              <textarea name="obs" id="obs" readonly="true" maxlength="100" placeholder="Observaciones" title="Observaciones"  class="form-control" autofocus="true" style="min-height: 70px;"><%= manteActual.getObservacion() %></textarea>
            </div>
            <div class="row">
              <div class="col-sm-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 form-group margin1top">
                <input type="button" class="btn btn-lg btn-principal btn-block" value="Volver a Mantenimentos" onclick="window.history.back();"> 
              </div>
            </div>
          </div>     
        </div>
      </div>
    </form>
  </div>

  <% } else {
          response.sendRedirect("error.jsp");
        }
      } else {
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
</body>
