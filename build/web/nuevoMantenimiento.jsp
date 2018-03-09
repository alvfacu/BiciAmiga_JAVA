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

  <%if (session.getAttribute("Usuario") != null) {
      Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
      if (usrActual.isMecanico()) {%>
  <h1 class="site-heading text-center text-white d d-lg-block">
    <span class="site-heading-upper text-primary mb-3">NUEVO MANTENIMIENTO</span>
  </h1>
  <div class="container text-center">
    <form class="form-text" method="POST" action="AltaMantenimiento" >
      <div class="col-lg-7 col-centered well">
        <div class="row">
          <div class="col-sm-12">
            <div class="form-group">  
              <input hidden="true" id="idBici" name="idBici">
              <select class="form-control" name="bici" id="bici" placeholder="Seleccione Bicicleta" title="Seleccione Bicicleta" required="true" autofocus="true">
                <option value="" disabled selected>Seleccione Bicicleta</option>
                <% for (Bicicletas b : new ControladorBicicletas().getBicicletasParaMantenimiento()) {%>                    
                <option value="<%=b.getId()%>"><%= b.getModelo().getTipo().getNombre() + " - " + b.getModelo().getNombre() + " - " + b.getPatente()%></option>
                <%}%>
              </select>
            </div>
            <div class="row">
              <div class="col-sm-4 form-group">
                <input type="text" name="fec_ingreso" id="fec_ingreso" placeholder="Fecha Ingreso" title="Fecha Ingreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <input type="text" name="hr_ingreso" id="hr_ingreso" placeholder="Hora Ingreso" title="Hora Ingreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <input type="text" name="km_ingreso" id="km_ingreso" placeholder="KM Ingreso" title="KM Ingreso" class="form-control" readonly="true">
              </div>
            </div>
            <div class="row">
              <div class='col-md-9 col-centered' style="margin-bottom: 0rem!important">
                <table class="table display" id="tipos_mant" style="background-color: white;border-style: solid; border-width: 1px;">
                  <thead style="color: #fff;background-color: #373a3c;">
                    <tr align="center">
                      <th> </th>
                      <th style="width: 90%">MANTENIMIENTOS</th>                      
                    </tr>
                  </thead>
                  <tbody>            
                    <% ArrayList<TiposMantenimiento> tipos = new ControladorMantenimientos().getTiposMantenimientos();
                      if (tipos.size() > 0) {
                        for (TiposMantenimiento tipo : tipos) {%>
                    <tr align="center" >
                      <td style="vertical-align:middle"><input type="checkbox" name='checkbox' onchange="activarBoton()" style="height: 18px;width: 18px;" value='<%= tipo.getId()%>'></td>                      
                      <td style="vertical-align:middle" title="<%=tipo.getDescripcion()%>">
                        <%= tipo.getNombre()%>
                      </td>
                    </tr>                
                    <% }
                      }%>
                  </tbody>
                </table>
              </div>
            </div>
            <p style="font-size: 12px;"><b><i>La Fecha, Hora y KMs de Egreso se completar�n automaticamente cuando se cumpla el �ltimo de los mantenimientos elegidos.</i></b></p>
            <div class="row">
              <div class="col-sm-4 form-group">
                <input type="text" name="fec_egreso" id="fec_egreso" placeholder="Fecha Egreso" title="Fecha Egreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <input type="text" name="hr_egreso" id="hr_egreso" placeholder="Hora Egreso" title="Hora Egreso" class="form-control" autofocus="true" readonly="true">
              </div>
              <div class="col-sm-4 form-group">
                <input type="text" name="km_egreso" id="km_egreso" placeholder="KM Egreso" title="KM Egreso" class="form-control" disabled="true" readonly="true">
              </div>
            </div>
            <div class="form-group">
              <textarea name="obs" id="obs" maxlength="100" placeholder="Observaciones" title="Observaciones"  class="form-control" autofocus="true" style="min-height: 70px;"></textarea>
            </div>
            <div class="row">
              <div class="col-sm-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 form-group">
                <input type="button" class="btn btn-lg btn-eliminar btn-block" value="Volver" onclick="window.history.back()"> 
              </div>
              <div class="col-sm-6 col-lg-6 col-md-6 col-sm-6 col-xs-6 form-group">
                <input type="submit" id="guardarm" class="btn btn-lg btn-nuevo btn-block" value="Guardar"> 
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
      response.sendRedirect("login.jsp");
    }%>

  <!-- Footer -->
  <%@include file="footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>    
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script>

  document.getElementById('bici').focus();
  document.getElementById("guardarm").disabled=true;
    
  $(document).ready(function() {
    $('#tipos_mant tr').click(function(event) {
        if (event.target.type !== 'checkbox') {
            $(':checkbox', this).trigger('click');
          }
        });
      
    $("#bici").change(function () {
      
      $.post('DameKmBicicleta',
              {
                idbici: $("#bici").val()
              },
              function (responseText)
              {
                $('#hr_ingreso').each(function () {
                  var d = new Date(),
                          h = d.getHours(),
                          m = d.getMinutes();
                  if (h < 10)
                    h = '0' + h;
                  if (m < 10)
                    m = '0' + m;
                  $(this).attr({
                    'value': h + ':' + m
                  });
                });

                $('#fec_ingreso').each(function () {
                  var d = new Date(),
                          dia = d.getDate(),
                          mes = d.getMonth()+1,
                          anio = d.getFullYear();
                  $(this).attr({
                    'value': String(dia).padStart(2, "0") + '/' + String(mes).padStart(2, "0") + '/' + anio
                  });
                });
                //VALIDO
                if (responseText !== "0")
                {
                  document.getElementById('km_ingreso').value = parseFloat(responseText.replace(' ', '').replace('.', '').replace(',', '.')).toFixed(2);
                  document.getElementById("idBici").value = document.getElementById("bici").value;
                }
                ;
              });
    });
  });
    
  function activarBoton(){
      if(document.querySelectorAll('input[type="checkbox"]:checked').length>0)
      {
        document.getElementById("guardarm").disabled=false;
      }
      else
      {
        document.getElementById("guardarm").disabled=true;
      }
    }
  </script>
</body>