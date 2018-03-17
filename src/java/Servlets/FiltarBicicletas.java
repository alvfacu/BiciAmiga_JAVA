package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "reservar", urlPatterns = {"/reservar"})
public class FiltarBicicletas extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      String model = request.getParameter("modelos");
      String[] modelo = model.split("-");
      int idTipoVerif = Integer.valueOf(modelo[0]);
      int idTipo = Integer.valueOf(request.getParameter("tipos"));
      if(idTipo==idTipoVerif)
      {
        int idModelo = Integer.valueOf(modelo[1]);
        String fecha = request.getParameter("fecha");
        String hrDsd = request.getParameter("hrdesde").replaceAll("%3A", ":");
        String hrHst = request.getParameter("hrhasta").replaceAll("%3A", ":");
        request.setAttribute("idTipo", idTipo);
        request.setAttribute("idModelo", idModelo);
        request.getRequestDispatcher("reservar.jsp").forward(request, response);
      }
      else
      {
        response.sendRedirect("error.jsp");
      }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try
    { 

    }
    catch(Exception exception1)
    {
      response.sendRedirect("error.jsp");
    }
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
