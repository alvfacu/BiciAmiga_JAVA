package Servlets;

import Entidades.Modelos;
import Negocio.ControladorBicicletas;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
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
    
      int idTipo = Integer.valueOf(request.getParameter("tipos"));
      int idTipoVerif = idTipo;
      int idModelo = 0;
      if(idTipo>0)
      {
        String model = request.getParameter("modelos");
        String[] modelo = model.split("-");
        if(modelo.length>1)
        {          
          idTipoVerif = Integer.valueOf(modelo[0]);
          idModelo = Integer.valueOf(modelo[1]);
        }
      }
      
      if(idTipo==idTipoVerif)
      {
        Calendar fechaReserva = Calendar.getInstance();
        
        String[] fecha = request.getParameter("fecha").split("-");
        int anio = Integer.valueOf(fecha[0]);
        int mes = Integer.valueOf(fecha[1]);
        int dia = Integer.valueOf(fecha[2]);        
        fechaReserva.set(anio, (mes-1), dia, 0,0,0);
        
        if(fechaReserva.before(Calendar.getInstance())){
          fechaReserva = Calendar.getInstance();
        }
        
        boolean completo = false;
        if(Boolean.valueOf(request.getParameter("completo")))
          completo = true;
        
        int hrDsd = 9;        
        int hrHst = 21;
        
        if(!completo && request.getParameter("hrdesde")!=null && request.getParameter("hrhasta")!=null)
        {
          String desde = request.getParameter("hrdesde");       
        
          if(Integer.valueOf(desde)>9)
          {
            hrDsd = Integer.valueOf(desde);    
          }
          
          String hasta = request.getParameter("hrhasta");
          if(Integer.valueOf(hasta)<21)
          {
            hrHst = Integer.valueOf(hasta);
          }
        }
        
        
        Calendar fechaDsd = Calendar.getInstance();
        Calendar fechaHst = Calendar.getInstance();
        fechaDsd.set(Calendar.HOUR_OF_DAY, hrDsd);
        fechaDsd.set(Calendar.MINUTE, 0);
        fechaDsd.set(Calendar.SECOND, 0);
        fechaDsd.set(Calendar.MILLISECOND, 0);
        
        fechaHst.set(Calendar.HOUR_OF_DAY, hrHst);
        fechaHst.set(Calendar.MINUTE, 0);                
        fechaHst.set(Calendar.SECOND, 0);
        fechaHst.set(Calendar.MILLISECOND, 0);
        
        ArrayList<Modelos> disponibles;
        if(idTipo>0 && idModelo>0){
          disponibles = new ControladorBicicletas().getModelosDisponiblesXTipoXModelo(idTipo,idModelo);
        }
        else if (idTipo>0 && idModelo==0){
          disponibles = new ControladorBicicletas().getModelosDisponiblesXTipo(idTipo);
        }
        else {
          disponibles = new ControladorBicicletas().getModelosDisponibles(fechaDsd,fechaHst);
        } 
        
        request.setAttribute("bicicletas", disponibles);
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
