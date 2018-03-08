package Datos;

import Entidades.Bicicletas;
import Entidades.Modelos;
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
        b.setId(rs.getInt("id"));
        b.setDescripcion(rs.getString("descripcion"));
        b.setPatente(rs.getString("patente"));
        b.setDisponible(rs.getBoolean("disponible"));
        b.setKmDsdMantenimiento(rs.getDouble("km_dsd_mantenimiento"));
        b.setKmEnViaje(rs.getDouble("km_viaje"));
        Modelos modelo = new CatalogoModelos().getModelo(rs.getInt("id_modelo"));
        b.setModelo(modelo);
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

  public Bicicletas getBicicleta(int id) {    
    PreparedStatement sentencia;
    ResultSet rs;
    Bicicletas b = null;
    String sql = "select * from bicicletas where id=?";
    
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, id);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        b = new Bicicletas();
        b.setId(rs.getInt("id"));
        b.setDescripcion(rs.getString("descripcion"));
        b.setPatente(rs.getString("patente"));
        b.setDisponible(rs.getBoolean("disponible"));
        b.setKmDsdMantenimiento(rs.getDouble("km_dsd_mantenimiento"));
        b.setKmEnViaje(rs.getDouble("km_viaje"));
        Modelos modelo = new CatalogoModelos().getModelo(rs.getInt("id_modelo"));
        b.setModelo(modelo);
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return b;
  }

  public void altaBicicleta(Bicicletas b) {
    PreparedStatement sentencia = null;
    ResultSet rs;
    String sql = "insert into bicicletas(patente,descripcion,disponible,km_dsd_mantenimiento,km_viaje,id_modelo) "
            + "values(?,?,?,?,?,?)";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
      sentencia.setString(1,b.getPatente());
      sentencia.setString(2,b.getDescripcion());
      sentencia.setBoolean(3,b.isDisponible());
      sentencia.setDouble(4,b.getKmDsdMantenimiento());
      sentencia.setDouble(5,b.getKmEnViaje());
      sentencia.setInt(6,b.getModelo().getId());
      sentencia.execute();
      rs=sentencia.getGeneratedKeys();
      if(rs!=null && rs.next()){
        b.setId(rs.getInt(1));
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

  public void bajaBicicleta(Bicicletas b) {
    PreparedStatement sentencia = null;
    String sql = "delete from bicicletas where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setInt(1, b.getId());
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
    String sql = "update bicicletas set descripcion=?,disponible=?,km_dsd_mantenimiento=?,km_viaje=?, id_modelo=?, patente=?"
            + " where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, b.getDescripcion());
      sentencia.setBoolean(2, b.isDisponible());
      sentencia.setDouble(3, b.getKmDsdMantenimiento());
      sentencia.setDouble(4, b.getKmEnViaje());
      sentencia.setInt(5, b.getModelo().getId());
      sentencia.setString(6, b.getPatente());
      sentencia.setInt(7, b.getId());
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

  public int existeBicicleta(String patente) {
    PreparedStatement sentencia;
    ResultSet rs;
    
    String sql = "select count(*) from bicicletas where patente=?";
    int cont = 0;
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, patente);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        cont = rs.getInt(1);      
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return cont;
  }

  public int existenBicicletasXModelo(String idModelo) {
    PreparedStatement sentencia;
    ResultSet rs;
    
    String sql = "select count(*) from bicicletas where id_modelo=?";
    int cont = 0;
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setString(1, idModelo);
      rs = sentencia.executeQuery();
      
      if (rs.next()) {
        cont = rs.getInt(1);     
      }

    } catch (SQLException sqle) {
      sqle.printStackTrace();
    }
    return cont;
  }

  public ArrayList<Bicicletas> getBicicletasParaMantenimiento() {
    ArrayList<Bicicletas> bicicletas = new ArrayList<>();
    Statement sentencia = null;
    ResultSet rs = null;
    String sql = "select * from bicicletas where disponible=true";
    try {
      sentencia = ConexionBD.getInstancia().getconn().createStatement();
      rs = sentencia.executeQuery(sql);

      while (rs.next()) {
        Bicicletas b = new Bicicletas();
        b.setId(rs.getInt("id"));
        b.setDescripcion(rs.getString("descripcion"));
        b.setPatente(rs.getString("patente"));
        b.setDisponible(rs.getBoolean("disponible"));
        b.setKmDsdMantenimiento(rs.getDouble("km_dsd_mantenimiento"));
        b.setKmEnViaje(rs.getDouble("km_viaje"));
        Modelos modelo = new CatalogoModelos().getModelo(rs.getInt("id_modelo"));
        b.setModelo(modelo);
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

  public void habilitarBicicleta(boolean estado, Bicicletas bici) {
    PreparedStatement sentencia = null;
    String sql = "update bicicletas set disponible=?"
            + " where id=?";
    try {
      sentencia = ConexionBD.getInstancia().getconn().prepareStatement(sql);
      sentencia.setBoolean(1, estado);
      sentencia.setInt(2, bici.getId());
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
