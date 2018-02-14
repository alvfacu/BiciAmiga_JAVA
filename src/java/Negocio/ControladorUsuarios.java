package Negocio;

import Datos.CatalogoUsuarios;
import Entidades.Usuarios;
import java.util.ArrayList;

public class ControladorUsuarios {
  CatalogoUsuarios cu;
  
  public ControladorUsuarios() {
    this.cu = new CatalogoUsuarios();
  }

  public ArrayList<Usuarios> getUsuarios() {
    return cu.getUsuarios();
  }
   
  public Usuarios getUsuario(int id) {
    return cu.getUsuario(id);
  }

  public void altaUsuario(Usuarios u) {
    cu.altaUsuario(u);
  }

  public void bajaUsuario(Usuarios u){
    cu.bajaUsuario(u);
  }

  public void modificarUsuario(Usuarios u){
    cu.modificarUsuarios(u);
  }
}
