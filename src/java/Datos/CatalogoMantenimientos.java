package Datos;

import Entidades.Bicicletas;
import Entidades.Mantenimientos;
import Entidades.TiposMantenimiento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoMantenimientos {
  public ArrayList<Mantenimientos> getMantenimientos() {
    ArrayList<Mantenimientos> mantenimientos = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from mantenimientos";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Mantenimientos m = new Mantenimientos();
        m.setId(rs.getInt("id"));
        Bicicletas b = new CatalogoBicicletas().getBicicleta(rs.getInt("id_bici"));
        m.setBici(b);
        TiposMantenimiento tm = new CatalogoTiposMantenimiento().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tm);
        m.setFechaEgreso(rs.getDate("fecha_egreso"));
        m.setFechaIngreso(rs.getDate("fecha_ingreso"));
        m.setKmIngreso(rs.getDouble("km_ingreso"));
        m.setKmEgreso(rs.getDouble("km_egreso"));
        m.setObservacion(rs.getString("obs"));
        mantenimientos.add(m);
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
    return mantenimientos;
  }

  public Mantenimientos getMantenimiento(int id) {    
    PreparedStatement sentencia = null;
    ResultSet rs = null;
    Mantenimientos m = null;
    String sql = "select * from mantenimientos where id=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, id);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        m = new Mantenimientos();
        m.setId(rs.getInt("id"));
        Bicicletas b = new CatalogoBicicletas().getBicicleta(rs.getInt("id_bici"));
        m.setBici(b);
        TiposMantenimiento tm = new CatalogoTiposMantenimiento().getTipo(rs.getInt("id_tipo"));
        m.setTipo(tm);
        m.setFechaEgreso(rs.getDate("fecha_egreso"));
        m.setFechaIngreso(rs.getDate("fecha_ingreso"));
        m.setKmIngreso(rs.getDouble("km_ingreso"));
        m.setKmEgreso(rs.getDouble("km_egreso"));
        m.setObservacion(rs.getString("obs"));
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return m;
  }

  public void altaMantenimiento(Mantenimientos m) {
    PreparedStatement sentencia = null;
    ResultSet rs=null;
    String sql = "insert into mantenimientos(patente,id_tipo,fecha_ingreso,km_ingreso,fecha_egreso,km_egreso,obs) "
            + "values(?,?,?,?,?,?,?)";
    try {
      sentencia=ConexionBD.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
      sentencia.setInt(1,m.getBici().getId());
      sentencia.setInt(2,m.getTipo().getId());
      sentencia.setDate(3, m.getFechaIngreso());
      sentencia.setDouble(4, m.getKmIngreso());
      sentencia.setDate(5, m.getFechaEgreso());
      sentencia.setDouble(6, m.getKmIngreso());
      sentencia.setString(7, m.getObservacion());
      sentencia.execute();
      rs=sentencia.getGeneratedKeys();
      if(rs!=null && rs.next()){
        m.setId(rs.getInt(1));
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

  public void bajaMantenimientos(Mantenimientos m) {
    PreparedStatement sentencia = null;
    String sql = "delete from mantenimientos where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, m.getId());
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

  public void modificarMantenimiento(Mantenimientos m) {
    PreparedStatement sentencia = null;
    String sql = "update mantenimientos set patente=?, id_tipo=?, fecha_ingreso=?, km_ingreso=?, fecha_egreso=? "
            +" km_egreso=?, obs=? where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, m.getBici().getId());
      sentencia.setInt(2, m.getTipo().getId());
      sentencia.setDate(3, m.getFechaIngreso());
      sentencia.setDouble(4, m.getKmIngreso());
      sentencia.setDate(5, m.getFechaEgreso());
      sentencia.setDouble(6, m.getKmEgreso());
      sentencia.setString(7, m.getObservacion());
      sentencia.setInt(8,m.getId());
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
