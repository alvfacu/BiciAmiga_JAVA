<%@page import="java.text.DecimalFormat"%>
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
  <%DecimalFormat df2 = new DecimalFormat("0.00");
    if (session.getAttribute("Usuario") != null) {
      Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
      if ((usrActual.isAdm()) || (!usrActual.isAdm() && !usrActual.isMecanico())) {
        ArrayList<Modelos> modelos_dispo = null;
        int tipo = 0;
        int modelo = 0;

        if (request.getParameter("tipos") != null){
          try{
            tipo = Integer.valueOf(request.getParameter("tipos").toString());
            if (tipo < 0){
              response.sendRedirect("error.jsp");
              return;
            } else{ %>
            <input type="hidden" name="idt" id="idt" value="<%=request.getParameter("tipos")%>">
         <% }
          } catch (Exception exception1) {
            response.sendRedirect("error.jsp");
            return;
          }
        }

        if (request.getParameter("modelos") != null && tipo > 0){
          try{
            String[] codModelo = request.getParameter("modelos").toString().split("-");
            if (codModelo.length>1){
              modelo = Integer.valueOf(codModelo[1]);
              if (modelo < 0) {
                response.sendRedirect("error.jsp");
                return;
              } else { %>
              <input type="hidden" name="idb" id="idb" value="<%=request.getParameter("modelos")%>">
          <% }
            }
          } catch (Exception exception1) {
            response.sendRedirect("error.jsp");
            return;
          }
        }

        if (request.getAttribute("bicicletas") != null) {
          modelos_dispo = (ArrayList<Modelos>) request.getAttribute("bicicletas");
        }
  %>

  <h1 class="site-heading text-center text-white d d-lg-block">
    <span class="site-heading-upper text-primary mb-3">Nueva reserva</span>
  </h1>

  <div class="col-lg-10 col-xs-10 col-md-10 col-centered well form-text">
    <div class="container">
      <form method="GET" action="reservar">
        <div class="row">          
          <div class="col-lg-6 col-xs-6" style="margin-top: 1rem;">
            <select class="form-control" name="tipos" id="tipos" placeholder="Tipos de Bicicleta" title="Tipo de Bicicleta" required="true" >
              <option value="0000">TODOS LOS TIPOS DE BICICLETAS</option>
              <% for (TiposBicicleta t : new ControladorBicicletas().getTiposBicicleta()) {%>                    
              <option value="<%=t.getId()%>"
                      <% if (tipo == t.getId()) { %>
                      selected="true"
                      <% }%>
                      ><%=t.getNombre()%></option>
              <%}%>
            </select>
          </div>
          <div class="col-lg-6 col-xs-6" style="margin-top: 1rem;">
            <select class="form-control" name="modelos" id="modelos" placeholder="Modelos de Bicicleta" title="Modelo de Bicicleta" required="true" >
              <option value="" selected>TODOS LOS MODELOS</option>
              <option value="0">TODOS LOS MODELOS</option>
              <% for (Modelos m : new ControladorBicicletas().getModelos()) {%>                    
              <option value="<%= String.format("%4s", m.getTipo().getId()).replace(' ', '0') + "-" + m.getId()%>"
                      <% if (modelo == m.getId() && tipo == m.getTipo().getId()) { %>
                      selected="true"
                      <% }%>
                      ><%=m.getNombre()%></option>
              <% } %>
            </select>
          </div>
        </div>
        <div class="row">          
          <div class="col-lg-3 col-xs-3" style="margin-top: 1rem;">Fecha Reserva
            <input type="date" class="form-control" id="fecha" name="fecha" required="true">
          </div>
          <div class="col-lg-3 col-xs-3" style="margin-top: 1.3rem;text-align: center">
            <li style="list-style-type: none;list-style-position: initial;list-style-image: initial;">
              <label><input type="checkbox" style="margin-right: 1rem!important" id="completo" name="completo" onclick="turno_completo()" value="false">Día Completo</label>
            </li>
            <span style="font-size: 12px"><i><b>Precio diferencial.</b> De 9:00 a 21:00 hs.</i></span>
          </div>
          <div class="col-lg-2 col-xs-2" style="margin-top: 1rem;" >Hora Inicio
            <input type="time" class="form-control" min="09:00" max="21:00" value="09:00" id="hrdesde" name="hrdesde" required="true">
          </div>
          <div class="col-lg-2 col-xs-2" style="margin-top: 1rem;">Hora Fin
            <input type="time" class="form-control" min="09:00" max="21:00" value="21:00" id="hrhasta" name="hrhasta" required="true">
          </div>
          <div class="col-lg-2" style="margin-top: 1.6rem;">
            <button type="submit" id="buscar" class="col-sm-12 col-xs-12 btn btn-lg btn-buscar" title="Buscar bicicletas"><i class="fa fa-search"></i></button>
          </div>
        </div>
      </form>
    </div>
    <hr />
    <div>
      <h2 class="text-center">Elegí tu bicicleta</h2>
      <br>
      <%if (modelos_dispo != null && modelos_dispo.size() > 0) { %>
      <div class="row text-center text-lg-left">
        <% for (Modelos m : modelos_dispo) {%>
        <div class="col-lg-5 col-md-12 img-contenedor">         
          <a class="">
            <img class="img<%=m.getId()%> img-fluid2 img-thumbnail2 imgid" onclick="ampliar(this.src)" style="border-style: solid; border-width: 1px; border-color: black;display: block; margin:auto;" src="<%=m.getUrl1()%>" alt="<%= m.getNombre()%>">                
          </a>
          <% if(m.getUrl2() != null && !m.getUrl2().trim().isEmpty()){ %>
            <img class="img<%=m.getId()%> img-fluid2 img-thumbnail2 imgid" onclick="ampliar(this.src)" style="border-style: solid; border-width: 1px; border-color: black;display: block; margin:auto;display: none" src="<%=m.getUrl2()%>" alt="<%= m.getNombre()%>">                
          <% } %>            
          <% if(m.getUrl3() != null && !m.getUrl3().trim().isEmpty()){ %>
            <img class="img<%=m.getId()%> img-fluid2 img-thumbnail2 imgid" onclick="ampliar(this.src)" style="border-style: solid; border-width: 1px; border-color: black;display: block; margin:auto;display: none" src="<%=m.getUrl3()%>" alt="<%= m.getNombre()%>">                
          <% } %>
          <div>
            <p style="text-align: center;">
              <label class='label' style='background-color: #e6a756;border-style: solid;border-width: 1px;color:black;cursor: pointer;' onclick="plusDivs('img<%=m.getId()%>',-1)"><a class="col-sm-6 col-xs-6"><<</a></label>
              <label class='label' style='background-color: #e6a756;border-style: solid;border-width: 1px;color:black;cursor: pointer;' onclick="plusDivs('img<%=m.getId()%>',1)"><a class="col-sm-6 col-xs-6">>></a></label>
            </p>
          </div>
        </div>
        <div class="col-lg-7 col-md-12">
          <p style="margin-bottom: 0.2rem;text-align: center;font-size: 18px"><b><%=m.getTipo().getNombre() + " - " + m.getNombre()%></b></p>          
          <p style="margin-bottom: 0.5rem;text-align: center;font-size: 14px"><%=m.getCaracteristicas_gral() %></i></p>            
          <p style="margin-bottom: 0.5rem;text-align: center;font-size: 13px"><i>Incluye kit de seguridad: casco, cadena y candado.</i></p>            
          <p style="margin-bottom: 1rem;text-align: center;font-size: 12px"><i><b><%="Precio por hora: $ " + df2.format(m.getPrecioXHr()) + " - Precio Día Completo: $ " + df2.format(m.getPrecioXDia())%></b></i></p>            
          <div class="">
            <p>
              <a href="#" class="btn btn-reserva col-sm-6 col-xs-12" style="margin-bottom: 1.5rem;float:right" role="button">Reservala</a>
            </p>
          </div>
        </div>
        <% } %>
      </div>
      <% } else { %>
      <div class="error" style="display: flex;justify-content: center;align-items: center;">No existen bicicletas disponibles.</div>
      <div class="error" style="display: flex;justify-content: center;align-items: center;"><i>Recomendados cambiar los filtros para obtener otros resultados.</i></div>
      <% } %>
    </div>
  </div>
 
  <div id="myModal" class="modal">
    <!-- The Close Button -->
    <span class="close">&times;</span>

    <!-- Modal Content (The Image) -->
    <img class="modal-content" id="img01">

    <!-- Modal Caption (Image Text) -->
    <div id="caption"></div>
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
                var today = new Date();
                //var tomorrow = new Date(today.getTime() + (24 * 60 * 60 * 1000));

                var dia = today.getDate();
                var mes = today.getMonth() + 1;
                var anio = today.getFullYear();
                document.getElementById("fecha").setAttribute("min", anio + '-' + String(mes).padStart(2, "0") + '-' + String(dia).padStart(2, "0"));
                document.getElementById("fecha").setAttribute("value", anio + '-' + String(mes).padStart(2, "0") + '-' + String(dia).padStart(2, "0"));

                var tipos = $('#tipos');
                var modelos = $('#modelos');
                var options = modelos.find('option');
                tipos.on('change', function () {
                  if (this.value)
                  {
                    if (this.value !== "0000")
                    {
                      modelos.html(options.filter('[value=0],[value*="' + String(this.value).padStart(4, "0") + '"]'));
                      modelos.prop('disabled', false);
                      modelos.prop('required', true);
                      $("#modelos option:first").text("TODOS LOS MODELOS DE " + $(this).find('option:selected').text());

                      if (this.value !== $('#idt').val())
                      {
                        modelos.val($("#modelos option:first").val());
                      } else
                      {
                        if (!$('#idb').val())
                        {
                          modelos.val($("#modelos option:first").val());
                        } else
                        {
                          modelos.val($('#idb').val());
                        }
                      }
                    } else
                    {
                      modelos.html(options.filter('[value=""]'));
                      modelos.prop('disabled', true);
                      modelos.prop('required', false);
                    }
                  } else
                  {
                    modelos.html(options.filter('[value=""]'));
                    modelos.prop('disabled', true);
                    modelos.prop('required', false);
                  }
                }).trigger('change');

                function turno_completo() {
                  if (document.getElementById("completo").checked)
                  {
                    document.getElementById("hrdesde").value = "09:00";
                    document.getElementById("hrdesde").disabled = true;
                    document.getElementById("hrhasta").value = "21:00";
                    document.getElementById("hrhasta").disabled = true;
                    document.getElementById("completo").value="true";
                  } else
                  {
                    document.getElementById("hrdesde").disabled = false;
                    document.getElementById("hrhasta").disabled = false;
                    document.getElementById("completo").value="false";
                  }
                }
                
                // Get the modal
                var modal = document.getElementById('myModal');
                
                function ampliar(imagen){
                  modal.style.display = "block";
                  document.getElementById("img01").src = imagen;
                }

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                // When the user clicks on <span> (x), close the modal
                span.onclick = function() { 
                  modal.style.display = "none";
                };
                
                var slideIndex = 1;
                
                function plusDivs(imgid, n) {
                  showDivs(imgid,slideIndex += n);
                }

                function showDivs(imgid,n) {
                  var i;
                  var x = document.getElementsByClassName(imgid);
                  if (n > x.length) {slideIndex = 1;}    
                  if (n < 1) {slideIndex = x.length;}
                  for (i = 0; i < x.length; i++) {
                     x[i].style.display = "none";  
                  }
                  x[slideIndex-1].style.display = "block";  
                }
                
  </script>
</body>
