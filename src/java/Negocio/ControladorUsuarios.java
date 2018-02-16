package Negocio;

import Datos.CatalogoUsuarios;
import Entidades.Usuarios;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import javax.xml.bind.DatatypeConverter;

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

  public Usuarios validarUsuario(String usuario, String password) throws NoSuchAlgorithmException {
    MessageDigest md = MessageDigest.getInstance("MD5");
    md.update(password.getBytes());
    byte[] digest = md.digest();
    String myChecksum = DatatypeConverter.printHexBinary(digest).toUpperCase();
    
    Usuarios usrActual = cu.getUsuarioXUsr(usuario);
    
    if(usrActual!=null)
    {
      if(myChecksum.equals(usrActual.getContrasenia().toUpperCase()))
        return usrActual;
      else
        return null;
    }
    else 
      return null;    
  }
}
