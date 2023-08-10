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
import model.Price_package;
import model.Registration;
import model.Role;
import model.User;
import utils.EmailUtils;

/**
 *
 * @author admin
 */
public class UserDBContext extends DBContext {

    public void editUserRoleAndStatus(int userId, int role, int status) {
        try {
            String sql = "update [User] set role_id = ?, status = ? where user_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, role);
            ps.setInt(2, status);
            ps.setInt(3, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateImageUser(String email, String image) {
        try {
            String sql = "update [user] set image = ? "
                    + "where email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, image);
            ps.setString(2, email);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<User> filterUserBy(int gender, int role_id, int status) {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number, u.status, r.role_name "
                + "from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name <> 'admin' "
                + "and (? = -1 or u.gender = ?) "
                + "and (? = -1 or u.role_id = ?) "
                + "and (? = -1 or u.status = ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, gender);
            ps.setInt(2, gender);
            ps.setInt(3, role_id);
            ps.setInt(4, role_id);
            ps.setInt(5, status);
            ps.setInt(6, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
            return listC;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public boolean registerUSer(User user, boolean isSendLink) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "INSERT INTO [User] ([full_name]\n"
                    + "      ,[email]\n"
                    + "      ,[password]\n"
                    + "      ,[gender]\n"
                    + "      ,[address]\n"
                    + "      ,[phone_number]\n"
                    + "      ,[verification_code]\n"
                    + "      ,[is_verified]\n"
                    + "      ,[status]\n"
                    + "      ,[role_id]) VALUES (?,?,?,?,?,?,?,?,?,?)";

            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFull_name());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setBoolean(4, user.isGender());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getPhone_number());
            ps.setString(7, user.getVerification_code());
            ps.setBoolean(8, false);
            ps.setBoolean(9, true);
            ps.setInt(10, 1);
            ps.execute();
            String subject = "Please verify your account to Online Learning System ❤";
            String verificationLink = "http://localhost:9999/SWP391_Project/verify?email=" + user.getEmail() + "&code=" + user.getVerification_code();
            String body = "Click this link to verify your account: " + verificationLink + "";
            if (!isSendLink) {
                subject = "";
                body = "Your password in Online Learning System is: " + user.getPassword();
            }
            EmailUtils.sendVerifyEmail(user.getEmail(), subject, body);

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public User findByEmail(String email) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [User] WHERE email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt(1));
                user.setFull_name(rs.getString(2));
                user.setEmail(rs.getString(3));
//            user.setPassword(rs.getString(4));
                user.setGender(rs.getBoolean(5));
                user.setAddress(rs.getString(6));
                user.setPhone_number(rs.getString(7));
                user.setVerification_code(rs.getString(8));
                user.setRole_id(rs.getInt(11));
                user.setImage(rs.getString("image"));
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User LoginUser(String email, String password) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM [User] WHERE email = ? AND password = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt(1));
                user.setFull_name(rs.getString(2));
                user.setEmail(rs.getString(3));
//            user.setPassword(rs.getString(4));
                user.setGender(rs.getBoolean(5));
                user.setAddress(rs.getString(6));
                user.setPhone_number(rs.getString(7));
                user.setVerification_code(rs.getString(8));
                user.setRole_id(rs.getInt(11));
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateUserVerified(String email) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "   UPDATE [User]\n"
                    + "  SET is_verified = 1\n"
                    + "  where email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateUserPassword(String email, String password) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "update [User] set password = ? where email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(2, email);
            ps.setString(1, password);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) {
        try {
            UserDBContext udbc = new UserDBContext();
            List<User> users = udbc.getAllUser();
            List<User> a = udbc.filterUserBy(1, 2, -1);
            User u = new User();
            u.setEmail("quangmanhphung469@gmail.com");
            u.setImage("sadsa");
            udbc.updateImageUser(u.getEmail(), u.getImage());
            System.out.println(udbc.findByEmail("quangmanhphung469@gmail.com").getImage());
//            for (Registration registration : udbc.getUserRegistration(1)) {
//                System.out.println(registration);
//            }
//            for (User user : users) {
//                System.out.println(user.getFull_name());
//            }
//            udbc.updateUserPassword("nguyenthanhsang17102002@gmail.com", "00000000");
        } catch (Exception e) {
        }
    }

    public UserDBContext() throws SQLException {

    }

    public User check(String username, String password) {
        User acc = null;
        try {
            String sql = "select * from [User] where user_name = ? and password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                acc = new User();
                acc.setEmail(rs.getString("username"));
                acc.setPassword(rs.getString("password"));
                return acc;
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        return null;
    }

    public List<User> getAllUser() {
        ResultSet rs = null;

        List<User> users = new ArrayList<>();
        String sql = "select * from [User]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9),
                        rs.getBoolean(10),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return users;
    }

    public void changePass(User a, String newPassword) {
        try {
            String sql = "update [User] set password=? where email=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, a.getEmail());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Registration> getUserRegistration(int user_id) throws SQLException {
        ResultSet rs = null;

        List<Registration> listC = new ArrayList<>();
        String sql = "select u.user_id, c.name, c.image, pp.price, r.created as[Registration time], r.regis_status as[Status],[registration_id],\n"
                + " r.course_id from [User] u join [registration] r\n"
                + "on u.user_id = r.user_id\n"
                + "join [Course] c\n"
                + "on r.course_id = c.course_id\n"
                + "join price_package pp\n"
                + "on r.price_package_id = pp.id\n"
                + "where u.user_id = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                User u = new User();

                u.setUser_id(rs.getInt(1));
                r.setUser_id(u);
                Course c = new Course();
                c.setName(rs.getString(2));
                c.setImage(rs.getString(3));
                c.setCourse_id(rs.getInt("course_id"));
                r.setCourse_id(c);
                Price_package pp = new Price_package();
                pp.setPrice(rs.getDouble(4));
                r.setPrice_package_id(pp);
                r.setCreated(rs.getTimestamp(5));
                r.setRegis_status(rs.getString(6));
                r.setRegistration_id(rs.getInt(7));
                listC.add(r);
                System.out.println(r.getRegis_status());
            }
            return listC;
        } catch (Exception e) {
        }
        return listC;
    }

    public void deleteRegis(int registration_id) {
        try {
            String sql = "delete from registration\n"
                    + "where registration_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, registration_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Registration> searchRCourseByName(int user_id, String searchRCourse) {
        ResultSet rs = null;

        List<Registration> listC = new ArrayList<>();
        String sql = "select u.user_id, c.name, c.image, pp.price, r.created as[Registration time], r.regis_status as[Status],[registration_id], c.brief_infor\n"
                + "                from [User] u join [registration] r\n"
                + "             on u.user_id = r.user_id\n"
                + "                join [Course] c\n"
                + "             on r.course_id = c.course_id\n"
                + "              join price_package pp\n"
                + "              on r.price_package_id = pp.id\n"
                + "            where u.user_id = ? and c.name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(2, "%" + searchRCourse + "%");
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                User u = new User();

                u.setUser_id(rs.getInt(1));
                r.setUser_id(u);
                Course c = new Course();
                c.setName(rs.getString(2));
                c.setImage(rs.getString(3));
                r.setCourse_id(c);
                Price_package pp = new Price_package();
                pp.setPrice(rs.getDouble(4));
                r.setPrice_package_id(pp);
                r.setCreated(rs.getTimestamp(5));
                r.setRegis_status(rs.getString(6));
                r.setRegistration_id(rs.getInt(7));
                c.setBrief_infor(rs.getString(8));
                listC.add(r);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Registration> sortByNewRelease(int user_id) {
        ResultSet rs = null;

        List<Registration> listC = new ArrayList<>();
        String sql = "select u.user_id, c.name, c.image, pp.price, r.created as[Registration time], r.regis_status as[Status],[registration_id], c.brief_infor\n"
                + "                from [User] u join [registration] r\n"
                + "             on u.user_id = r.user_id\n"
                + "                join [Course] c\n"
                + "             on r.course_id = c.course_id\n"
                + "              join price_package pp\n"
                + "              on r.price_package_id = pp.id\n"
                + "            where u.user_id = ?\n"
                + "			order by r.created desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                User u = new User();

                u.setUser_id(rs.getInt(1));
                r.setUser_id(u);
                Course c = new Course();
                c.setName(rs.getString(2));
                c.setImage(rs.getString(3));
                r.setCourse_id(c);
                Price_package pp = new Price_package();
                pp.setPrice(rs.getDouble(4));
                r.setPrice_package_id(pp);
                r.setCreated(rs.getTimestamp(5));
                r.setRegis_status(rs.getString(6));
                r.setRegistration_id(rs.getInt(7));
                c.setBrief_infor(rs.getString(8));
                listC.add(r);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Registration> sortByPriceAsc(int user_id) {
        ResultSet rs = null;

        List<Registration> listC = new ArrayList<>();
        String sql = "select u.user_id, c.name, c.image, pp.price, r.created as[Registration time], r.regis_status as[Status],[registration_id], c.brief_infor\n"
                + "                from [User] u join [registration] r\n"
                + "             on u.user_id = r.user_id\n"
                + "                join [Course] c\n"
                + "             on r.course_id = c.course_id\n"
                + "              join price_package pp\n"
                + "              on r.price_package_id = pp.id\n"
                + "            where u.user_id = ?\n"
                + "			order by pp.price asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                User u = new User();

                u.setUser_id(rs.getInt(1));
                r.setUser_id(u);
                Course c = new Course();
                c.setName(rs.getString(2));
                c.setImage(rs.getString(3));
                r.setCourse_id(c);
                Price_package pp = new Price_package();
                pp.setPrice(rs.getDouble(4));
                r.setPrice_package_id(pp);
                r.setCreated(rs.getTimestamp(5));
                r.setRegis_status(rs.getString(6));
                r.setRegistration_id(rs.getInt(7));
                c.setBrief_infor(rs.getString(8));
                listC.add(r);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Registration> sortByPriceDesc(int user_id) {
        ResultSet rs = null;

        List<Registration> listC = new ArrayList<>();
        String sql = "select u.user_id, c.name, c.image, pp.price, r.created as[Registration time], r.regis_status as[Status],[registration_id], c.brief_infor\n"
                + "                from [User] u join [registration] r\n"
                + "             on u.user_id = r.user_id\n"
                + "                join [Course] c\n"
                + "             on r.course_id = c.course_id\n"
                + "              join price_package pp\n"
                + "              on r.price_package_id = pp.id\n"
                + "            where u.user_id = ?\n"
                + "			order by pp.price desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                User u = new User();

                u.setUser_id(rs.getInt(1));
                r.setUser_id(u);
                Course c = new Course();
                c.setName(rs.getString(2));
                c.setImage(rs.getString(3));
                r.setCourse_id(c);
                Price_package pp = new Price_package();
                pp.setPrice(rs.getDouble(4));
                r.setPrice_package_id(pp);
                r.setCreated(rs.getTimestamp(5));
                r.setRegis_status(rs.getString(6));
                r.setRegistration_id(rs.getInt(7));
                c.setBrief_infor(rs.getString(8));
                listC.add(r);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Registration> getUserRegistrationDone(int user_id) throws SQLException {
        ResultSet rs = null;

        List<Registration> listC = new ArrayList<>();
        String sql = "select u.user_id, c.name, c.image, pp.price, r.created as[Registration time], r.regis_status as[Status],[registration_id], c.brief_infor\n"
                + "from [User] u join [registration] r\n"
                + "on u.user_id = r.user_id\n"
                + "join [Course] c\n"
                + "on r.course_id = c.course_id\n"
                + "join price_package pp\n"
                + "on r.price_package_id = pp.id\n"
                + "where u.user_id = ? and r.regis_status = 'Done'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                User u = new User();

                u.setUser_id(rs.getInt(1));
                r.setUser_id(u);
                Course c = new Course();
                c.setName(rs.getString(2));
                c.setImage(rs.getString(3));
                r.setCourse_id(c);
                Price_package pp = new Price_package();
                pp.setPrice(rs.getDouble(4));
                r.setPrice_package_id(pp);
                r.setCreated(rs.getTimestamp(5));
                r.setRegis_status(rs.getString(6));
                r.setRegistration_id(rs.getInt(7));
                c.setBrief_infor(rs.getString(8));
                listC.add(r);
                System.out.println(r.getRegis_status());
            }
            return listC;
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Registration> getUserRegistrationSubmitted(int user_id) throws SQLException {
        ResultSet rs = null;

        List<Registration> listC = new ArrayList<>();
        String sql = "select u.user_id, c.name, c.image, pp.price, r.created as[Registration time], r.regis_status as[Status],[registration_id], c.brief_infor\n"
                + "from [User] u join [registration] r\n"
                + "on u.user_id = r.user_id\n"
                + "join [Course] c\n"
                + "on r.course_id = c.course_id\n"
                + "join price_package pp\n"
                + "on r.price_package_id = pp.id\n"
                + "where u.user_id = ? and r.regis_status='Submitted'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Registration r = new Registration();
                User u = new User();

                u.setUser_id(rs.getInt(1));
                r.setUser_id(u);
                Course c = new Course();
                c.setName(rs.getString(2));
                c.setImage(rs.getString(3));
                r.setCourse_id(c);
                Price_package pp = new Price_package();
                pp.setPrice(rs.getDouble(4));
                r.setPrice_package_id(pp);
                r.setCreated(rs.getTimestamp(5));
                r.setRegis_status(rs.getString(6));
                r.setRegistration_id(rs.getInt(7));
                c.setBrief_infor(rs.getString(8));
                listC.add(r);
                System.out.println(r.getRegis_status());
            }
            return listC;
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> searchUserByGender(String gender) {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number, u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' and u.gender like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + gender + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> searchUserByRole(String role) {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number, "
                + "u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' and r.role_name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + role + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> searchUserByStatus(String status) {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number, u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' and u.status like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + status + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> searchUserBy(String phone_number, String email, String full_name) {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number, u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' and u.phone_number like ? and u.email like ? and u.full_name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + phone_number + "%");
            ps.setString(2, "%" + email + "%");
            ps.setString(3, "%" + full_name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> sortUserByNameASC() {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number\n"
                + ", u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' \n"
                + "order by u.full_name asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> sortUserByEmailASC() {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number\n"
                + ", u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' \n"
                + "order by u.email asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> sortUserByGenderASC() {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number\n"
                + ", u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' order by u.gender asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> sortUserByPhoneASC() {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number\n"
                + ", u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' \n"
                + "order by u.phone_number asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> sortUserByRoleASC() {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number\n"
                + ", u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin'  order by r.role_name asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> sortUserByStatusASC() {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number\n"
                + ", u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin'  order by u.status asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<User> sortUserByIDASC() {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number\n"
                + ", u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin'  order by u.user_id asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Role> getAllRole() {
        ResultSet rs = null;

        List<Role> listC = new ArrayList<>();
        String sql = "select * from role";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Role(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public User getDetailUser(String uid) {
        String sql = "select u.user_id, u.full_name, u.email, u.gender, u.address, u.phone_number\n"
                + ", u.status, r.role_name, u.image from [User] u join Role r on u.role_id = r.role_id\n"
                + "where u.user_id = " + uid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setFull_name(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone_number(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                u.setAddress(rs.getString(5));
                u.setImage(rs.getString("image"));
                return u;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateProfileUser(User user) {
        try {
            String sql = "update [user] set full_name = ?, gender = ?,"
                    + " address = ?, phone_number = ? "
                    + "where email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFull_name());
            ps.setBoolean(2, user.isGender());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getPhone_number());
            ps.setString(5, user.getEmail());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void insertUser(User user) {
        try {
            String sql = "insert into [User] (email, full_name,"
                    + "password, is_verified, status, role_id) "
                    + "values(?,?,?,1,1,1)";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getFull_name());
            ps.setString(3, user.getPassword());

            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<User> getAllUserByRoleId(int roleId) {
        ResultSet rs = null;

        List<User> users = new ArrayList<>();
        String sql = "select * from [User] where role_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roleId);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getString(8), 
                        rs.getBoolean(9),
                        rs.getBoolean(10),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return users;
    }
}
