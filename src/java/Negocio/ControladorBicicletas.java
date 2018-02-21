package Negocio;

import Datos.CatalogoBicicletas;
import Entidades.Bicicletas;
import java.util.ArrayList;

public class ControladorBicicletas {
  CatalogoBicicletas cb;

  public ControladorBicicletas() {
    this.cb = new CatalogoBicicletas();
  }

  public ArrayList<Bicicletas> getBicicletas() {
    return cb.getBicicletas();
  }
   
  public Bicicletas getBicicleta(int patente) {
    return cb.getBicicleta(patente);
  }

  public void altaBicicleta(Bicicletas b) {
    cb.altaBicicleta(b);
  }

  public void bajaBicicleta(Bicicletas b) {
    cb.bajaBicicleta(b);
  }

  public void modificarBicicleta(Bicicletas b) {
    cb.modificarBicicleta(b);
  }


  public int existePatente(String patente) {
    return cb.existeBicicleta(patente);
  }

}
