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
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

/**
 *
 * @author Admin
 */
public class DangKiServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("dangki.jsp").forward(request, response);
    } 
   
    public boolean isEmailVaild(String email){
        boolean isVaild = false;
        try {
            InternetAddress internetAddress = new InternetAddress(email);
            internetAddress.validate();
            isVaild = true;
        } catch(AddressException e){
            System.out.println(e);
        }
        return isVaild;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String ten = request.getParameter("ten");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        
        NguoiDungDAO dao = new NguoiDungDAO();
        if(ten==null || ten=="" || sdt==null || sdt=="" || email==null || email==""
                || password==null || password=="" || password2==null || password2==""){
            request.setAttribute("error", "Thiếu thông tin!");
            request.getRequestDispatcher("dangki.jsp").forward(request, response);
        }
        else if(isEmailVaild(email) == false){
            request.setAttribute("error", "Email không hợp lệ!");
            request.getRequestDispatcher("dangki.jsp").forward(request, response);
        }
        else if(dao.checkNguoiDungByEmail(email)== true){
            request.setAttribute("error", "Email đã tồn tại!");
            request.getRequestDispatcher("dangki.jsp").forward(request, response);
        }
        else if(password.equals(password2)==false){
            request.setAttribute("error", "Mật khẩu không trùng khớp!");
            request.getRequestDispatcher("dangki.jsp").forward(request, response);
        }
        else {
            dao.addKhachHang(ten, sdt, email, password);
            request.setAttribute("success", "Bạn đã đăng kí thành công!");
            request.getRequestDispatcher("dangki.jsp").forward(request, response);
        }
    }

}
