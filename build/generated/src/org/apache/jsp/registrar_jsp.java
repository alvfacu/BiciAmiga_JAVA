package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Entidades.Usuarios;
import Entidades.Usuarios;

public final class registrar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/nav_bar.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("  <head>\n");
      out.write("\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    <title>BiciAmiga - Rosario</title>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core CSS -->\n");
      out.write("    <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("\n");
      out.write("    <!-- Custom fonts for this template -->\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Custom styles for this template -->\n");
      out.write("    <link href=\"css/business-casual.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"icon\" href=\"img/favicon.ico\" type=\"image/x-icon\">\n");
      out.write("    <link rel=\"shortcut icon\" href=\"img/favicon.ico\" type=\"image/x-icon\"> \n");
      out.write("\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("    <!-- Navigation -->\n");
      out.write("    ");
      out.write("<!DOCTYPE html>\n");
      out.write("  <head>\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    <title>BiciAmiga - Rosario</title>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core CSS -->\n");
      out.write("    <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("\n");
      out.write("    <!-- Custom fonts for this template -->\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Custom styles for this template -->\n");
      out.write("    <link href=\"css/business-casual.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"icon\" href=\"img/favicon.ico\" type=\"image/x-icon\">\n");
      out.write("    <link rel=\"shortcut icon\" href=\"img/favicon.ico\" type=\"image/x-icon\">\n");
      out.write("\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("    \n");
      out.write("    <h1 class=\"site-heading text-center text-white d-none d-lg-block\">\n");
      out.write("      <span class=\"site-heading-upper text-primary mb-3\">Recorre Rosario de la manera más cómoda</span>\n");
      out.write("      <a class=\"site-heading-lower\" href=\"index.jsp\" style=\"text-decoration: none;color: #FFFFFF;\" >BiciAmiga</a>\n");
      out.write("    </h1>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <!-- Navigation -->\n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-dark py-lg-4\" id=\"mainNav\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <a class=\"navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none\" href=\"index.jsp\">BiciAmiga</a>\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" id=\"btn1\">\n");
      out.write("          <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("        </button>\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\n");
      out.write("          <ul class=\"navbar-nav mx-auto\">\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"index\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"index.jsp\">Inicio\n");
      out.write("                <span class=\"sr-only\">(current)</span>\n");
      out.write("              </a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"comofun\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"index.jsp#como\">¿Cómo funciona?</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"nuestras_bicicletas\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"nuestras_bicicletas.jsp\">Nuestras Bicis</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"reservar\">\n");
      out.write("              <form method=\"POST\" action=\"Reservar\">\n");
      out.write("                <button type=\"submit\" class=\"nav-link text-uppercase text-expanded\" style=\"color: #ffc107;border:none;background-color: #321811;\">Reservar</button>\n");
      out.write("              </form>\n");
      out.write("            </li>                        \n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"contacto\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"contacto.jsp\">Contacto</a>\n");
      out.write("            </li>\n");
      out.write("            ");
 if (session.getAttribute("Usuario") == null) {
      out.write("\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"login\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"login.jsp\">Ingresa / Registrate</a>\n");
      out.write("            </li>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <!-- Sesson Navigation -->\n");
      out.write("    ");
 if (session.getAttribute("Usuario") != null) {
      Usuarios usrActual = (Usuarios)session.getAttribute("Usuario");
      out.write("\n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-dark py-lg-4\" id=\"sessionNav\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <a class=\"navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none\" href=\"mi_cuenta.jsp\">\n");
      out.write("          <span class=\"fa fa-user-circle-o\"></span> ");
      out.print( usrActual.getUsuario());
      out.write("\n");
      out.write("        </a>\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" id=\"btn2\">\n");
      out.write("          <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("        </button>\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"sesbarResponsive\">\n");
      out.write("          <ul class=\"navbar-nav mx-auto\">\n");
      out.write("            ");
 if(usrActual.isAdm()){
      out.write("\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"admbici\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"admbici.jsp\">Bicicletas</a>\n");
      out.write("            </li>    \n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"admusr\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"admusr.jsp\">Usuarios</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"admres\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"admres.jsp\">Reservas</a>\n");
      out.write("            </li>\n");
      out.write("            ");
}if(usrActual.isMecanico()){
      out.write("\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"admmant\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"admmant.jsp\">Mantenimientos</a>\n");
      out.write("            </li>\n");
      out.write("            ");
}if(!usrActual.isAdm() && !usrActual.isMecanico()){
      out.write("\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"mis_reservas\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"mis_reservas.jsp\">Mis reservas</a>\n");
      out.write("            </li>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            <li class=\"nav-item px-lg-4\" id=\"mi_cuenta\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"mi_cuenta.jsp\">Mi Cuenta</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item px-lg-4\">\n");
      out.write("              <a class=\"nav-link text-uppercase text-expanded\" href=\"Logout\">Cerrar Sesión</a>\n");
      out.write("            </li>\n");
      out.write("          </ul>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </nav>  \n");
      out.write("    ");
}
      out.write("\n");
      out.write("    <!-- Bootstrap core JavaScript -->\n");
      out.write("    <script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("    <script src=\"//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\"></script>\n");
      out.write("    <script>\n");
      out.write("      $(\"#btn1\").click(function ()\n");
      out.write("      {\n");
      out.write("        $(\"#navbarResponsive\").toggleClass(\"show\");\n");
      out.write("      });\n");
      out.write("      \n");
      out.write("      $(\"#btn2\").click(function ()\n");
      out.write("      {\n");
      out.write("        $(\"#sesbarResponsive\").toggleClass(\"show\");\n");
      out.write("      });\n");
      out.write("      \n");
      out.write("      $(function() {        \n");
      out.write("        $('#' + location.pathname.split(\"/\")[2].replace('.jsp','')).toggleClass('active');\n");
      out.write("        \n");
      out.write("        var url = location.pathname.split(\"/\")[2].replace('.jsp','');\n");
      out.write("                \n");
      out.write("        if (url === \"registrar\") {\n");
      out.write("          $(\"#login\").toggleClass('active');           \n");
      out.write("        };\n");
      out.write("        \n");
      out.write("        if (url === \"mantxbici\" || url === \"nuevoMantenimiento\" || url === \"verMantenimiento\" || url === \"modificarMantenimiento\" || url === \"eliminarMantenimiento\") {\n");
      out.write("          $(\"#admmant\").toggleClass('active');           \n");
      out.write("        };\n");
      out.write("        \n");
      out.write("        if (url === \"Reservar\" || url === \"PreReserva\" || url===\"AltaReserva\" || url===\"reservar\" ) {\n");
      out.write("          $(\"#admres\").toggleClass('active');\n");
      out.write("          $(\"#mis_reservas\").toggleClass('active');\n");
      out.write("        };\n");
      out.write("        \n");
      out.write("      });\n");
      out.write("    </script>\n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Body -->\n");
      out.write("    <h1 class=\"site-heading text-center text-white d d-lg-block\">\n");
      out.write("      <span class=\"site-heading-upper text-primary mb-3\">Formulario de registro</span>\n");
      out.write("    </h1> \n");
      out.write("    <div class=\"container text-center\">\n");
      out.write("      <form class=\"form-text\" method=\"POST\" action=\"AltaUsuario\">\n");
      out.write("        <div class=\"col-lg-7 col-centered well\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-12\" align=\"left\">\n");
      out.write("              <input type=\"hidden\" name=\"admin\" value=\"false\">\n");
      out.write("              <input type=\"hidden\" name=\"meca\" value=\"false\">\n");
      out.write("              <input type=\"hidden\" name=\"cliente\" value=\"true\">\n");
      out.write("              <input type=\"hidden\" name=\"habilitado\" value=\"true\">\n");
      out.write("              <div class=\"form-group\">\n");
      out.write("                <label>&nbsp;Nombre de usuario</label>\n");
      out.write("                <input type=\"text\" name=\"usuario\" id=\"usuario\" placeholder=\"Usuario\" title=\"Ingrese nombre de usuario\" class=\"form-control\" autofocus=\"true\" required=\"true\">\n");
      out.write("              </div>\n");
      out.write("              <div class=\"row\">\n");
      out.write("                <div class=\"password col-sm-6 form-group\">\n");
      out.write("                  <label>&nbsp;Contraseña</label>\n");
      out.write("                  <input type=\"password\" name=\"pass\" id=\"pass\" placeholder=\"Contraseña\" title=\"Ingrese una contraseña\" class=\"form-control\" autofocus=\"true\" required=\"true\">\n");
      out.write("                  <span id=\"ojopas\" class=\"fa fa-eye\" style=\"right: 25px;top: 42px;\"></span>\n");
      out.write("                </div>\t\n");
      out.write("                <div class=\"password col-sm-6 form-group\">\n");
      out.write("                  <label>&nbsp;Repita contraseña</label>\n");
      out.write("                  <input type=\"password\" id=\"repass\" placeholder=\"Repita Contraseña\" title=\"Repita contraseña\" class=\"form-control\" autofocus=\"true\" required=\"true\">\n");
      out.write("                  <span id=\"ojore\" class=\"fa fa-eye\" style=\"right: 25px;top: 42px;\"></span>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"form-group\">\n");
      out.write("                <label>&nbsp;Apellido y Nombre</label>\n");
      out.write("                <input type=\"text\" name=\"apenom\" id=\"apenom\" placeholder=\"Apellido y Nombre\" title=\"Ingrese su apellido y nombre\" class=\"form-control\" autofocus=\"true\" required=\"true\">\n");
      out.write("              </div>\t\t\t\n");
      out.write("              <div class=\"form-group\">\n");
      out.write("                <label>&nbsp;Domicilio</label>\n");
      out.write("                <input type=\"text\" name=\"domicilio\" id=\"domicilio\" placeholder=\"Domicilio\" title=\"Ingrese su Domicilio\" class=\"form-control\" autofocus=\"true\" required=\"true\">\n");
      out.write("              </div>\n");
      out.write("              <div class=\"form-group\">\n");
      out.write("                <label>&nbsp;Documento de Identidad</label>\n");
      out.write("                <input type=\"text\" name=\"documento\" id=\"documento\" placeholder=\"Documento de Identidad\" title=\"Ingrese su documento de identidad\" class=\"form-control\" autofocus=\"true\" required=\"true\">\n");
      out.write("              </div>\n");
      out.write("              <div class=\"form-group\">\n");
      out.write("                <label>&nbsp;Teléfono de contacto</label>\n");
      out.write("                <input type=\"text\" name=\"telefono\" id=\"telefono\" placeholder=\"Teléfono de contacto\" title=\"Ingrese un número de contacto\" class=\"form-control\" autofocus=\"true\" required=\"true\">\n");
      out.write("              </div>\t\t\n");
      out.write("              <div class=\"form-group\">\n");
      out.write("                <label>&nbsp;Email</label>\n");
      out.write("                <input type=\"email\" name=\"email\" id=\"email\" placeholder=\"Email de contacto\" title=\"Ingrese su email\" class=\"form-control\" autofocus=\"true\" required=\"true\">\n");
      out.write("              </div>\n");
      out.write("              <button type=\"submit\" id=\"enviar\" class=\"btn btn-lg btn-primary btn-block margin1top\" >Registrarse en BiciAmiga</button>\n");
      out.write("            </div>              \n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </form>\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("    <!-- Footer -->\n");
      out.write("    ");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("  <head>\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    <title>BiciAmiga - Rosario</title>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core CSS -->\n");
      out.write("    <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("\n");
      out.write("    <!-- Custom fonts for this template -->\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i\" rel=\"stylesheet\">\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    <!-- Custom styles for this template -->\n");
      out.write("    <link href=\"css/business-casual.min.css\" rel=\"stylesheet\">\n");
      out.write("    <link rel=\"icon\" href=\"img/favicon.ico\" type=\"image/x-icon\">\n");
      out.write("    <link rel=\"shortcut icon\" href=\"img/favicon.ico\" type=\"image/x-icon\"> \n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("    <!-- Footer -->\n");
      out.write("    <footer class=\"footer text-faded text-center py-5\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <p class=\"m-0 small\"> TP FINAL JAVA &copy; | BiciAmiga &reg; | Alvarez, Facundo (40149) | UTN FRRO - 2018</p>\n");
      out.write("      </div>\n");
      out.write("    </footer>\n");
      out.write("    <!-- Bootstrap core JavaScript -->\n");
      out.write("    <script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("    <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core JavaScript -->\n");
      out.write("    <script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("    <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    <script src=\"js/existeUsuario.js\"></script>\n");
      out.write("    <script src=\"js/registroNuevoUsr.js\"></script>\n");
      out.write("  </body>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
