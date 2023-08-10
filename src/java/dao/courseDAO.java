package dao;

import java.sql.Connection;
import dao.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.CourseCategory;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
public class courseDAO extends DBContext {

    public List<Course> getAllCourse() {
        ResultSet rs = null;

        List<Course> listC = new ArrayList<>();
        String sql = "select * from Course";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(6),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public void addNewCourse(Course c) {
        try {
            String sql = "insert into Course(name, cate_id, user_id, status, brief_infor, image, course_date) "
                    + "values(?,?,?,?,?,?,GETDATE())";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setInt(2, c.getCate_id());
            ps.setInt(3, c.getUser_id());
            ps.setBoolean(4, c.isStatus());
            ps.setString(5, c.getBrief_infor());
            ps.setString(6, c.getImage());

            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public List<Course> getAllCourseList() {
        ResultSet rs = null;

        List<Course> cList = new ArrayList<>();
        String sql = "select * from Course";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course c = new Course(rs.getInt(1),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(9),
                        rs.getDate(10)
                );
                cList.add(c);
            }
        } catch (Exception e) {
        }
        return cList;
    }

    public List<Course> searchCourseByName(String searchCourse) {
        ResultSet rs = null;

        List<Course> listC = new ArrayList<>();
        String sql = "select * from Course where [name] like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + searchCourse + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(6),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Course> getListCourses(String search, String cateId, String sortType, String index) {
        int curIndex = Integer.valueOf(index);
        String orderBy = "order by c.[course_id] asc";
        switch (sortType) {
            case "1":
                orderBy = "order by c.[name] asc";
                break;
            case "2":
                orderBy = "order by c.[name] desc";
                break;
            case "3":
                orderBy = "order by c.[course_id] desc";
                break;
        }
        List<Course> listB = new ArrayList<>();
        String sql = "SELECT *  FROM [Course] c \n"
                + "join CategoryCourse cc on c.cate_id = cc.id\n"
                + "join [user] u on c.user_id = u.user_id \n"
                + "where c.[name] like '%" + search + "% ' ";
        if (!cateId.isEmpty()) {
            sql += " and c.cate_id = " + cateId + " ";
        }
        sql += orderBy
                + " OFFSET " + (curIndex - 1) * 9 + " ROWS FETCH NEXT 9  ROWS ONLY";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course b = new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getString(17));
                b.setCateName(rs.getString(13));
                b.setOriginal_priceString(rs.getString(4));
                b.setSale_priceString(rs.getString(5));
                listB.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listB;
    }

