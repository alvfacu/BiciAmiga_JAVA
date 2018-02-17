
package Servlets;

import Entidades.Usuarios;
import Negocio.ControladorUsuarios;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
    HttpSession session = request.getSession(true);
    session.setMaxInactiveInterval(3600);
    String usuario = request.getParameter("user");
    String password = request.getParameter("pass");
    ControladorUsuarios cu = new ControladorUsuarios();
    try {
      Usuarios usr = cu.validarUsuario(usuario, password);
      if (usr == null) {
        session.setAttribute("Usuario", null);
        session.setAttribute("Msj", "Usuario o contraseña incorrecto/s");
        response.sendRedirect("login.jsp");
      } else {
        session.setAttribute("Usuario", usr);
        response.sendRedirect("index.jsp");
      }
    } catch (NoSuchAlgorithmException ex) {
      Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
    }

  }
  
}
