/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

//import dao.DimensionDAO;
import dao.Price_PackageDAO;
import dao.SubjectDAO;
import dao.UserDBContext;
import dao.courseDAO;
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.CourseCategory;
import model.Dimension;
import model.DimensionType;
import model.PricePackage;
import model.Price_package;
import model.Subject;
import model.SubjectCategory;
import model.User;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name="SubjectController", urlPatterns={"/subjects"})
public class SubjectController extends HttpServlet {
   
    String FileUpload_Directory = "C:\\Users\\admin\\Downloads\\SWP391_Project\\summer2023-swp391.se1721-g2\\SWP391_Project\\web\\image\\";
    courseDAO dao = new courseDAO();
    SubjectDAO subjectDAO = new SubjectDAO();
//    DimensionDAO dimensionDAO = new DimensionDAO();
    Price_PackageDAO price_PackageDAO = new Price_PackageDAO();
    courseDAO cDao = new courseDAO();
    int courseId = -1;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubjectController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String action = request.getParameter("action");
        action = action == null ? "" : action;
        try {
            if(request.getParameter("courseId")!=null)
                courseId = Integer.parseInt(request.getParameter("courseId"));
            UserDBContext udbc = new UserDBContext();
            List<User> listU = udbc.getAllUserByRoleId(4);
            request.setAttribute("list_expert", listU);
        } catch (SQLException ex) {
            Logger.getLogger(SubjectController.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<CourseCategory> listC = cDao.getFilterCate();
        request.setAttribute("list_sc", listC);
        switch (action) {
            case "create":
                request.getRequestDispatcher("AddNewSubject.jsp").forward(request, response);
                break;
            case "update":
                String id = request.getParameter("subjectId");
                request.setAttribute("course", cDao.findCourseById(id));
                request.getRequestDispatcher("EditSubjects.jsp").forward(request, response);
                break;
            case "subjectDetails":
                ViewSubjectDetails(request, response);
                break;
            case "changeStatus":
                changeStatusPackage(request, response);
                ViewSubjectDetails(request, response);
                break;
            default:
                redirectToMainPage(request, response);
                break;
        }
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createNewSubject(request, response);
                break;
            case "update":
                updateSubject(request, response);
                break;
            case "createDimension":
                createDimension(request, response);
                break;
            case "updateDimension":
                updateDimension(request, response);
                break;
            case "createPricePackage":
                createPricePackage(request, response);
                ViewSubjectDetails(request, response);
                break;
            case "updatePricePackage":
                updatePricePackage(request, response);
                ViewSubjectDetails(request, response);
                break;
            default:
                redirectToMainPage(request, response);
                break;
        }
        
    }
    
    private void redirectToMainPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Subject> listS = subjectDAO.getAllSubjectByCourseId(courseId);
        
        request.setAttribute("listS", listS);
        request.getRequestDispatcher("manageSubject.jsp").forward(request, response);
    }

    private void createNewSubject(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fileName = "";
        PrintWriter out = response.getWriter();
        try {
            Part filePart = request.getPart("thumbnail");
            fileName = filePart.getSubmittedFileName();
            if(!fileName.equals("")){
                for (Part part : request.getParts()) {
                    part.write(FileUpload_Directory + fileName);
                }
            }
            String name = request.getParameter("name");
            int cate_id = Integer.parseInt(request.getParameter("category"));
            int user_id = Integer.parseInt(request.getParameter("owner"));
            boolean status = request.getParameter("status").equals("1");
            String description = request.getParameter("description");
//            boolean featured = request.getParameter("featured").equals("on");
            
            Course c = new Course();
            c.setName(name);
            c.setCate_id(cate_id);
            c.setUser_id(user_id);
            c.setStatus(status);
            c.setBrief_infor(description);
            c.setImage("image/"+fileName);
            cDao.addNewCourse(c);
            
//            redirectToMainPage(request, response);
            request.getRequestDispatcher("subject").forward(request, response);
        } catch (Exception e) {
            out.print(e.getMessage());
        }
    }
    
    
    private void ViewSubjectDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Dimension> listD = dimensionDAO.getAllDimensions();
//        List<DimensionType> listT = dimensionDAO.getDimensionTypes();
        List<Price_package> listP = price_PackageDAO.findAll();
        Course course = cDao.findByCouseId(courseId);
        
        request.setAttribute("course", course);
        request.setAttribute("listP", listP);
//        request.setAttribute("listT", listT);
//        request.setAttribute("listD", listD);
        request.getRequestDispatcher("subjectDetails.jsp").forward(request, response);
    }
    
    private void createDimension(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        String description = request.getParameter("description");
        
        Dimension dimension = new Dimension();
        dimension.setName(name);
        dimension.setType(new DimensionType());
        dimension.getType().setId(type);
        dimension.setDescription(description);
        
//        dimensionDAO.addDimension(dimension);
        
        ViewSubjectDetails(request, response);
    }
    
    private void updateDimension(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int type = Integer.parseInt(request.getParameter("type"));
        String description = request.getParameter("description");
        
        Dimension dimension = new Dimension();
        dimension.setId(id);
        dimension.setName(name);
        dimension.setType(new DimensionType());
        dimension.getType().setId(type);
        dimension.setDescription(description);
        
//        dimensionDAO.updateDimension(dimension);
        
        ViewSubjectDetails(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void createPricePackage(HttpServletRequest request, HttpServletResponse response) {
        int duration = Integer.parseInt(request.getParameter("duration"));
        double price = Double.parseDouble(request.getParameter("price"));
        double sale = Double.parseDouble(request.getParameter("sale"));
        boolean status = request.getParameter("status").equals("1");
        String name = request.getParameter("name");

        PricePackage pricePackage = new PricePackage(1, duration, price, sale, status, name);
        price_PackageDAO.addNewPricePackage(pricePackage);

    }

    private void updatePricePackage(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        double price = Double.parseDouble(request.getParameter("price"));
        double sale = Double.parseDouble(request.getParameter("sale"));
        boolean status = request.getParameter("status").equals("1");
        String name = request.getParameter("name");

        PricePackage pricePackage = new PricePackage(id, duration, price, sale, status, name);
        price_PackageDAO.updatePricePackage(pricePackage);
    }

    private void changeStatusPackage(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("pid"));
        price_PackageDAO.changeStatusPricePackage(id);
    }

    private void updateSubject(HttpServletRequest request, HttpServletResponse response) {
        String fileName = "";
//        PrintWriter out = response.getWriter();
        try {
            Part filePart = request.getPart("thumbnail");
            fileName = filePart.getSubmittedFileName();
            if(!fileName.equals("")){
                for (Part part : request.getParts()) {
                    part.write(FileUpload_Directory + fileName);
                }
            }
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int cate_id = Integer.parseInt(request.getParameter("category"));
            int user_id = Integer.parseInt(request.getParameter("owner"));
            boolean status = request.getParameter("status").equals("1");
            String description = request.getParameter("description");
            
            Course c = new Course();
            c.setCourse_id(id);
            c.setName(name);
            c.setCate_id(cate_id);
            c.setUser_id(user_id);
            c.setStatus(status);
            c.setBrief_infor(description);
            c.setImage("image/"+fileName);
            if(fileName.equals(""))
                c.setImage(request.getParameter("old-img"));
            cDao.updateCourse(c);
            
            request.getRequestDispatcher("subject").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}