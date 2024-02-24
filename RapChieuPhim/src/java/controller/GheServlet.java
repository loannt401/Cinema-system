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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Ghe;
import model.LichChieu;
import model.Phim;
import model.PhongChieu;

/**
 *
 * @author Admin
 */
public class GheServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String LichChieuId_raw = request.getParameter("LichChieuId");
        int LichChieuId;
        try {
            LichChieuId = Integer.parseInt(LichChieuId_raw);
            LichChieuDAO dao = new LichChieuDAO();
            LichChieu l = dao.getLichChieuByID(LichChieuId);
            request.setAttribute("lich", l);
            PhongChieuDAO dao2 = new PhongChieuDAO();
            PhongChieu p = dao2.getPhongChieuByID(l.getPhongId());
            request.setAttribute("phong", p);
            PhimDAO dao3 = new PhimDAO();
            Phim p2 = dao3.getPhimByID(l.getPhimId());
            request.setAttribute("phim", p2);
            String[] hang = {"A", "B", "C", "D", "E", "G", "H", "I", "J", "K"};
            request.setAttribute("hang", hang);
            GheDAO dao4 = new GheDAO();
            List<Ghe> list = dao4.getAllGheByLichChieuId(LichChieuId);
            request.setAttribute("listghe", list);
            
            HttpSession session = request.getSession();
            List<Ghe> dsghe = null;
 
            session.setAttribute("dsghe", dsghe);
            request.getRequestDispatcher("ghe.jsp").forward(request, response);
        } catch(NumberFormatException e){
            System.out.println(e);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String LichChieuId_raw = request.getParameter("LichChieuId");
        String GheId_raw = request.getParameter("GheId");
        
        HttpSession session = request.getSession(true);
        List<Ghe> ds = null;
        Object o = session.getAttribute("dsghe");
 
        if(o != null){
            ds = (List<Ghe>)o;
        } else {
            ds = new ArrayList<>();
        }
        
        int LichChieuId, GheId;
        try {
            LichChieuId = Integer.parseInt(LichChieuId_raw);
            LichChieuDAO dao = new LichChieuDAO();
            LichChieu l = dao.getLichChieuByID(LichChieuId);
            request.setAttribute("lich", l);
            PhongChieuDAO dao2 = new PhongChieuDAO();
            PhongChieu p = dao2.getPhongChieuByID(l.getPhongId());
            request.setAttribute("phong", p);
            PhimDAO dao3 = new PhimDAO();
            Phim p2 = dao3.getPhimByID(l.getPhimId());
            request.setAttribute("phim", p2);
            String[] hang = {"A", "B", "C", "D", "E", "G", "H", "I", "J", "K"};
            request.setAttribute("hang", hang);
            GheDAO dao4 = new GheDAO();
            List<Ghe> list = dao4.getAllGheByLichChieuId(LichChieuId);
            request.setAttribute("listghe", list);
            
            
            GheId = Integer.parseInt(GheId_raw);
            GheDAO dao5 = new GheDAO();
            Ghe g = dao5.getGheByID(GheId, p.getID());
            
            boolean check = false;
            for(Ghe i:list){
                if(i.getID() == g.getID()){
                    check = true;
                    break;
                }
            }
            for (Ghe i:ds){
                if(i.getID() == g.getID()){
                    check = true;
                    ds.remove(i);
                    break;
                }
            }
            if(check == false){
                ds.add(g);
            }
            
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        int tongtien = 0;
        for(Ghe i:ds){
            tongtien += i.getLoaiGhe().getGiaTien();
        }
        request.setAttribute("tongtien", tongtien);
        session.setAttribute("dsghe", ds);
        request.getRequestDispatcher("ghe.jsp").forward(request, response);
        
    }

}
