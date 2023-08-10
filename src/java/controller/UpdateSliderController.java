/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import model.Slider;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet(name = "UpdateSliderController", urlPatterns = {"/slider/update"})
public class UpdateSliderController extends HttpServlet {
    
    String FileUpload_Directory = "C:\\Users\\admin\\Downloads\\SWP391_Project\\summer2023-swp391.se1721-g2\\SWP391_Project\\web\\image\\";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        SliderDAO dbSlider = new SliderDAO();
        try {
            Slider slider = dbSlider.findById(Integer.parseInt(id));
            request.setAttribute("slider", slider);
            request.getRequestDispatcher("../sliderUpdate.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/slider");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileName = "";
        try {
            Part filePart = request.getPart("file");
            fileName = filePart.getSubmittedFileName();
            if(!fileName.equals("")){
                for (Part part : request.getParts()) {
                    part.write(FileUpload_Directory + fileName);
                }
            }
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String backlink = request.getParameter("backlink");
        Boolean status = request.getParameter("status").equals("1");
        String old_img = request.getParameter("old_img");
        SliderDAO dbSlider = new SliderDAO();
        dbSlider.updateSlider(Integer.parseInt(id), title, backlink,status,
                fileName.equals("") ? old_img : "image/"+fileName);
       
        response.sendRedirect(request.getContextPath()+"/slider");
        }catch(Exception e){}
    }

}
