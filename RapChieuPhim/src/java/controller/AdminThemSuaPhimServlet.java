/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.PhimDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import model.Phim;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class AdminThemSuaPhimServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String TenPhim = request.getParameter("TenPhim");
        String DichTenPhim = request.getParameter("DichTenPhim");
        String TheLoai = request.getParameter("TheLoai");
        String Nsx = request.getParameter("Nsx");
        String DaoDien = request.getParameter("DaoDien");
        String DienVien = request.getParameter("DienVien");
        String QuocGia = request.getParameter("QuocGia");
        String NgayKhoiChieu = request.getParameter("NgayKhoiChieu");
        
        System.out.println(NgayKhoiChieu);
        System.out.println(TenPhim);
        
        String NDPhim = request.getParameter("NDPhim");
        
        Part part = request.getPart("HinhAnh");
        
        String ID_raw = request.getParameter("ID");
        int ID;
        
        PhimDAO dao = new PhimDAO();    
        
        if(ID_raw == null || ID_raw.isEmpty()){
            if(TenPhim==null || TenPhim.isEmpty()){
                request.setAttribute("error", "Thiếu tên phim!");
                request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
            }
            else if(TheLoai==null || TheLoai.isEmpty()){
                request.setAttribute("error", "Thiếu thể loại!");
                request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
            }
            else if(NgayKhoiChieu==null || NgayKhoiChieu.isEmpty()){
                request.setAttribute("error", "Chưa chọn ngày khởi chiếu!");
                request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
            }
            else if(dao.checkPhimByTenPhim(TenPhim)==true){
                request.setAttribute("error", "Tên phim đã tồn tại!");
                request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
            }
            else {
                if(part!=null && part.getSize()>0){    // anh da tai
                    String realPath = request.getServletContext().getRealPath("/img/img_phim");
                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                    String[] NamePro_1 = TenPhim.split(" ");
                    String imgName = "";
                    for(String i : NamePro_1){
                        imgName += i;
                    }

                    String extension = filename.substring(filename.lastIndexOf("."));
                    String newfilename = imgName + extension;

                    String newFilePath = realPath + "/" + newfilename;
                    Files.copy(part.getInputStream(), Paths.get(newFilePath), StandardCopyOption.REPLACE_EXISTING);
                
                    Phim phim = new Phim();
                    phim.setTenPhim(TenPhim);
                    phim.setDichTenPhim(DichTenPhim);
                    phim.setTheLoai(TheLoai);
                    phim.setNsx(Nsx);
                    phim.setDaoDien(DaoDien);
                    phim.setDienVien(DienVien);
                    phim.setQuocGia(QuocGia);
                    Date ngayChieu = Date.valueOf(NgayKhoiChieu);
                    phim.setNgayKhoiChieu(ngayChieu);
                    
                    phim.setHinhAnh(newfilename);
                    phim.setNDPhim(NDPhim);
                    
                    dao.insertPhim(phim);
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("success", "Thêm phim chiếu thành công!");
                    response.sendRedirect("adminquanli");
                
                }
                else {
                    request.setAttribute("error", "Thiếu hình ảnh!");
                    request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
                }
            }
        } 
        else {
            ID = Integer.parseInt(ID_raw);
            if(TenPhim==null || TenPhim.isEmpty()){
                request.setAttribute("error", "Thiếu tên phim!");
                request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
            }
            else if(TheLoai==null || TheLoai.isEmpty()){
                request.setAttribute("error", "Thiếu thể loại!");
                request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
            }
            else if(NgayKhoiChieu==null || NgayKhoiChieu.isEmpty()){
                request.setAttribute("error", "Chưa chọn ngày khởi chiếu!");
                request.getRequestDispatcher("qlphim_them.jsp").forward(request, response);
            }
            else {
                Phim phim = new Phim();
                phim.setID(ID);
                phim.setTenPhim(TenPhim);
                phim.setDichTenPhim(DichTenPhim);
                phim.setTheLoai(TheLoai);
                phim.setNsx(Nsx);
                phim.setDaoDien(DaoDien);
                phim.setDienVien(DienVien);
                phim.setQuocGia(QuocGia);
                Date ngayChieu = Date.valueOf(NgayKhoiChieu);
                phim.setNgayKhoiChieu(ngayChieu);
                phim.setNDPhim(NDPhim);
                
                System.out.println(DienVien);
                
                Phim p = dao.getPhimByID(ID);
                if(part!=null && part.getSize()>0){
                    String realPath = request.getServletContext().getRealPath("/img/img_phim");
                    String newFilePath_old = realPath + "/" + p.getHinhAnh();
                    File imgFile = new File(newFilePath_old);

                    if(imgFile.exists()){
                        imgFile.delete();
                    }

                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                    String imgName = p.getHinhAnh().substring(0,p.getHinhAnh().lastIndexOf("."));

                    String extension = filename.substring(filename.lastIndexOf("."));
                    String newfilename = imgName + extension;

                    String newFilePath = realPath + "/" + newfilename;
                    Files.copy(part.getInputStream(), Paths.get(newFilePath), StandardCopyOption.REPLACE_EXISTING);
                    phim.setHinhAnh(newfilename);
                }
                else {
                    phim.setHinhAnh(p.getHinhAnh());
                }
                
                dao.updatePhim(phim);
                HttpSession session = request.getSession();
                session.setAttribute("success", "Sửa phim chiếu thành công!");
                response.sendRedirect("adminquanli");
            }
        }
    }

}
