/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.NguoiDungDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class DangNhapServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if(email==null || email=="" || password==null || password==""){
            request.setAttribute("error", "Thiếu thông tin!");
            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
        }
        else {
            NguoiDungDAO dao = new NguoiDungDAO();
            if(dao.checkNguoiDung(email, password) == null){
                request.setAttribute("error", "Sai thông tin!");
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            }
            else {
                HttpSession session = request.getSession();
                session.setAttribute("account", dao.checkNguoiDung(email, password));
                response.sendRedirect("home");
            }
        }
        
    }

}
