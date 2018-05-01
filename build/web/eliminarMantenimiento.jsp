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
      Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
      if (usrActual.isMecanico()) {
        Mantenimientos manteActual = new ControladorMantenimientos().getMantenimientoActivo(Integer.valueOf(request.getParameter("idMant")));
        if (manteActual != null) { %>
  <h1 class="site-heading text-center text-white d d-lg-block">
    <span class="site-heading-upper text-primary mb-3">ELIMINAR MANTENIMIENTO</span>
  </h1>
  <div class="container text-center">
    <form class="form-text" method="POST" action="EliminarMantenimiento" >
      <div class="col-lg-7 col-centered well">
        <div class="row">
          <div class="col-sm-12">
            <div class="form-group">  
              <input hidden="true" id="idMant" name="idMant" value='<%= manteActual.getId() %>'>
              <label class="error" id="msj"><b>ˇATENCIÓN!</b> Se perderán todos los controles realizados.</label>
              <input type="text" value='<%= manteActual.getBici().getModelo().getTipo().getNombre() + " - " + manteActual.getBici().getModelo().getNombre() + " - " + manteActual.getBici().getPatente() %>' name="bicicleta" id="bicicleta" placeholder="Bicicleta" title="Bicicleta" class="form-control" autofocus="true" readonly="true">
            </div>
            <div class="row">
              <div class="col-sm-4 form-group">
                <input type="text" value='<%= dateOnly.format(manteActual.getFechaIngreso().getTime())%>' name="fec_ingreso" id="fec_ingreso" placeholder="Fecha Ingreso" title="Fecha Ingreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <input type="text" value='<%= timeOnly.format(manteActual.getFechaIngreso().getTime())%>' name="hr_ingreso" id="hr_ingreso" placeholder="Hora Ingreso" title="Hora Ingreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <input type="text" value='<%= df2.format(manteActual.getKmIngreso()) %>' name="km_ingreso" id="km_ingreso" placeholder="KM Ingreso" title="KM Ingreso" class="form-control" readonly="true">
              </div>
            </div>
            <div class="row">
              <div class='col-md-9 col-centered' style="margin-bottom: 0rem!important">
                <table class="table display" id="tipos_mant" style="background-color: white;border-style: solid; border-width: 1px;">
                  <thead style="color: #fff;background-color: #373a3c;">
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
                      <td style="vertical-align:middle" title="<%= det.getTipo().getDescripcion()%>">
                        <%= det.getTipo().getNombre()%>
                      </td>
                      <td style="vertical-align:middle"><input type="checkbox" name='checkbox' disabled="true" onchange="activarBoton()" style="height: 18px;width: 18px;" value='<%= det.getTipo().getId() %>'
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
            <p style="font-size: 12px;"><b><i>La Fecha, Hora y KMs de Egreso se completarán automaticamente cuando se cumpla el último de los mantenimientos elegidos.</i></b></p>
            <div class="row">
              <div class="col-sm-4 form-group">
                <input type="text" name="fec_egreso" id="fec_egreso" placeholder="Fecha Egreso" title="Fecha Egreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <input type="text" name="hr_egreso" id="hr_egreso" placeholder="Hora Egreso" title="Hora Egreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <input type="number" step="any" min="<%= manteActual.getKmIngreso() %>" name="km_egreso" id="km_egreso" placeholder="KM Egreso" title="KM Egreso" class="form-control" onchange='validar()'>
              </div>
            </div>
            <div class="form-group">
              <textarea name="obs" id="obs" readonly="true" maxlength="100" placeholder="Observaciones" title="Observaciones"  class="form-control" autofocus="true" style="min-height: 70px;"><%= manteActual.getObservacion() %></textarea>
            </div>
            <div class="row">
              <div class="col-sm-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 form-group">
                <input type="button" class="btn btn-lg btn-cliente btn-block" value="Volver a Mantenimientos" onclick="window.open('admmant.jsp','_self')"> 
              </div>
              <div class="col-sm-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 form-group">
                <input type="submit" id="guardarm" class="btn btn-lg btn-eliminar btn-block" value="Eliminar"> 
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
  <script>
 
  document.getElementById('km_egreso').disabled = true;
       
  </script>
</body>
