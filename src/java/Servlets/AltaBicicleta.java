package Servlets;

import Entidades.Bicicletas;
import Entidades.TiposBicicleta;
import Negocio.ControladorBicicletas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AltaBicicleta", urlPatterns = {"/AltaBicicleta"})
public class AltaBicicleta extends HttpServlet {

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
    
    int tipo = Integer.parseInt(request.getParameter("clr"));
    TiposBicicleta tb = new ControladorBicicletas().getTipo(tipo);
    String patente = request.getParameter("patente").toUpperCase().trim();
    Boolean disp = Boolean.getBoolean(request.getParameter("disponible"));
    double kmMant = Double.valueOf(request.getParameter("kmMantenimiento"));
    double kmViaje = Double.valueOf(request.getParameter("kmViajados"));
    String descripcion = request.getParameter("descrip").trim();
    Bicicletas b = new Bicicletas(patente, descripcion, tb, disp, kmViaje, kmMant);
    new ControladorBicicletas().altaBicicleta(b);
    response.sendRedirect("admbici.jsp");
            
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
