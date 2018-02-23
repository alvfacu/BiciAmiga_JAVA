package Servlets;

import Negocio.ControladorUsuarios;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ValidaUsuario", urlPatterns = {"/ValidaUsuario"})
public class ValidaUsuario extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String userName = request.getParameter("usuario").trim();
    String rdo;
    if ("".equals(userName)) {
      rdo = "1";
    } else {
      int cant = new ControladorUsuarios().existeUsuario(userName);

      if (cant > 0) {
        rdo = "1";
      } else {
        rdo = "0";
      }
    }

    response.setContentType("text/plain");
    response.getWriter().write(rdo);
  }

}
