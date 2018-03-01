package Datos;

import Entidades.TiposBicicleta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoTiposBicicletas {
  
  //id	nombre_gral	nombre_det	descripcion	precio_dia	precio_hr
  
  public ArrayList<TiposBicicleta> getTipos() {
    ArrayList<TiposBicicleta> tipos = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from tipos_bicicleta";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        TiposBicicleta tb = new TiposBicicleta();
        tb.setId(rs.getInt("id"));
        tb.setDescripcion(rs.getString("descripcion"));
        tb.setNombre(rs.getString("nombre"));
        tipos.add(tb);
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
    return tipos;
  }

  public TiposBicicleta getTipo(int id) {    
    PreparedStatement sentencia;
    ResultSet rs;
    TiposBicicleta tb = null;
    String sql = "select * from tipos_bicicleta where id=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, id);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        tb = new TiposBicicleta();
        tb.setId(rs.getInt("id"));
        tb.setDescripcion(rs.getString("descripcion"));
        tb.setNombre(rs.getString("nombre"));
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return tb;
  }

  public void altaTipoBicicleta(TiposBicicleta tb) {
    PreparedStatement sentencia = null;
    ResultSet rs;
    String sql = "insert into tipos_bicicleta(nombre,descripcion) "
            + "values(?,?)";
    try {
      sentencia=ConexionBD.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
      sentencia.setString(1,tb.getNombre());
      sentencia.setString(2,tb.getDescripcion());
      sentencia.execute();
      rs=sentencia.getGeneratedKeys();
      if(rs!=null && rs.next()){
        tb.setId(rs.getInt(1));
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

  public void bajaTipoBicicleta(TiposBicicleta tb) {
    PreparedStatement sentencia = null;
    String sql = "delete from tipos_bicicleta where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, tb.getId());
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

  public void modificarTipoBicicleta(TiposBicicleta tb) {
    PreparedStatement sentencia = null;
    String sql = "update tipos_bicicleta set nombre=?, descripcion=?"
            + " where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, tb.getNombre());
      sentencia.setString(2, tb.getDescripcion());
      sentencia.setDouble(3, tb.getId());
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
  
}
