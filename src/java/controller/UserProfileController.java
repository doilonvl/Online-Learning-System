/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.SQLException;
import model.User;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name="UserProfileController", urlPatterns={"/userProfile"})
public class UserProfileController extends HttpServlet {
   
     String FileUpload_Directory = "C:\\Users\\admin\\Downloads\\SWP391_Project\\summer2023-swp391.se1721-g2\\SWP391_Project\\web\\image\\";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserProfileController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        redirectToProfilePage(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String action = "";
        if(request.getParameter("action") != null)
            action = request.getParameter("action");
        switch (action) {
            case "updateInfo":
                updateInfo(request, response);
                break;
            case "updateImage":
                updateImage(request, response);
                redirectToProfilePage(request, response);
                break;
            default:
                redirectToProfilePage(request, response);
                break;
        }
        
    }
    
    private void redirectToProfilePage(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            UserDBContext udbc = new UserDBContext();
            User user = (User) request.getSession().getAttribute("user");
            User u = udbc.findByEmail(user.getEmail());
            request.setAttribute("userProfile", u);
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    private void updateInfo(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        boolean gender = request.getParameter("gender").equals("1");
        String address = request.getParameter("address");
        
        User user = new User();
        user.setAddress(address);
        user.setFull_name(fullname);
        user.setEmail(email);
        user.setGender(gender);
        user.setPhone_number(phone);
        
        try {
            UserDBContext udbc = new UserDBContext();
            udbc.updateProfileUser(user);
            User u = udbc.findByEmail(email);
            request.setAttribute("userProfile", u);
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    

    private void updateImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fileName = "";
        try {
            Part filePart = request.getPart("file");
            fileName = filePart.getSubmittedFileName();
            if(!fileName.equals("")){
                for (Part part : request.getParts()) {
                    part.write(FileUpload_Directory + fileName);
                }
            }
           
            String email = request.getParameter("email");
            String old_img = request.getParameter("old_image");
            String image = fileName.equals("") ? old_img : "./image/"+fileName;
            System.out.println(email+" "+image);
            UserDBContext context = new UserDBContext();
            context.updateImageUser(email, image);
            System.out.println("ok");
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }

    }

}
