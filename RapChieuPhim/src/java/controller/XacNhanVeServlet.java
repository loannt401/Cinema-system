/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.GheDAO;
import dal.LichChieuDAO;
import dal.PhimDAO;
import dal.PhongChieuDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Ghe;
import model.LichChieu;
import model.NguoiDung;
import model.Phim;
import model.PhongChieu;
import model.XacNhanVe;

/**
 *
 * @author Admin
 */
public class XacNhanVeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        XacNhanVe xacNhanVe = new XacNhanVe();
        String LichChieuId_raw = request.getParameter("LichChieuId");
        String Tongtien_raw = request.getParameter("tongtien");
        int LichChieuId;
        try {
            xacNhanVe.setTongTien(Integer.parseInt(Tongtien_raw));  
            
            LichChieuId = Integer.parseInt(LichChieuId_raw);
            LichChieuDAO dao = new LichChieuDAO();
            LichChieu l = dao.getLichChieuByID(LichChieuId);
            xacNhanVe.setLichChieu(l);  
            
            PhongChieuDAO dao2 = new PhongChieuDAO();
            PhongChieu p = dao2.getPhongChieuByID(l.getPhongId());
            xacNhanVe.setPhongChieu(p); 
            
            PhimDAO dao3 = new PhimDAO();
            Phim p2 = dao3.getPhimByID(l.getPhimId());
            xacNhanVe.setPhim(p2); 
            
            
            HttpSession session = request.getSession();
            if(session.getAttribute("dsghe") == null){
                String[] hang = {"A", "B", "C", "D", "E", "G", "H", "I", "J", "K"};
                request.setAttribute("hang", hang);
                GheDAO dao4 = new GheDAO();
                List<Ghe> list = dao4.getAllGheByLichChieuId(LichChieuId);
                request.setAttribute("listghe", list);
                request.setAttribute("error", "Chưa chọn chỗ ngồi!");
                request.getRequestDispatcher("ghe.jsp").forward(request, response);
            }
            else {
                xacNhanVe.setDsGhe((List<Ghe>)session.getAttribute("dsghe"));
                session.setAttribute("dsghe", null);
                xacNhanVe.setNguoiDung((NguoiDung)session.getAttribute("account"));
                request.setAttribute("xacnhanve", xacNhanVe);
                session.setAttribute("thongtinve", xacNhanVe);
                request.getRequestDispatcher("xacnhanve.jsp").forward(request, response);
            }
        } catch(NumberFormatException e){
            System.out.println(e);
        }
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
