/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.Setting;

/**
 *
 * @author admin
 */
public class SettingDAO extends DBContext {

    public List<Setting> getAllSetting() {
        ResultSet rs = null;

        List<Setting> listS = new ArrayList<>();
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], "
                + "s.status from [Setting] s join Role r on s.type = r.role_id\n";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setStatus(rs.getBoolean(6));
                listS.add(s);
            }
        } catch (Exception e) {
        }
        return listS;
    }
    
    public void AddNewSetting(Setting x, int type) {
        String sql = "insert into Setting(setting_name, [type], [value], [order], [description], [status])"
                + " values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, x.getSetting_name());
            ps.setInt(2, type);
            ps.setString(3, x.getValue());
            ps.setInt(4, x.getOrder());
            ps.setString(5, x.getDescription());
            ps.setBoolean(6, x.isStatus());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        SettingDAO sdao = new SettingDAO();
        System.out.println(sdao.getDetailSettingById("1").getSetting_id());
    }

    public List<Setting> searchSettingBy(String value) {
        ResultSet rs = null;

        List<Setting> listS = new ArrayList<>();
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], s.status from [Setting] s join Role r on s.type = r.role_id\n"
                + "where s.value like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,"%"+ value+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setStatus(rs.getBoolean(6));
                listS.add(s);
            }
        } catch (Exception e) {
        }
        return listS;
    }
    
    public List<Setting> filterSettingBy(int type, int status) {
        ResultSet rs = null;

        List<Setting> listS = new ArrayList<>();
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], s.status from [Setting] s join Role r on s.type = r.role_id\n"
                + "where (? = -1 or s.type = ?)"
                + " and (? = -1 or s.status = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, type);
            ps.setInt(2, type);
            ps.setInt(3, status);
            ps.setInt(4, status);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setStatus(rs.getBoolean(6));
                listS.add(s);
            }
        } catch (Exception e) {
        }
        return listS;
    }

    public List<Setting> sortSettingListByID() {
        ResultSet rs = null;

        List<Setting> listS = new ArrayList<>();
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], s.status from [Setting] s join Role r on s.type = r.role_id\n"
                + "order by s.setting_id asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setStatus(rs.getBoolean(6));
                listS.add(s);
            }
        } catch (Exception e) {
        }
        return listS;
    }

    public List<Setting> sortSettingListByType() {
        ResultSet rs = null;

        List<Setting> listS = new ArrayList<>();
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], s.status from [Setting] s join Role r on s.type = r.role_id\n"
                + "order by s.type asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setStatus(rs.getBoolean(6));
                listS.add(s);
            }
        } catch (Exception e) {
        }
        return listS;
    }

    public List<Setting> sortSettingListByValue() {
        ResultSet rs = null;

        List<Setting> listS = new ArrayList<>();
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], s.status, r.role_name from [Setting] s join Role r on s.type = r.role_id\n"
                + "order by s.value asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setStatus(rs.getBoolean(6));
//                s.setRole(r);
                listS.add(s);
            }
        } catch (Exception e) {
        }
        return listS;
    }

    public List<Setting> sortSettingListByOrder() {
        ResultSet rs = null;

        List<Setting> listS = new ArrayList<>();
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], s.status from [Setting] s join Role r on s.type = r.role_id\n"
                + "order by s.[order] asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setStatus(rs.getBoolean(6));
                listS.add(s);
            }
        } catch (Exception e) {
        }
        return listS;
    }

    public List<Setting> sortSettingListByStatus() {
        ResultSet rs = null;

        List<Setting> listS = new ArrayList<>();
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], s.status from [Setting] s join Role r on s.type = r.role_id\n"
                + "order by s.status asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setStatus(rs.getBoolean(6));
                listS.add(s);
            }
        } catch (Exception e) {
        }
        return listS;
    }

    public Setting getDetailSetting(String sname) {
        String sql = "select s.setting_name, r.role_name, s.value, s.[order], s.description, s.status\n"
                + " from [Setting] s join Role r on s.type = r.role_id\n"
                + "where s.setting_name = " + sname;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_name(rs.getString(1));
                s.setRole_name(rs.getString(2));
                s.setValue(rs.getString(3));
                s.setOrder(rs.getInt(4));
                s.setDescription(rs.getString(5));
                s.setStatus(rs.getBoolean(6));
                return s;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Setting getDetailSettingById(String sid) {
        String sql = "select s.setting_id, s.setting_name, r.role_name, s.value, s.[order], s.description, s.status\n"
                + " from [Setting] s join Role r on s.type = r.role_id\n"
                + "where s.setting_id = " + sid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                Setting s = new Setting();
                s.setSetting_id(rs.getInt(1));
                s.setSetting_name(rs.getString(2));
                s.setRole_name(rs.getString(3));
                s.setValue(rs.getString(4));
                s.setOrder(rs.getInt(5));
                s.setDescription(rs.getString(6));
                s.setStatus(rs.getBoolean(7));
                return s;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateSetting(Setting x, int type) {
        String sql = "update Setting set [type] = ?, "
                + "[value] = ?, "
                + "[order] = ?, "
                + "description = ?, "
                + "status = ? "
                + "where setting_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, type);
            ps.setString(2, x.getValue());
            ps.setInt(3, x.getOrder());
            ps.setString(4, x.getDescription());
            ps.setBoolean(5, x.isStatus());
            ps.setInt(6, x.getSetting_id());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("update: " + e.getMessage());
        }
    }
}
