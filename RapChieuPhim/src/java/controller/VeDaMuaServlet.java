/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DatChoDAO;
import dal.DatVeDAO;
import dal.NgayChieuDAO;
import dal.PhimDAO;
import dal.PhongChieuDAO;
import dal.RapChieuDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import model.DatVe;
import model.Ghe;
import model.LichChieu;
import model.NgayChieu;
import model.NguoiDung;
import model.Phim;
import model.PhongChieu;
import model.RapChieu;
import model.VeDaMua;

public class VeDaMuaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        NguoiDung nd = (NguoiDung)session.getAttribute("account");
        DatVeDAO dao = new DatVeDAO();
        List<DatVe> list = dao.getDatVeByNguoiDung(nd);
        request.setAttribute("dsve", list);
        
        String STT_raw = request.getParameter("STT");
        String ID_raw = request.getParameter("ID");
        int ID;
        try {
            if(ID_raw != null){
                VeDaMua vdm = new VeDaMua();
                ID = Integer.parseInt(ID_raw);
                request.setAttribute("STT", STT_raw);
                for(DatVe i:list){
                    if(i.getID()==ID){
                        LichChieu lichChieu = i.getLichChieu();
                        PhimDAO phimDAO = new PhimDAO();
                        Phim phim = phimDAO.getPhimByID(lichChieu.getPhimId());
                        PhongChieuDAO phongChieuDAO = new PhongChieuDAO();
                        PhongChieu phongChieu = phongChieuDAO.getPhongChieuByID(lichChieu.getPhongId());
                        RapChieuDAO rapChieuDAO = new RapChieuDAO();
                        RapChieu rapChieu = rapChieuDAO.getRapChieuByID(phongChieu.getRapId());
                        NgayChieuDAO ngayChieuDAO = new NgayChieuDAO();
                        NgayChieu ngayChieu = ngayChieuDAO.getNgayChieuByID(lichChieu.getNgayId());

                        String tenPhim = phim.getTenPhim();
                        String tenRap = rapChieu.getTenRap();
                        String tenPhong = phongChieu.getTenPhong();
                        Date tenNgay = ngayChieu.getNgayChieu();
                        Time batDau = lichChieu.getBatDau();
                        Time ketThuc = lichChieu.getKetThuc();

                        DatChoDAO datChoDAO = new DatChoDAO();
                        List<Ghe> list1 = datChoDAO.getDatChoByDatVeId(i.getID());
                        
                        vdm.setTenPhim(tenPhim);
                        vdm.setTenrap(tenRap);
                        vdm.setTenPhong(tenPhong);
                        vdm.setNgayDat(i.getNgay());
                        vdm.setNgayChieu(tenNgay);
                        vdm.setBatdau(batDau);
                        vdm.setKetThuc(ketThuc);
                        vdm.setDsghetrongve(list1);
                        request.setAttribute("vedachon", vdm);
                        break;
                    }
                    
                    
                }
            }
            
        } catch(NumberFormatException e){
            System.out.println(e);
        }
        request.getRequestDispatcher("vedamua.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
