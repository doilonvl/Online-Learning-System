/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

/**
 *
 * @author Acer
 */
public class RoleDAO extends MyDAO{
    
     public String getRoleNameByUserId(int id) {
        String roleName = null;
        String statement = "SELECT r.role_name FROM [User] u INNER JOIN [Role] r ON u.role_id = r.role_id WHERE u.user_id = ?";
        try {
            ps = con.prepareStatement(statement);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                roleName = rs.getString("role_name");
            }
            return roleName;
        } catch (Exception e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return roleName;
    }
    
    public Role getRoleById(int id) {
        Role role = new Role();
        String statement = "select * from [role]\n" +
            " where role_id = ?";
        try {
            ps = con.prepareStatement(statement);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                role.setRole_id(rs.getInt(1));
                role.setRole_name(rs.getString(2));
            }
        } catch (Exception e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return role;
    }
    
    public List<Role> getListRoleWithoutAdmin() {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [Role] WHERE role_id <> 5";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            List<Role> list = new ArrayList<>();
            while (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2));
                list.add(role);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Role> getListRole() {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [Role]";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            List<Role> list = new ArrayList<>();
            while (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2));
                list.add(role);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) {
        RoleDAO d = new RoleDAO();
        System.out.println(d.getRoleById(1).getRole_name());
//        for (Role r : d.getListRoleWithoutAdmin()) {
//            System.out.println(r.getRole_id()+" "+r.getRole_name());
//        }
    }
}

