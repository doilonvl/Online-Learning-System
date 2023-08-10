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
import model.Course;
import model.Lesson;
import model.LessonTopic;
import model.LessonType;


/**
 *
 * @author 84877
 */
public class LessonDAO extends DBContext {

    public List<Lesson> findAllLessonBySubjectId(int subjectId, int status) {
        try {
            List<Lesson> list = new ArrayList<>();
            PreparedStatement ps;
            ResultSet rs;
            String sql = "select l.id, l.[name],l.[order],\n"
                    + "l.video_link, l.html_content,\n"
                    + "l.subject_id, l.topic_id,\n"
                    + "l.type_id, l.status,\n"
                    + "s.[name] as subject_name,\n"
                    + "t.[name] as topic_name,\n"
                    + "ty.[name] as type_name\n"
                    + "from lesson l left join [course] s\n"
                    + "on l.subject_id = s.course_id\n"
                    + "left join lesson_topic t \n"
                    + "on l.topic_id = t.id\n"
                    + "left join lesson_type ty\n"
                    + "on l.type_id = ty.id\n"
                    + "where (? = -1 or l.subject_id = ?) "
                    + "and (? = -1 or l.status = ? ) "
                    + "order by l.[order], l.[name] ";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, subjectId);
            ps.setInt(2, subjectId);
            ps.setInt(3, status);
            ps.setInt(4, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setId(rs.getInt("id"));
                lesson.setName(rs.getString("name"));
                lesson.setOrder(rs.getInt("order"));
                lesson.setVideoLink(rs.getString("video_link"));
                lesson.setHtmlContent(rs.getString("html_content"));
                lesson.setSubject_id(rs.getInt("subject_id"));
                lesson.setSubject_name(rs.getString("subject_name"));
                lesson.setTopic_id(rs.getInt("topic_id"));
                lesson.setTopic_name(rs.getString("topic_name"));
                lesson.setType_id(rs.getInt("type_id"));
                lesson.setType_name(rs.getString("type_name"));
                lesson.setStatus(rs.getBoolean("status"));
                
                list.add(lesson);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public void addNewLesson(Lesson lesson) {
        try {
            String sql = "insert into lesson(subject_id, topic_id, \n"
                    + "[name], type_id, [order], video_link, html_content,"
                    + "status)\n"
                    + "values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lesson.getSubject_id());
            ps.setInt(2, lesson.getTopic_id());
            ps.setString(3, lesson.getName());
            ps.setInt(4, lesson.getType_id());
            ps.setInt(5, lesson.getOrder());
            ps.setString(6, lesson.getVideoLink());
            ps.setString(7, lesson.getHtmlContent());
            ps.setBoolean(8, lesson.isStatus());
            
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void updateLesson(Lesson lesson) {
        try {
            String sql = "update lesson set subject_id = ?, "
                    + "topic_id = ?, [name] = ?, type_id = ?,"
                    + "[order] = ?, video_link = ?,"
                    + "html_content = ?, status = ? "
                    + "where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lesson.getSubject_id());
            ps.setInt(2, lesson.getTopic_id());
            ps.setString(3, lesson.getName());
            ps.setInt(4, lesson.getType_id());
            ps.setInt(5, lesson.getOrder());
            ps.setString(6, lesson.getVideoLink());
            ps.setString(7, lesson.getHtmlContent());
            ps.setBoolean(8, lesson.isStatus());
            ps.setInt(9, lesson.getId());
            
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void changeStatusLesson(int id) {
        try {
            String sql = "update lesson set status = "
                    + "case when status=1 then 0 "
                    + "else 1 end where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
           
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public List<LessonType> getAllLessonType() {
        try {
            ResultSet rs = null;
            List<LessonType> list = new ArrayList<>();
            String sql = "select * from lesson_type";
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                LessonType type = new LessonType();
                type.setId(rs.getInt(1));
                type.setName(rs.getString(2));
                list.add(type);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public List<LessonTopic> getAllLessonTopic() {
        try {
            ResultSet rs = null;
            List<LessonTopic> list = new ArrayList<>();
            String sql = "select * from lesson_topic";
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                LessonTopic type = new LessonTopic();
                type.setId(rs.getInt(1));
                type.setName(rs.getString(2));
                list.add(type);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        LessonDAO dao = new LessonDAO();
//        dao.changeStatusLesson(5);
        for (Lesson lesson : dao.findAllLessonBySubjectId(2, -1)) {
            System.out.println(lesson);
        }
    }
}