    public List<Course> getTop3ListCourses() {
        String orderBy = "order by c.[course_id] desc";

        List<Course> listB = new ArrayList<>();
        String sql = "SELECT TOP (3) * FROM [Course] c \n"
                + "join CategoryCourse cc on c.cate_id = cc.id\n"
                + "join [user] u on c.user_id = u.user_id \n"
                + orderBy;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course b = new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getString(17));
                b.setCateName(rs.getString(13));
                b.setOriginal_priceString(rs.getString(4));
                b.setSale_priceString(rs.getString(5));
                listB.add(b);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public int countCourses(String search, String cateId) {
        String sql = "select count(*)  FROM [Course] c join CategoryCourse cc on c.cate_id = cc.id \n";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<CourseCategory> getBlogCategories() {
        List<CourseCategory> listB = new ArrayList<>();
        String sql = "  select * from CategoryCourse";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CourseCategory b = new CourseCategory(rs.getInt(1),
                        rs.getString(2));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public static void main(String[] args) {
        courseDAO courseDAO = new courseDAO();
        Course c = new Course();
        c.setCourse_id(19);
        c.setName("JSP 2");
        c.setCate_id(1);
        c.setUser_id(9);
        c.setBrief_infor("afdsaf");
        c.setImage("image/ggg.png");
        c.setStatus(true);
        System.out.println(courseDAO.checkUserRegisterCourse(1, 16));
//        courseDAO.updateCourse(c);
//        List<Course> listC = courseDAO.getListCourses("", "", "", "1");
//        for (Course c : listC) {
//            System.out.println(c.getBrief_infor());
//        }
    }

    public Course findByCouseId(int courseId) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM Course WHERE course_id = ?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setCourse_id(rs.getInt(1));
                course.setName(rs.getString(2));
                course.setTitle(rs.getString(3));
                course.setOriginal_price(rs.getDouble(4));
                course.setSale_price(rs.getDouble(5));
                course.setBrief_infor(rs.getString(6));
                course.setImage(rs.getString("image"));
                return course;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Course> getSubjectList(String name, String sortCate, String sortSTT, int index) {
        List<Course> listS = new ArrayList<>();
        String sql = "SELECT [course_id]\n"
                + "         ,c.[name]\n"
                + "          ,cate.[name]\n"
                + "         ,[lessons]\n"
                + "          ,u.[full_name]\n"
                + "         ,c.[status]\n"
                + "     FROM [dbo].[Course] c \n"
                + "	 JOIN CategoryCourse cate ON  c.cate_id = cate.id \n"
                + "	 JOIN [user] u ON  u.user_id = c.user_id\n "
                + "WHERE c.name LIKE ?\n"
                + "AND cate.id LIKE ?\n"
                + "AND c.status LIKE ?\n"
                + "Order by course_id\n"
                + "OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + name + "%");
            pre.setString(2, "%" + sortCate + "%");
            pre.setString(3, "%" + sortSTT + "%");
            pre.setInt(4, ((index - 1) * 8));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Course c = new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getBoolean(6)
                );

                listS.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return listS;
    }

    public int getTotalSubject(String cName) {
        String sql = "select count(*) from Course  c \n"
                + "where c.name LIKE ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + cName + "%");
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }

        return 0;
    }

    public List<CourseCategory> getFilterCate() {
        List<CourseCategory> listCate = new ArrayList<>();
        String sql = "SELECT  * from CategoryCourse";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                CourseCategory cateC = new CourseCategory(
                        rs.getInt(1),
                        rs.getString(2)
                );
                listCate.add(cateC);
            }

        } catch (Exception e) {
        }
        return listCate;
    }

    public boolean checkUserRegisterCourse(int user_id, int courseId) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "select * from registration\n"
                    + "where user_id = ? and course_id = ?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public boolean registerCourse(int courseId, int user_id, int price_packageId) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "INSERT INTO [registration] (course_id,price_package_id,user_id,created) VALUES (?,?,?,?)";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            ps.setInt(2, price_packageId);
            ps.setInt(3, user_id);
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            ps.setTimestamp(4, timestamp);
            ps.executeUpdate();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Course> getHomeCourse() {
        ResultSet rs = null;

        List<Course> listC = new ArrayList<>();
        String sql = "select top 4  * from Course \n"
                + "where year(course_date) >= '2023'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Course(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getDate(10)));
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public void updateCourse(Course c) {
        try {
            String sql = "update Course set name = ?, cate_id = ?, user_id = ?, "
                    + "brief_infor = ?, image = ?, status = ? "
                    + "where course_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setInt(2, c.getCate_id());
            ps.setInt(3, c.getUser_id());
            ps.setString(4, c.getBrief_infor());
            ps.setString(5, c.getImage());
            ps.setBoolean(6, c.isStatus());
            ps.setInt(7, c.getCourse_id());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Course findCourseById(String id) {
        ResultSet rs = null;
        try {
            String sql = "select * from Course where course_id = " + id;
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Course c = new Course();
                c.setCourse_id(rs.getInt("course_id"));
                c.setName(rs.getString("name"));
                c.setBrief_infor(rs.getString("brief_infor"));
                c.setCate_id(rs.getInt("cate_id"));
                c.setUser_id(rs.getInt("user_id"));
                c.setImage(rs.getString("image"));
                c.setStatus(rs.getBoolean("status"));

                return c;
            }

        } catch (Exception e) {
        }
        return null;
    }

}
