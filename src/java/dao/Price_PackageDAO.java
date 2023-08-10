/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.PricePackage;
import model.Price_package;

/**
 *
 * @author admin
 */
public class Price_PackageDAO extends DBContext {

    public List<Price_package> findAll() {
        try {
            List<Price_package> price_packages = new ArrayList<>();
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT [id]\n"
                    + "      ,[duration]\n"
                    + "      ,[price]\n"
                    + "      ,[sale]\n"
                    + "      ,[status]\n"
                    + "  FROM [price_package]";

            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Price_package price_package = new Price_package(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDouble(4), rs.getBoolean(5));
                price_packages.add(price_package);
            }
            return price_packages;

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public PricePackage getPricePackageById(int id) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT [id]\n"
                    + "      ,[duration]\n"
                    + "      ,[price]\n"
                    + "      ,[sale]\n"
                    + "      ,[status]\n"
                    + "      ,[name]\n"
                    + "  FROM [price_package] "
                    + "where id = ?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                PricePackage price_package = new PricePackage(rs.getInt(1), 
                        rs.getInt(2), rs.getDouble(3), rs.getDouble(4), 
                        rs.getBoolean(5), rs.getString(6));
                return(price_package);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public void addNewPricePackage(PricePackage p) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "insert into "
                    + "price_package(duration, price, sale, [status], [name])\n"
                    + "values(?,?,?,?,?)";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, p.getDuration());
            ps.setDouble(2, p.getPrice());
            ps.setDouble(3, p.getSale());
            ps.setBoolean(4, p.isStatus());
            ps.setString(5, p.getName());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void updatePricePackage(PricePackage p) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "update price_package set duration = ?, \n"
                    + "price = ?, sale = ?, status = ?, name = ? \n"
                    + "where id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, p.getDuration());
            ps.setDouble(2, p.getPrice());
            ps.setDouble(3, p.getSale());
            ps.setBoolean(4, p.isStatus());
            ps.setString(5, p.getName());
            ps.setInt(6, p.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public void changeStatusPricePackage(int pid) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "update price_package set status = \n"
                    + "case\n"
                    + "when status=1 then 0\n"
                    + "else  1\n"
                    + "end\n"
                    + "where id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static void main(String[] args) {
        long millis=System.currentTimeMillis();  
        Date fromDate = new Date(millis);
        // Take a date
        LocalDate date = fromDate.toLocalDate();
        // Displaying date
        System.out.println("Date : "+fromDate);
        // Add 2 months to the date
        LocalDate newDate = date.plusMonths(2); 
        Date x = Date.valueOf(newDate);
        System.out.println("New Date : "+x);
    }
}