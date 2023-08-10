/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.Dimension;
import model.Subject;
import model.SubjectCategory;

/**
 *
 * @author 84877
 */
public class SubjectDAO extends DBContext {

    public List<Subject> getAllSubjectByCourseId(int courseId) {
        ResultSet rs = null;

        List<Subject> listC = new ArrayList<>();
        String sql = "select s.id, s.illustration, s.name, \n"
                + "s.status, s.description, s.modified,\n"
                + "s.featured,\n"
                + "d.name as dimension_name, \n"
                + "sc.name as category_name,\n"
                + "u.full_name, c.name as course_name \n"
                + "from [subject] s \n"
                + "left join dimension d on d.id = s.dimension_id\n"
                + "left join subject_category sc on sc.id = s.category_id\n"
                + "left join [user] u on u.user_id = s.author_id\n"
                + "left join Course c on c.course_id = s.course_id\n"
                + "where (? = -1 or s.course_id = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            ps.setInt(2, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setIllustration(rs.getString("illustration"));
                subject.setName(rs.getString("name"));
                subject.setStatus(rs.getBoolean("status"));
                subject.setDescription(rs.getString("description"));
                subject.setModified(rs.getDate("modified"));
                subject.setFeatured(rs.getBoolean("featured"));
                
                Dimension dimension = new Dimension();
                dimension.setName(rs.getString("dimension_name"));
                subject.setDimension(dimension);
                
                SubjectCategory category = new SubjectCategory();
                category.setName(rs.getString("category_name"));
                subject.setCategory(category);
                
                subject.setAuthor_name(rs.getString("full_name"));
                subject.setCourse_name(rs.getString("course_name"));
                
                listC.add(subject);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listC;
    }
    
     public List<Subject> getAllSubjectLast7Days() {
        ResultSet rs = null;

        List<Subject> listC = new ArrayList<>();
        String sql = "select s.id, s.illustration, s.name, \n"
                + "s.status, s.description, s.modified,\n"
                + "s.featured,\n"
                + "d.name as dimension_name, \n"
                + "sc.name as category_name,\n"
                + "u.full_name, c.name as course_name \n"
                + "from [subject] s \n"
                + "left join dimension d on d.id = s.dimension_id\n"
                + "left join subject_category sc on sc.id = s.category_id\n"
                + "left join [user] u on u.user_id = s.author_id\n"
                + "left join Course c on c.course_id = s.course_id\n"
                + "where DATEDIFF(DAY,s.modified,GETDATE()) <= 7";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
   
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setIllustration(rs.getString("illustration"));
                subject.setName(rs.getString("name"));
                subject.setStatus(rs.getBoolean("status"));
                subject.setDescription(rs.getString("description"));
                subject.setModified(rs.getDate("modified"));
                subject.setFeatured(rs.getBoolean("featured"));
                
                Dimension dimension = new Dimension();
                dimension.setName(rs.getString("dimension_name"));
                subject.setDimension(dimension);
                
                SubjectCategory category = new SubjectCategory();
                category.setName(rs.getString("category_name"));
                subject.setCategory(category);
                
                subject.setAuthor_name(rs.getString("full_name"));
                subject.setCourse_name(rs.getString("course_name"));
                
                listC.add(subject);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listC;
    }
    
    public List<Subject> getSimpleSubjects(int courseId){
        ResultSet rs = null;
        
        try {
            List<Subject> list = new ArrayList<>();
            String sql = "select id, name from [subject]"
                    + " where (? = -1 or course_id = ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            ps.setInt(2, courseId);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                Subject subject = new Subject();
                subject.setId(rs.getInt(1));
                subject.setName(rs.getString(2));
                list.add(subject);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public void addNewCourse(Subject s) {
        String sql = "insert into Course(name, category_id, author_id,"
                + " description, illustration, status, featured, course_id, modified) "
                + " values(?,?,?,?,?,?,?,?,GETDATE())";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setInt(2, s.getCategory().getId());
            ps.setInt(3, s.getAuthor_id());
            ps.setString(4, s.getDescription());
            ps.setString(5, s.getIllustration());
            ps.setBoolean(6, s.isStatus());
            ps.setBoolean(7, s.isFeatured());
            ps.setInt(8, s.getCourse_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public List<SubjectCategory> getAllSubjecCategorys() {
        ResultSet rs = null;

        List<SubjectCategory> listC = new ArrayList<>();
        String sql = "select * from subject_category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                SubjectCategory category = new SubjectCategory();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                listC.add(category);
            }
            return listC;
        } catch (Exception e) {
        }
        return null;
    }
    
    
    public static void main(String[] args) {
        SubjectDAO dao = new SubjectDAO();
        for (Subject subject : dao.getAllSubjectByCourseId(1)) {
            System.out.println(subject);
        }
    }

}