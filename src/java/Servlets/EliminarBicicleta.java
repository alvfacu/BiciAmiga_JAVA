package Servlets;

import Entidades.Bicicletas;
import Negocio.ControladorBicicletas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "EliminarBicicleta", urlPatterns = {"/EliminarBicicleta"})
public class EliminarBicicleta extends HttpServlet {

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
    int id = Integer.valueOf(request.getParameter("eliid_b"));
    Bicicletas b = new ControladorBicicletas().getBicicleta(id);
    new ControladorBicicletas().bajaBicicleta(b);
    response.sendRedirect("admbici.jsp");
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}