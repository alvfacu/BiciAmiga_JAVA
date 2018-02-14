package Datos;

import Entidades.Bicicletas;
import Entidades.TiposBicicleta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CatalogoBicicletas {

  public ArrayList<Bicicletas> getBicicletas() {
    ArrayList<Bicicletas> bicicletas = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from bicicletas";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Bicicletas b = new Bicicletas();
        b.setDescripcion(rs.getString("descripcion"));
        b.setPatente(rs.getInt("patente"));
        b.setDisponible(rs.getBoolean("disponible"));
        b.setKmRecorridosDsdMantenimeinto(rs.getDouble("km_dsd_mantenimiento"));
        b.setKmRecorridosEnViaje(rs.getDouble("km_viaje"));
        TiposBicicleta tipo = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        b.setTipo(tipo);
        bicicletas.add(b);
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
    return bicicletas;
  }

  public Bicicletas getBicicleta(int patente) {    
    PreparedStatement sentencia = null;
    ResultSet rs = null;
    Bicicletas b = null;
    String sql = "select * from bicicletas where patente=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, patente);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        b = new Bicicletas();
        b.setDescripcion(rs.getString("descripcion"));
        b.setPatente(rs.getInt("patente"));
        b.setDisponible(rs.getBoolean("disponible"));
        b.setKmRecorridosDsdMantenimeinto(rs.getDouble("km_dsd_mantenimiento"));
        b.setKmRecorridosEnViaje(rs.getDouble("km_viaje"));
        TiposBicicleta tipo = new CatalogoTiposBicicletas().getTipo(rs.getInt("id_tipo"));
        b.setTipo(tipo);
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return b;
  }

  public void altaBicicleta(Bicicletas b) {
    PreparedStatement sentencia = null;
    String sql = "insert into bicicletas(patente,descripcion,disponible,km_dsd_mantenimiento,km_viaje,id_tipo) "
            + "values(?,?,?,?,?,?)";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1,b.getPatente());
      sentencia.setString(2,b.getDescripcion());
      sentencia.setBoolean(3,b.isDisponible());
      sentencia.setDouble(4,b.getKmRecorridosDsdMantenimeinto());
      sentencia.setDouble(5,b.getKmRecorridosEnViaje());
      sentencia.setInt(6,b.getTipo().getId());
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

  public void bajaBicicleta(Bicicletas b) {
    PreparedStatement sentencia = null;
    String sql = "delete from bicicletas where patente=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, b.getPatente());
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

  public void modificarBicicleta(Bicicletas b) {
    PreparedStatement sentencia = null;
    String sql = "update bicicletas set descripcion=?,disponible=?,km_dsd_mantenimiento=?,km_viaje=?,id_tipo=?"
            + " where patente=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, b.getDescripcion());
      sentencia.setBoolean(2, b.isDisponible());
      sentencia.setDouble(3, b.getKmRecorridosDsdMantenimeinto());
      sentencia.setDouble(4, b.getKmRecorridosEnViaje());
      sentencia.setInt(5, b.getTipo().getId());
      sentencia.setInt(7, b.getPatente());
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
