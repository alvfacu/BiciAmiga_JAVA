package Servlets;

import Entidades.TiposBicicleta;
import Negocio.ControladorBicicletas;
import Negocio.ControladorTiposBicicletas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EliminarTipoBici", urlPatterns = {"/EliminarTipoBici"})
public class EliminarTipoBici extends HttpServlet {

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
    int id = Integer.valueOf(request.getParameter("eliid"));
    TiposBicicleta tb = new ControladorTiposBicicletas().getTipo(id);
    new ControladorTiposBicicletas().bajaTipoBicicleta(tb);
    response.sendRedirect("admbici.jsp");
  }


  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
