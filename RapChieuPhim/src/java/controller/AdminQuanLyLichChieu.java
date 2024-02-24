/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.PhongChieuDAO;
import dal.RapChieuDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.PhongChieu;
import model.RapChieu;
/**
 *
 * @author Admin
 */
public class AdminQuanLyLichChieu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RapChieuDAO dao = new RapChieuDAO();
        List<RapChieu> list = dao.getAllRapChieu();
        request.setAttribute("dsrap", list);
        request.getRequestDispatcher("admin_lichchieu.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    }

}
