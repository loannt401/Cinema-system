/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.LichChieuDAO;
import dal.NgayChieuDAO;
import dal.PhimDAO;
import dal.PhongChieuDAO;
import dal.RapChieuDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.LichChieu;
import model.NgayChieu;
import model.Phim;
import model.PhongChieu;
import model.RapChieu;

/**
 *
 * @author Admin
 */
public class AdminQuanLyPhongChieu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String ID_raw = request.getParameter("ID");
        int ID;
        try {
            ID = Integer.parseInt(ID_raw);
            RapChieuDAO rcdao = new RapChieuDAO();
            RapChieu rap = rcdao.getRapChieuByID(ID);
            request.setAttribute("rap", rap);
            
            LichChieuDAO lcdao = new LichChieuDAO();
            List<LichChieu> list = lcdao.getAllLichChieuByPhongIdasc(ID);
            request.setAttribute("dslich", list);
            
            PhimDAO pdao = new PhimDAO();
            List<Phim> dsphim = pdao.getAllPhim();
            
            PhongChieuDAO pcdao = new PhongChieuDAO();
            List<PhongChieu> dsphong = pcdao.getAllPhongChieuByRapId(ID);
            
            NgayChieuDAO ncdao = new NgayChieuDAO();
            List<NgayChieu> dsngay = ncdao.getAllNgayChieu();
            
            request.setAttribute("dsphim", dsphim);
            request.setAttribute("dsphong", dsphong);
            request.setAttribute("dsngay", dsngay);
            request.getRequestDispatcher("admin_lichphong.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
