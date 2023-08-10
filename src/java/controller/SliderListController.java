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
import java.util.ArrayList;
import model.Slider;

/**
 *
 * @author admin
 */
@WebServlet(name="SliderListController", urlPatterns={"/slider"})
public class SliderListController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String status_filter = request.getParameter("status_filter");
        String title_search = request.getParameter("title_search");
        if(status_filter == null)status_filter="";
        if(title_search == null) title_search ="";
        SliderDAO dbSlider = new SliderDAO();
        ArrayList<Slider> sliders = dbSlider.findSliderByTitleOrBackLinkAndActive(title_search, status_filter);
        
        request.setAttribute("sliders", sliders);
        request.getRequestDispatcher("sliderList.jsp").forward(request, response);
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String status_filter = request.getParameter("status_filter");
        String title_search = request.getParameter("title_search");
        if(status_filter == null)status_filter="";
        if(title_search == null) title_search ="";
        SliderDAO dbSlider = new SliderDAO();
        ArrayList<Slider> sliders = dbSlider.findSliderByTitleOrBackLinkAndActive(title_search, status_filter);
        
        request.setAttribute("sliders", sliders);
        request.getRequestDispatcher("sliderList.jsp").forward(request, response);
    } 

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

    
   
}
