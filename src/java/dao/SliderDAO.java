/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Slider;

/**
 *
 * @author admin
 */
public class SliderDAO extends DBContext {

    public ArrayList<Slider> findAllSlider() {
        ArrayList<Slider> sliders = new ArrayList<>();
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM slider";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider s = new Slider();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setImage(rs.getString("image"));
                s.setBacklink(rs.getString("backlink"));
                s.setStatus(rs.getBoolean("status"));
                s.setCreated(rs.getTimestamp("created"));
                sliders.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sliders;
    }

    public ArrayList<Slider> findSliderByTitleOrBackLinkAndActive(String title, String status) {
        ArrayList<Slider> sliders = new ArrayList<>();
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [slider] s\n";
            if (title.length() != 0 && status.length() == 0) {
                sql += " WHERE s.title LIKE ? OR s.backlink LIKE ?";
                ps = connection.prepareStatement(sql);
                ps.setString(1, "%" + title + "%");
                System.out.println("%" + title + "%");
                ps.setString(2, "%" + title + "%");
            } else if (title.length() != 0 && status.length() != 0) {
                sql += "WHERE s.title LIKE ? AND s.backlink LIKE ? AND s.status = ?";
                ps = connection.prepareStatement(sql);
                ps.setString(1, "%" + title + "%");
                ps.setString(2, "%" + title + "%");
                ps.setBoolean(3, Boolean.parseBoolean(status));
            } else if (title.length() == 0 && status.length() != 0) {
                sql += "WHERE s.status = ?";
                ps = connection.prepareStatement(sql);
                ps.setBoolean(1, Boolean.parseBoolean(status));
            } else {
                ps = connection.prepareStatement(sql);
            }
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider s = new Slider();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setImage(rs.getString("image"));
                s.setBacklink(rs.getString("backlink"));
                s.setStatus(rs.getBoolean("status"));
                s.setCreated(rs.getTimestamp("created"));
                sliders.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sliders;
    }

    public Slider findById(int id) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [slider] s WHERE id = ?\n";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Slider s = new Slider();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setImage(rs.getString("image"));
                s.setBacklink(rs.getString("backlink"));
                s.setStatus(rs.getBoolean("status"));
                s.setCreated(rs.getTimestamp("created"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateStatusSlider(int id, boolean status) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "UPDATE [slider] \n"
                    + " SET status = ?\n"
                    + " WHERE id = ?";
            ps = connection.prepareStatement(sql);
            ps.setBoolean(1, !status);
            ps.setInt(2, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateSlider(int id, String title, String backlink, boolean status, String image) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "UPDATE [slider] \n"
                    + " SET title = ?,backlink = ?,status = ?,\n"
                    + " image = ?, [modified]=GETDATE()"
                    + " WHERE id = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, backlink);
            ps.setBoolean(3, status);
            ps.setString(4, image);
            ps.setInt(5, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteSlider(int id) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "DELETE FROM [slider] \n"
                    + " WHERE id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
