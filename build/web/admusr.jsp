<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat,Entidades.*,Negocio.*"%>
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
    <!-- Navigation -->
    <%@include file="nav_bar.jsp"%>

    <!-- Body -->

    <%if (session.getAttribute("Usuario") != null) {
        Usuarios usrActual = (Usuarios) session.getAttribute("Usuario");
        if (usrActual.isAdm()) {%>
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">administrador de usuarios</span>
    </h1>

    <!-- USUARIOS -->
    <div class="col-lg-10 col-centered well">      
      <div>
        <a style="float:left;" class="btn btn-nuevo" data-title="Nuevo" data-toggle="modal" data-target="#new" onclick="nuevousr()"><span class="fa fa-plus-square"></span></a></p>
        <div align="right">          
          <i class="fa fa-search"></i>
          <input type="text" id="descusr" class="myInput" onkeyup="buscarusr()" placeholder="Buscar Usuario..." title="Ingresar nombre">
        </div>
      </div>
      <table class="table" id="usuarios">
        <thead style="color: #fff;background-color: #373a3c;">
          <tr align="center">
            <th>#</th>
            <th>USUARIO</th>
            <th>APELLIDO Y NOMBRE</th>
            <th>DOCUMENTO</th>
            <th>EMAIL</th>
            <th>TIPO USUARIO</th>
            <th>¿HABILITADO?</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>            
          <%ArrayList<Usuarios> usuarios = new ControladorUsuarios().getUsuarios();
              if (usuarios.size() > 0) {
                for (Usuarios u : usuarios) {%>
          <tr align="center" >
            <td style="vertical-align:middle"><%= u.getId()%></td>
            <td style="vertical-align:middle"><%= u.getUsuario().trim()%></td>
            <td style="vertical-align:middle"><%= u.getApynom().trim()%></td>
            <td style="vertical-align:middle"><%= u.getDocumento().trim()%></td>
            <td style="vertical-align:middle"><%= u.getEmail().trim()%></td>
            <td style="vertical-align:middle">
              <% if (u.isAdm()) {%>
              <span class="label label-adm">ADMIN</span>
              <% if (u.isMecanico()) { %>
              <span class="label label-mecanico">MECANICO</span>
              <% }
                } else { %>
              <span class="label label-cliente">CLIENTE</span>
              <% } %>
            </td>
            <td style="vertical-align:middle">
              <% if (u.isHabilitado()) {%>
              <span class="label label-success">SI</span>
              <% } else { %>
              <span class="label label-danger">NO</span>
              <% }%>
            </td>   
            <td style="vertical-align:middle">
              <button class="btn btn-editar" data-title="Editar" data-toggle="modal" data-target="#edit" 
                      onclick="editarusr('<%= u.getId()%>', '<%=u.getUsuario().trim()%>', '<%= u.getApynom().trim()%>', '<%= u.getDocumento()%>',
                                    '<%= u.getEmail()%>', '<%= u.isAdm()%>', '<%= u.isMecanico()%>', '<%= u.isHabilitado()%>', '<%= u.getDomicilio().trim()%>', '<%= u.getTelefono()%>')">
                <span class="fa fa-edit"></span>
              </button>
            </td>
            <td style="vertical-align:middle">
              <button class="btn btn-eliminar" data-title="Eliminar" data-toggle="modal" data-target="#delete" 
                      onclick="eliminarusr('<%= u.getId()%>', '<%=u.getUsuario().trim()%>', '<%= u.getApynom().trim()%>', '<%= u.getDocumento()%>',
                                    '<%= u.getEmail()%>', '<%= u.isAdm()%>', '<%= u.isMecanico()%>', '<%= u.isHabilitado()%>', '<%= u.getDomicilio().trim()%>', '<%= u.getTelefono()%>')">
                <span class="fa fa-trash-o"></span>
              </button>
            </td>
          </tr>                
          <% }
              }%>
        </tbody>
      </table>
    </div>

    <!-- NUEVO USUARIO -->
    <div class="container text-center" id="nuevousr" style="display: none">
      <form class="form-text" method="POST" action="AltaUsuario">
        <div class="col-lg-7 col-centered well">
          <div class="row">
            <div class="col-sm-12">
              <div class="row">
                <div class="col-sm-10 form-group">
                  <input type="text" title="Nombre de Usuario" name="usuario" id="usuario" placeholder="Usuario" class="form-control" autofocus="true" required="true">
                </div>
                <div class="col-sm-2 form-group">
                  <select class="form-control" name="habilitado" id="habilitado" title="¿Usuario Habilitado?">
                    <option value="true" selected="true">SI</option>
                    <option value="false">NO</option> 
                  </select>
                </div>                  
              </div>
              <div class="row">
                <div class="password col-sm-6 form-group">
                  <input type="password" name="pass" id="pass" placeholder="Contraseña" title="Contraseña" class="form-control" autofocus="true" required="true">
                  <span id="ojopas" class="fa fa-eye" style="right: 23px"></span>
                </div>	
                <div class="password col-sm-6 form-group">
                  <input type="password" id="repass" name="repass" placeholder="Repita Contraseña" title="Repita Contraseña" class="form-control" autofocus="true" required="true">
                  <span id="ojore" class="fa fa-eye" style="right: 23px"></span>
                </div>
              </div>
              <div class="form-group">
                <input type="text" name="apenom" id="apenom" placeholder="Apellido y Nombre" title="Apellido y Nombre" class="form-control" autofocus="true" required="true">
              </div>			
              <div class="form-group">
                <input type="text" name="domicilio" id="domicilio" placeholder="Domicilio" title="Domicilio" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="documento" id="documento" placeholder="Documento de Identidad" title="Documento de Identidad" class="form-control" autofocus="true" required="true">
              </div>
              <div class="form-group">
                <input type="text" name="telefono" id="telefono" placeholder="Teléfono de contacto" title="Teléfono de contacto" class="form-control" autofocus="true" required="true">
              </div>		
              <div class="form-group">
                <input type="email" name="email" id="email" placeholder="Email de contacto" title="Email de contacto" class="form-control" autofocus="true" required="true">
              </div>
              <div class="col-sm-9 col-centered">
                <div class="panel panel-default">
                  <div class="panel-heading"><b>Tipo de Usuario</b></div>
                  <div class="panel-body">
                    <div class="form-check form-check-inline">
                      <label class="btn btn-admin">                        
                        <label class="form-check-label label label-adm"><input class="form-check-input" type="checkbox" id="admin" name="admin" value="false"
                             onclick="javascript:ToggleSwitch(this.form)">ADMIN</label>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">
                      <label class="btn btn-mecanico">
                        <label class="form-check-label label label-mecanico"><input class="form-check-input" type="checkbox" id="meca" name="meca" value="false"
                             onclick="javascript:ToggleSwitch(this.form)">MECANICO</label>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">                      
                      <label class="btn btn-cliente">
                        <label class="form-check-label label label-cliente"><input class="form-check-input" type="checkbox" id="cliente" name="cli" value="false"
                             onclick="javascript:ToggleSwitch2(this.form)">CLIENTE</label>
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit" id="enviar" class="btn btn-lg btn-nuevo btn-block">Guardar Nuevo</button>
            </div>              
          </div>
        </div>
      </form>
    </div>

    <!-- MODIFICA USUARIO -->
    <div class="container text-center" id="editartipo" style="display: none">

    </div>

    <!-- ELIMINA USUARIO -->
    <div class="container text-center" id="eliminartipo" style="display: none">

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
    <script src="js/existeUsuario.js"></script>
    <script src="js/registroNuevoUsr.js"></script>
    <script>
      function buscarusr() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("descusr");
        filter = input.value.toUpperCase();
        table = document.getElementById("usuarios");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
          td1 = tr[i].getElementsByTagName("td")[1];
          td2 = tr[i].getElementsByTagName("td")[2];
          td3 = tr[i].getElementsByTagName("td")[3];
          td4 = tr[i].getElementsByTagName("td")[4];
          td5 = tr[i].getElementsByTagName("td")[5];
          if (td1 || td2 || td3 || td4 || td5) {
            if (td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                    td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                    td3.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                    td4.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                    td5.innerHTML.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          }
        }
      }

      function nuevousr() {
        var x = document.getElementById("eliminartipo");
        x.style.display = "none";
        x = document.getElementById("editartipo");
        x.style.display = "none";

        x = document.getElementById("nuevousr");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }

      function ToggleSwitch(form) {
        if (form.elements["admin"].checked)
          form.elements["admin"].value = true;
        else
          form.elements["admin"].value = false;

        if (form.elements["meca"].checked)
          form.elements["meca"].value = true;
        else
          form.elements["meca"].value = false;

        if (form.elements["admin"].checked || form.elements["meca"].checked) {
          form.elements["cli"].disabled = true;
        } else {
          form.elements["cli"].disabled = false;
        }
      }

      function ToggleSwitch2(form) {
        if (form.elements["cli"].checked)
          form.elements["cli"].value = true;
        else
          form.elements["cli"].value = false;

        if (form.elements["cli"].checked) {
          form.elements["admin"].disabled = true;
          form.elements["meca"].disabled = true;
        } else {
          form.elements["admin"].disabled = false;
          form.elements["meca"].disabled = false;
        }
      }

    </script>
  </body>

</html>