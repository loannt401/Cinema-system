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
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import model.Phim;

/**
 *
 * @author Admin
 */
public class AdminQuanLyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action");
        String ID_raw = request.getParameter("ID");
        int ID;
        PhimDAO phimDAO = new PhimDAO();
        if(action==null||action==""){
            List<Phim> list = phimDAO.getAllPhim();
            request.setAttribute("dsphim", list);
            request.getRequestDispatcher("admin_quanli.jsp").forward(request, response);
        }
        else {
            if((ID_raw==null || ID_raw=="") && (action.equals("them"))){
                request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
            }
            else {
                try {
                    ID = Integer.parseInt(ID_raw);
                    if(action.equals("xem")){
                        Phim p = phimDAO.getPhimByID(ID);
                        request.setAttribute("ctphim", p);
                        request.getRequestDispatcher("qlphim_xem.jsp").forward(request, response);
                    }
                    else if(action.equals("sua")){
                        Phim p = phimDAO.getPhimByID(ID);
                        request.setAttribute("ctphim", p);
                        request.getRequestDispatcher("qlphim_sua.jsp").forward(request, response);
                    }
                    else if(action.equals("xoa")){
                        String realPath = request.getServletContext().getRealPath("/img/img_phim");
                        Phim p = phimDAO.getPhimByID(ID);
                        String newFilePath = realPath + "/" + p.getHinhAnh();
                        File imgFile = new File(newFilePath);
                        
                        if(imgFile.exists()){
                            imgFile.delete();
                        }
                        phimDAO.deletePhim(ID);
                        HttpSession session = request.getSession();
                        session.setAttribute("success", "Xóa phim chiếu thành công!");
                        response.sendRedirect("adminquanli");
                    }
                } catch (NumberFormatException e) {
                    System.out.println(e);
                }
            }
        }
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String seach = request.getParameter("seach");
        PhimDAO dao = new PhimDAO();
        if(seach==null || seach.isEmpty()){
            List<Phim> list = dao.getAllPhim();
            request.setAttribute("dsphim", list);
            request.getRequestDispatcher("admin_quanli.jsp").forward(request, response);
        }
        else {
            List<Phim> list = dao.getPhimBySeach(seach);
            request.setAttribute("dsphim", list);
            request.getRequestDispatcher("admin_quanli.jsp").forward(request, response);
        }
    }

}
