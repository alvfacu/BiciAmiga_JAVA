package Negocio;

import Datos.CatalogoReservas;
import Entidades.Reservas;
import Entidades.Usuarios;
import java.util.ArrayList;

public class ControladorReservas {
  
  CatalogoReservas cr;
  
  public ControladorReservas() {
    this.cr = new CatalogoReservas();
  }

  public ArrayList<Reservas> getReservas() {
    return cr.getReservas();
  }
  
  public ArrayList<Reservas> getReservasPendientes() {
    return cr.getReservasPendientes();
  }
  
  public ArrayList<Reservas> getReservasEnCurso() {
    return cr.getReservasPendientes();
  }
  
  public ArrayList<Reservas> getReservasFinalizados() {
    return cr.getReservasFinalizadas();
  }
 
  public ArrayList<Reservas> getReservasPendientesXUsr(Usuarios usr){
    return cr.getReservasPendientesXUsr(usr.getId());
  }
  
  public ArrayList<Reservas> getReservasFinalizadasXUsr(Usuarios usr){
    return cr.getReservasFinalizadasXUsr(usr.getId());
  }
  
  public Reservas getReserva(int id) {
    return cr.getReserva(id);
  }

  public void altaReserva(Reservas r) {
    cr.altaReserva(r);
  }

  public void bajaReserva(Reservas r){
    cr.bajaReserva(r);
  }

  public void modificarReserva(Reservas r){
    cr.modificarReserva(r);
  }

  public boolean cancelarReserva(int idReserva) {
    Reservas rActual = cr.getReserva(idReserva);
    if(rActual!=null)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
 
  public boolean finalizarReserva(int idReserva) {
    Reservas rActual = cr.getReserva(idReserva);
    if(rActual!=null)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
}
