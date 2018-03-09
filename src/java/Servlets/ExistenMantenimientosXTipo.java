/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Negocio.ControladorMantenimientos;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Facundo
 */
@WebServlet(name = "ExistenMantenimientosXTipo", urlPatterns = {"/ExistenMantenimientosXTipo"})
public class ExistenMantenimientosXTipo extends HttpServlet {

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
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
    String id = request.getParameter("id").trim();
    String rdo;
    int cant = new ControladorMantenimientos().existenMantenimientosActivosXTipo(id);

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
