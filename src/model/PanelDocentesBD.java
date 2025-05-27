package model;

import javax.swing.table.DefaultTableModel;
import java.sql.*;

public class PanelDocentesBD {

    public void cargarDocentes(DefaultTableModel modelo) {
        modelo.setRowCount(0);
        try {
            ConexionDB conexion = new ConexionDB();
            Connection con = conexion.estableceConexion();

            String sql = "SELECT cod_docente, nom_docente FROM docentes";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Object[] fila = {
                    rs.getString("cod_docente"),
                    rs.getString("nom_docente")
                };
                modelo.addRow(fila);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean insertarDocente(String codigo, String nombre) {
        try {
            ConexionDB conexion = new ConexionDB();
            Connection con = conexion.estableceConexion();

            String sql = "INSERT INTO docentes (cod_docente, nom_docente) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, codigo);
            ps.setString(2, nombre);

            int resultado = ps.executeUpdate();

            ps.close();
            con.close();

            return resultado > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}