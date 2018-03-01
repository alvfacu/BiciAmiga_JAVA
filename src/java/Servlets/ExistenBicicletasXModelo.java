package Servlets;

import Negocio.ControladorBicicletas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ExistenBicicletasXModelo", urlPatterns = {"/ExistenBicicletasXModelo"})
public class ExistenBicicletasXModelo extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String idModelo = request.getParameter("id").trim();
    String rdo;
    int cant = new ControladorBicicletas().existenBicicletasXTipo(idModelo);

      if (cant > 0) {
        rdo = "1";
      } else {
        rdo = "0";
      }

    response.setContentType("text/plain");
    response.getWriter().write(rdo);
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
