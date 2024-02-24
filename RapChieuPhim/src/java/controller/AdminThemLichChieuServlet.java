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
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;
import model.LichChieu;
import model.Phim;
import model.PhongChieu;
import model.RapChieu;

/**
 *
 * @author Admin
 */
public class AdminThemLichChieuServlet extends HttpServlet {

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
            
            PhimDAO pdao = new PhimDAO();
            List<Phim> dsphim = pdao.getAllPhim();
            request.setAttribute("dsphim", dsphim);
            
            PhongChieuDAO pcdao = new PhongChieuDAO();
            List<PhongChieu> dsphong = pcdao.getAllPhongChieuByRapId(ID);
            request.setAttribute("dsphong", dsphong);
            
            request.getRequestDispatcher("admin_themlc.jsp").forward(request, response);
        } catch (NumberFormatException e){
            System.out.println(e);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String PhimId_raw = request.getParameter("PhimId");
        String PhongId_raw = request.getParameter("PhongId");
        String NgayChieu = request.getParameter("NgayChieu");
        
        String BatDau_raw = request.getParameter("BatDau");
        String KetThuc_raw = request.getParameter("KetThuc");
        
//        System.out.println(NgayChieu);
//        System.out.println(BatDau_raw);
        
        int PhimId = Integer.parseInt(PhimId_raw);
        int PhongId = Integer.parseInt(PhongId_raw);
        
        int NgayId;
        NgayChieuDAO ncdao = new NgayChieuDAO();
        if(ncdao.checkNgayChieu(NgayChieu)>0){
            NgayId = ncdao.checkNgayChieu(NgayChieu);
        }
        else {
            NgayId = ncdao.insertNgayChieu(NgayChieu);
        }
        
        
//        System.out.println(BatDau);
//        
        LichChieu lc = new LichChieu();
        lc.setPhimId(PhimId);
        lc.setPhongId(PhongId);
        lc.setNgayId(NgayId);
//        lc.setBatDau(BatDau);
//        lc.setKetThuc(KetThuc);
        
        LichChieuDAO lcdao = new LichChieuDAO();
        lcdao.insertLichChieu(lc, BatDau_raw, KetThuc_raw);
        request.setAttribute("error", "Thêm lịch chiếu thành công!");
        request.getRequestDispatcher("admin_themlc.jsp").forward(request, response);
    }

}
