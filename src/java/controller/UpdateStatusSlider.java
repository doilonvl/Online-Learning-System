/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name="UpdateStatusSlider", urlPatterns={"/updateStatusSlider"})
public class UpdateStatusSlider extends HttpServlet {
   
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String sliderId = request.getParameter("sliderId");
        String status = request.getParameter("status");
        SliderDAO dbSlider = new SliderDAO();
        dbSlider.updateStatusSlider(Integer.parseInt(sliderId), Boolean.parseBoolean(status));
        response.sendRedirect(request.getContextPath()+"/slider");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
