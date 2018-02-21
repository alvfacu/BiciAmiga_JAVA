
package Negocio;

import Datos.CatalogoTiposBicicletas;
import Entidades.TiposBicicleta;
import java.util.ArrayList;

public class ControladorTiposBicicletas {
    CatalogoTiposBicicletas ctb;

  public ControladorTiposBicicletas() {
    this.ctb = new CatalogoTiposBicicletas();
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
    
}
