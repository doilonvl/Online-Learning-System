

package controller;

import dao.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Registrations;
import model.User;


@WebServlet(name="MyRegistrationsController", urlPatterns={"/myRegistrations"})
public class MyRegistrationsController extends HttpServlet {
   
    RegistrationDAO registrationDAO = new RegistrationDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyRegistrationsController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyRegistrationsController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String action = "";
        if(request.getParameter("action")!= null)
            action = request.getParameter("action");
        switch(action){
            case "cancel":
                cancelRegistration(request, response);
                redirectToRegistrationPage(request, response);
                break;
            default:
                redirectToRegistrationPage(request, response);
                break;
        }
        
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    private void redirectToRegistrationPage(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        User u = (User) request.getSession().getAttribute("user");
        List<Registrations> listR = registrationDAO.getAllRegistrations("", null, null, -1, u.getEmail());
        
        request.setAttribute("listR", listR);
        request.getRequestDispatcher("myRegistrations.jsp").forward(request, response);
    
    }

    private void cancelRegistration(HttpServletRequest request, HttpServletResponse response) {
        int rid = Integer.parseInt(request.getParameter("rid"));
        
        registrationDAO.cancelRegistration(rid);
    }
}
