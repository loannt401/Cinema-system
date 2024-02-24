/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.LichChieuDAO;
import dal.NgayChieuDAO;
import dal.PhimDAO;
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
import model.RapChieu;

/**
 *
 * @author Admin
 */
public class CTPhimServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String ID_raw = request.getParameter("ID");
        int ID;
        try {
            ID = Integer.parseInt(ID_raw);
            PhimDAO dao = new PhimDAO();
            Phim p = dao.getPhimByID(ID);
            request.setAttribute("ctphim", p);
            RapChieuDAO dao2 = new RapChieuDAO();
            List<RapChieu> list = dao2.getAllRapChieuByPhimId(ID);
            request.setAttribute("rap", list);
            request.getRequestDispatcher("ctphim.jsp").forward(request, response);
        } catch (NumberFormatException e){
            System.out.println(e);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String PhimId_raw = request.getParameter("phimId");
        String RapId_raw = request.getParameter("rapId");
        int PhimId, RapId;
        try {
            PhimId = Integer.parseInt(PhimId_raw);
            RapId = Integer.parseInt(RapId_raw);
            LichChieuDAO dao3 = new LichChieuDAO();
            List<LichChieu> list = dao3.getAllLichChieuByPhimIdAndRapId(PhimId, RapId);
            request.setAttribute("lich", list);
            NgayChieuDAO dao4 = new NgayChieuDAO();
            List<NgayChieu> list4 = dao4.getAllNgayChieuByPhimIdAndRapId(PhimId, RapId);
            request.setAttribute("ngay", list4);
            PhimDAO dao5 = new PhimDAO();
            Phim p = dao5.getPhimByID(PhimId);
            request.setAttribute("ctphim", p);
            RapChieuDAO dao6 = new RapChieuDAO();
            List<RapChieu> list6 = dao6.getAllRapChieuByPhimId(PhimId);
            request.setAttribute("rap", list6);
            RapChieu rc = dao6.getRapChieuByID(RapId);
            request.setAttribute("rc", rc.getTenRap());
            request.getRequestDispatcher("ctphim.jsp").forward(request, response);
        } catch (NumberFormatException e){
            System.out.println(e);
        }
    }

}
