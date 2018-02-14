package Negocio;

import Datos.CatalogoReservas;
import Entidades.Reservas;
import java.util.ArrayList;

public class ControladorReservas {
  
  CatalogoReservas cr;
  
  public ControladorReservas() {
    this.cr = new CatalogoReservas();
  }

  public ArrayList<Reservas> getReservas() {
    return cr.getReservas();
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
}
