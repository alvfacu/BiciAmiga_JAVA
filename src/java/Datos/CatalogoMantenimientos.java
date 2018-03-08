package Datos;

import Entidades.Bicicletas;
import Entidades.DetallesMantenimiento;
import Entidades.Mantenimientos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

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
        
        //java.sql.Timestamp fecha_ingreso = rs.getTimestamp("fecha_ingreso");
        //m.setFechaIngreso(fecha_ingreso);
        if(rs.getTimestamp("fecha_ingreso")!=null)
        {
          long fecha = rs.getTimestamp("fecha_ingreso").getTime();
          Date currentDate = new Date(fecha);
          m.setFechaIngreso(currentDate);
        }
        else
        {
          m.setFechaIngreso(null);
        }
        
        if(rs.getTimestamp("fecha_egreso")!=null)
        {
          long fecha = rs.getTimestamp("fecha_egreso").getTime();
          Date currentDate = new Date(fecha);
          m.setFechaEgreso(currentDate);
        }
        else
        {
          m.setFechaEgreso(null);
        }
        
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
    PreparedStatement sentencia;
    ResultSet rs;
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
        m.setFechaIngreso(rs.getTimestamp("fecha_egreso"));
        m.setFechaEgreso(rs.getTimestamp("fecha_ingreso"));
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
    ResultSet rs;
    String sql = "insert into mantenimientos(id_bici,fecha_ingreso,km_ingreso,fecha_egreso,km_egreso,obs) "
            + "values(?,?,?,?,?,?)";
    try {
      sentencia=ConexionBD.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
      sentencia.setInt(1,m.getBici().getId());      
      sentencia.setTimestamp(2, new java.sql.Timestamp(m.getFechaIngreso().getTime()));
      sentencia.setDouble(3, m.getKmIngreso());
      
      if(m.getFechaEgreso()!=null)
        sentencia.setTimestamp(4, new java.sql.Timestamp(m.getFechaEgreso().getTime()));
      else
        sentencia.setTimestamp(4, null);
      
      sentencia.setDouble(5, m.getKmEgreso());
      sentencia.setString(6, m.getObservacion());
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
    String sql = "update mantenimientos set patente=?, fecha_ingreso=?, km_ingreso=?, fecha_egreso=? "
            +" km_egreso=?, obs=? where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, m.getBici().getId());
      sentencia.setTimestamp(2, new java.sql.Timestamp(m.getFechaIngreso().getTime()));
      sentencia.setDouble(3, m.getKmIngreso());
      
      if(m.getFechaEgreso()!=null)
        sentencia.setTimestamp(4, new java.sql.Timestamp(m.getFechaEgreso().getTime()));
      else
        sentencia.setTimestamp(4, null);
      
      sentencia.setDouble(5, m.getKmEgreso());
      sentencia.setString(6, m.getObservacion());
      sentencia.setInt(7,m.getId());
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

  public ArrayList<Mantenimientos> getMantenimientosActivos() {
    ArrayList<Mantenimientos> mantenimientos = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from mantenimientos where fecha_egreso is null";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Mantenimientos m = new Mantenimientos();
        m.setId(rs.getInt("id"));
        Bicicletas b = new CatalogoBicicletas().getBicicleta(rs.getInt("id_bici"));
        m.setBici(b);
        //java.sql.Timestamp fecha_ingreso = rs.getTimestamp("fecha_ingreso");
        //m.setFechaIngreso(fecha_ingreso);
        if(rs.getTimestamp("fecha_ingreso")!=null)
        {
          long fecha = rs.getTimestamp("fecha_ingreso").getTime();
          Date currentDate = new Date(fecha);
          m.setFechaIngreso(currentDate);
        }
        else
        {
          m.setFechaIngreso(null);
        }
        
        if(rs.getTimestamp("fecha_egreso")!=null)
        {
          long fecha = rs.getTimestamp("fecha_egreso").getTime();
          Date currentDate = new Date(fecha);
          m.setFechaEgreso(currentDate);
        }
        else
        {
          m.setFechaEgreso(null);
        }
        
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

  public ArrayList<Mantenimientos> getMantenimientosFinalizados() {
        ArrayList<Mantenimientos> mantenimientos = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from mantenimientos where fecha_egreso is not null";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Mantenimientos m = new Mantenimientos();
        m.setId(rs.getInt("id"));
        Bicicletas b = new CatalogoBicicletas().getBicicleta(rs.getInt("id_bici"));
        m.setBici(b);
        //java.sql.Timestamp fecha_ingreso = rs.getTimestamp("fecha_ingreso");
        //m.setFechaIngreso(fecha_ingreso);
        if(rs.getTimestamp("fecha_ingreso")!=null)
        {
          long fecha = rs.getTimestamp("fecha_ingreso").getTime();
          Date currentDate = new Date(fecha);
          m.setFechaIngreso(currentDate);
        }
        else
        {
          m.setFechaIngreso(null);
        }
        
        if(rs.getTimestamp("fecha_egreso")!=null)
        {
          long fecha = rs.getTimestamp("fecha_egreso").getTime();
          Date currentDate = new Date(fecha);
          m.setFechaEgreso(currentDate);
        }
        else
        {
          m.setFechaEgreso(null);
        }
        
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
  
  public void altaDetalleMant(DetallesMantenimiento det) {
    PreparedStatement sentencia = null;
    String sql = "insert into detalle_mantenimiento(id,id_tipom,fecha,km) "
            + "values(?,?,?,?)";
    try {
      sentencia=ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1,det.getMantenimiento().getId());      
      sentencia.setInt(2,det.getTipo().getId());      
      sentencia.setTimestamp(3, new java.sql.Timestamp(det.getFecha().getTime()));
      sentencia.setDouble(4, det.getKm());
      sentencia.execute();
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
}
