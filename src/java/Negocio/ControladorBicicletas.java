package Negocio;

import Datos.CatalogoBicicletas;
import Datos.CatalogoTiposBicicletas;
import Entidades.Bicicletas;
import Entidades.TiposBicicleta;
import java.util.ArrayList;

public class ControladorBicicletas {
  CatalogoBicicletas cb;
  CatalogoTiposBicicletas ctb;

  public ControladorBicicletas() {
    this.cb = new CatalogoBicicletas();
    this.ctb = new CatalogoTiposBicicletas();
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
      
  public ArrayList<TiposBicicleta> getTiposBicicleta() {
    return ctb.getTipos();
  }
   
  public TiposBicicleta getTipo(int id) {
    return ctb.getTipo(id);
  }

  public void altaTipoBicicleta(TiposBicicleta tb){
    ctb.altaTipoBicicleta(tb);
  }

  public void bajaTipoBicicleta(TiposBicicleta tb){
    ctb.bajaTipoBicicleta(tb);
  }

  public void modificarTipoBicicleta(TiposBicicleta tb) {
    ctb.modificarTipoBicicleta(tb);
  }

  public int existenBicicletasXTipo(String idTipo) {
    return cb.existenBicicletasXTipo(idTipo);
  }

}
