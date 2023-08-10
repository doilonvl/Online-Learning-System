package controller;

import dao.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet("/verify")
public class VerifyController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String code = req.getParameter("code");
            System.out.println(email);
            UserDBContext userDBContext = new UserDBContext();
            User user = userDBContext.findByEmail(email);
            if (user == null) {
                req.getRequestDispatcher("header.jsp").forward(req, resp);
            } else {
                if (user.getVerification_code().equals(code)) {
                    userDBContext.updateUserVerified(email);
                    req.getRequestDispatcher("home").forward(req, resp);

                }
//                req.getRequestDispatcher("header.jsp").forward(req, resp);
            }

        } catch (SQLException ex) {
            Logger.getLogger(VerifyController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
