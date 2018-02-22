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

@WebServlet(name = "ModificarBicicleta", urlPatterns = {"/ModificarBicicleta"})
public class ModificarBicicleta extends HttpServlet {

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
    int id = Integer.valueOf(request.getParameter("ediid_b"));
    int idtipo = Integer.valueOf(request.getParameter("ediclr"));
    TiposBicicleta tb = new ControladorBicicletas().getTipo(idtipo);
    String patente = request.getParameter("edipatente").toUpperCase().trim();
    String descripcion = request.getParameter("edidescrip").trim();
    Boolean disp = Boolean.valueOf(request.getParameter("edidisponible"));
    double kmMant = Double.valueOf(request.getParameter("edikmMantenimiento"));
    double kmViaje = Double.valueOf(request.getParameter("edikmViajados"));
    Bicicletas b = new Bicicletas(id, patente, descripcion, tb, disp, kmViaje, kmMant);
    new ControladorBicicletas().modificarBicicleta(b);
    response.sendRedirect("admbici.jsp");
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
