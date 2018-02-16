package Datos;

import Entidades.Usuarios;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoUsuarios {
  
  public ArrayList<Usuarios> getUsuarios() {
    ArrayList<Usuarios> usuarios = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from usuarios";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Usuarios u = new Usuarios();
        u.setId(rs.getInt("id"));
        u.setApynom(rs.getString("apynom"));
        u.setUsuario(rs.getString("usuario"));
        u.setContrasenia(rs.getString("contrasenia"));
        u.setDocumento(rs.getString("documento"));
        u.setDomicilio(rs.getString("domicilio"));
        u.setAdm(rs.getBoolean("admin"));
        u.setEmail(rs.getString("email"));
        u.setHabilitado(rs.getBoolean("habilitado"));
        u.setTelefono(rs.getString("telefono"));        
        usuarios.add(u);
      }
    } catch (SQLException e1) {
      e1.printStackTrace();
    } finally {
      try {
        if (sentencia != null) {
          sentencia.close();
        }
        if (rs != null) {
          rs.close();
        }
        ConexionBD.getInstancia().CloseConn();
      } catch (SQLException e2) {
        e2.printStackTrace();
      }
    }
    return usuarios;
  }

  public Usuarios getUsuario(int id) {    
    PreparedStatement sentencia = null;
    ResultSet rs = null;
    Usuarios u = null;
    String sql = "select * from usuarios where id=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, id);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        u = new Usuarios();
        u.setId(rs.getInt("id"));
        u.setApynom(rs.getString("apynom"));
        u.setUsuario(rs.getString("usuario"));
        u.setContrasenia(rs.getString("contrasenia"));
        u.setDocumento(rs.getString("documento"));
        u.setDomicilio(rs.getString("domicilio"));
        u.setAdm(rs.getBoolean("admin"));
        u.setEmail(rs.getString("email"));
        u.setHabilitado(rs.getBoolean("habilitado"));
        u.setTelefono(rs.getString("telefono"));        
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return u;
  }

  public void altaUsuario(Usuarios u) {
    PreparedStatement sentencia = null;
    ResultSet rs=null;
    String sql = "insert into usuarios(apynom,usuario,contrasenia,documento,domicilio,admin,email,habilitado,telefono) "
            + "values(?,?,?,?,?,?,?,?,?)";
    try {
      sentencia=ConexionBD.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
      sentencia.setString(1,u.getApynom());
      sentencia.setString(2,u.getUsuario());
      sentencia.setString(3,u.getContrasenia());
      sentencia.setString(4,u.getDocumento());
      sentencia.setString(5,u.getDomicilio());
      sentencia.setBoolean(6,u.isAdm());
      sentencia.setString(7,u.getEmail());
      sentencia.setBoolean(8,u.isHabilitado());
      sentencia.setString(9,u.getTelefono());
      sentencia.execute();
      rs=sentencia.getGeneratedKeys();
      if(rs!=null && rs.next()){
        u.setId(rs.getInt(1));
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (sentencia != null && !sentencia.isClosed()) {
          sentencia.close();
        }
        ConexionBD.getInstancia().CloseConn();
      } catch (SQLException sqle) {
        sqle.printStackTrace();
      }
    }
  }

  public void bajaUsuario(Usuarios u) {
    PreparedStatement sentencia = null;
    String sql = "delete from usuarios where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, u.getId());
      sentencia.execute();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (sentencia != null && !sentencia.isClosed()) {
          sentencia.close();
        }
        ConexionBD.getInstancia().CloseConn();

      } catch (SQLException e2) {
        e2.printStackTrace();
      }
    }

  }

  public void modificarUsuarios(Usuarios u) {
    PreparedStatement sentencia = null;
    String sql = "update usuarios set apynom=?, usuario=?, contrasenia=?, documento=?, domicilio=?, admin=? "
            +" email=?, habilitado=?, telefono=? where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, u.getApynom());
      sentencia.setString(2, u.getUsuario());
      sentencia.setString(3, u.getContrasenia());
      sentencia.setString(4, u.getDocumento());
      sentencia.setString(5, u.getDomicilio());
      sentencia.setBoolean(6, u.isAdm());
      sentencia.setString(7, u.getEmail());
      sentencia.setBoolean(8, u.isHabilitado());
      sentencia.setString(9, u.getTelefono());
      sentencia.setDouble(10, u.getId());
      sentencia.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (sentencia != null && !sentencia.isClosed()) {
          sentencia.close();
        }
        ConexionBD.getInstancia().CloseConn();
      } catch (SQLException e2) {
        e2.printStackTrace();
      }
    }
  }

  public Usuarios getUsuarioXUsr(String usr) {
    PreparedStatement sentencia = null;
    ResultSet rs = null;
    Usuarios u = null;
    String sql = "select * from usuarios where usuario=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, usr);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        u = new Usuarios();
        u.setId(rs.getInt("id"));
        u.setApynom(rs.getString("apynom"));
        u.setUsuario(rs.getString("usuario"));
        u.setContrasenia(rs.getString("contrasenia"));
        u.setDocumento(rs.getString("documento"));
        u.setDomicilio(rs.getString("domicilio"));
        u.setAdm(rs.getBoolean("admin"));
        u.setEmail(rs.getString("email"));
        u.setHabilitado(rs.getBoolean("habilitado"));
        u.setTelefono(rs.getString("telefono"));        
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return u;
  }
}
