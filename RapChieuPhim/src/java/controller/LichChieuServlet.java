
package controller;

import dal.LichChieuDAO;
import dal.NgayChieuDAO;
import dal.PhimDAO;
import dal.RapChieuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.LichChieu;
import model.NgayChieu;
import model.Phim;
import model.RapChieu;

public class LichChieuServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PhimDAO dao = new PhimDAO();
        List<Phim> phim = dao.getAllPhim(); 
        RapChieuDAO dao2 = new RapChieuDAO();
        List<RapChieu> rap = dao2.getAllRapChieu();
        request.setAttribute("phim", phim);
        request.setAttribute("rap", rap);
        request.getRequestDispatcher("lichchieu.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PhimDAO dao = new PhimDAO();
        List<Phim> phim = dao.getAllPhim(); 
        RapChieuDAO dao2 = new RapChieuDAO();
        List<RapChieu> rap = dao2.getAllRapChieu();
        request.setAttribute("phim", phim);
        request.setAttribute("rap", rap);
        
        String PhimId_raw = request.getParameter("phim");
        String RapId_raw = request.getParameter("rap");
        int PhimId, RapId;
        try {
            if(PhimId_raw!=null && RapId_raw!=null){
                PhimId = Integer.parseInt(PhimId_raw);
                RapId = Integer.parseInt(RapId_raw);
                Phim p = dao.getPhimByID(PhimId);
                RapChieu r = dao2.getRapChieuByID(RapId);
                request.setAttribute("p", p.getTenPhim());
                System.out.println(p.getTenPhim());
                request.setAttribute("r", r.getTenRap());
                System.out.println(r.getTenRap());
                LichChieuDAO dao3 = new LichChieuDAO();
                List<LichChieu> lich = dao3.getAllLichChieuByPhimIdAndRapId(PhimId, RapId);
                request.setAttribute("lich", lich);
                for(LichChieu i:lich){
                    System.out.println(i.getBatDau());
                }
                NgayChieuDAO dao4 = new NgayChieuDAO();
                List<NgayChieu> ngay = dao4.getAllNgayChieuByPhimIdAndRapId(PhimId, RapId);
                request.setAttribute("ngay", ngay);
                for(NgayChieu i:ngay){
                    System.out.println(i.getNgayChieu());
                }
            }
            
            
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        request.getRequestDispatcher("lichchieu.jsp").forward(request, response);
    }
    
}
