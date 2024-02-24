/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DatVeDAO;
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

public class DatVeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        XacNhanVe xacNhanVe = (XacNhanVe)session.getAttribute("thongtinve");
        DatVeDAO dao = new DatVeDAO();
        dao.addDatVe(xacNhanVe.getLichChieu().getID(), xacNhanVe.getNguoiDung(), 
                xacNhanVe.getTongTien(), xacNhanVe.getDsGhe());
        request.setAttribute("xacnhanve", xacNhanVe);
        request.getRequestDispatcher("tbthanhcong.jsp").forward(request, response);
        
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

}
