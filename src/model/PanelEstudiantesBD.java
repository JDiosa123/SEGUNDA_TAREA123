package model;

import javax.swing.table.DefaultTableModel;
import java.sql.*;

public class PanelEstudiantesBD {

    public void cargarEstudiantes(DefaultTableModel modelo) {
        modelo.setRowCount(0);

        try {
            ConexionDB conexion = new ConexionDB();
            Connection con = conexion.estableceConexion();

            String sql = "SELECT cod_estudiante, nom_estudiante FROM estudiantes";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Object[] fila = new Object[2];
                fila[0] = rs.getString("cod_estudiante");
                fila[1] = rs.getString("nom_estudiante");
                modelo.addRow(fila);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean insertarEstudiante(String codigo, String nombre) {
        try {
            ConexionDB conexion = new ConexionDB();
            Connection con = conexion.estableceConexion();

            String sql = "INSERT INTO estudiantes(cod_estudiante, nom_estudiante) VALUES (?, ?)";
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