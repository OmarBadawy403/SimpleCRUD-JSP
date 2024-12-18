package com.omarpackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {

    public static Connection getConnection() throws SQLException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/jspdb";
            conn = DriverManager.getConnection(url, "omar", "omar");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static int save(Student s) {
        int status = 0;
        String query = "INSERT INTO `jspStudent`( `name`, `password`, `email`, `gender`, `country` , `time`) VALUES (?,?,?,?,?, NOW())";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getPassword());
            ps.setString(3, s.getEmail());
            ps.setString(4, s.getGender());
            ps.setString(5, s.getCountry());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int update(Student s) {
        int status = 0;
        String query = "UPDATE `jspStudent` SET `name`=?,`password`=?,`email`=?,`gender`=?,`country`=? WHERE id= ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, s.getName());
            ps.setString(2, s.getPassword());
            ps.setString(3, s.getEmail());
            ps.setString(4, s.getGender());
            ps.setString(5, s.getCountry());
            ps.setInt(6, s.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int delete(Student s) {
        int status = 0;
        String query = "DELETE FROM `jspStudent` WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, s.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static List<Student> getAllRecord() {
        List<Student> list = new ArrayList<>();
        String query = "SELECT * FROM `jspStudent`";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setPassword(rs.getString("password"));
                s.setEmail(rs.getString("email"));
                s.setGender(rs.getString("gender"));
                s.setCountry(rs.getString("country"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Student getRecordById(int id) {
        Student s = null;
        String query = "SELECT * FROM `jspStudent` WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    s = new Student();
                    s.setId(rs.getInt("id"));
                    s.setName(rs.getString("name"));
                    s.setPassword(rs.getString("password"));
                    s.setEmail(rs.getString("email"));
                    s.setGender(rs.getString("gender"));
                    s.setCountry(rs.getString("country"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }
}
