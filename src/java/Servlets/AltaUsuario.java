package Servlets;

import Entidades.Usuarios;
import Negocio.ControladorUsuarios;
import Util.Seguridad;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AltaUsuario", urlPatterns = {"/AltaUsuario"})
public class AltaUsuario extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try {      
      String apenom = request.getParameter("apenom");
      String domi = request.getParameter("domicilio");
      String usuario = request.getParameter("usuario");
      String documento = request.getParameter("documento");
      String clave = new Seguridad().md5(request.getParameter("pass"));
      String telefono = request.getParameter("telefono");
      String mail = request.getParameter("email");
      
      Usuarios u = new Usuarios(apenom, usuario, clave, mail, domi, telefono, documento, false, true, false);
      ControladorUsuarios cu = new ControladorUsuarios();
      cu.altaUsuario(u);
      response.sendRedirect("registro_exitoso.jsp");
    } catch (NoSuchAlgorithmException ex) {
      Logger.getLogger(AltaUsuario.class.getName()).log(Level.SEVERE, null, ex);
      response.sendRedirect("error.jsp");
    }
  }
}
