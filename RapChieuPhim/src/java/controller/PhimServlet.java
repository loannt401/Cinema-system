/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.PhimDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Phim;

/**
 *
 * @author Admin
 */
public class PhimServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PhimDAO dao = new PhimDAO();
         List<Phim> phimdangchieu = dao.getAllPhimChieu(1);
        request.setAttribute("phimdangchieu", phimdangchieu);
        List<Phim> phimsapchieu = dao.getAllPhimChieu(2);
        request.setAttribute("phimsapchieu", phimsapchieu);
        request.getRequestDispatcher("phimchieu.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
