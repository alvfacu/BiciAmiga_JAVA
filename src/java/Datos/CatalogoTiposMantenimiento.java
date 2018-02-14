package Datos;

import Entidades.TiposMantenimiento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoTiposMantenimiento {
  
  public ArrayList<TiposMantenimiento> getTipos() {
    ArrayList<TiposMantenimiento> tipos = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from tipos_mantenimiento";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        TiposMantenimiento tm = new TiposMantenimiento();
        tm.setId(rs.getInt("id"));
        tm.setDescripcion(rs.getString("descripcion"));
        tm.setKmParaMantenimiento(rs.getDouble("km"));
        tm.setObligatorio(rs.getBoolean("obligatorio"));
        tipos.add(tm);
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

  public TiposMantenimiento getTipo(int id) {    
    PreparedStatement sentencia = null;
    ResultSet rs = null;
    TiposMantenimiento tm = null;
    String sql = "select * from tipos_mantenimiento where id=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, id);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        tm = new TiposMantenimiento();
        tm.setDescripcion(rs.getString("descripcion"));
        tm.setKmParaMantenimiento(rs.getDouble("km"));
        tm.setObligatorio(rs.getBoolean("obligatorio"));
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return tm;
  }

  public void altaTipoMantenimiento(TiposMantenimiento tm) {
    PreparedStatement sentencia = null;
    ResultSet rs=null;
    String sql = "insert into tipos_mantenimiento(descripcion,km,obligatorio) "
            + "values(?,?,?)";
    try {
      sentencia=ConexionBD.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
      sentencia.setString(1,tm.getDescripcion());
      sentencia.setDouble(2,tm.getKmParaMantenimiento());
      sentencia.setBoolean(3,tm.isObligatorio());
      sentencia.execute();
      rs=sentencia.getGeneratedKeys();
      if(rs!=null && rs.next()){
        tm.setId(rs.getInt(1));
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

  public void bajaTipoMantenimiento(TiposMantenimiento tm) {
    PreparedStatement sentencia = null;
    String sql = "delete from tipos_mantenimiento where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, tm.getId());
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

  public void modificarTipoMantenimiento(TiposMantenimiento tm) {
    PreparedStatement sentencia = null;
    String sql = "update tipos_mantenimiento set descripcion=?, km=?, obligatorio=?"
            + " where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, tm.getDescripcion());
      sentencia.setDouble(2, tm.getKmParaMantenimiento());
      sentencia.setBoolean(3, tm.isObligatorio());
      sentencia.setInt(4, tm.getId());
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
