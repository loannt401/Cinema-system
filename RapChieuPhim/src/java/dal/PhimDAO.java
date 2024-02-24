package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import model.Phim;
import model.RapChieu;

public class PhimDAO extends DBContext {

    public List<Phim> getAllPhimChieu(int idx) {
        List<Phim> list = new ArrayList<>();
        String sql = "select * from Phim where NgayKhoiChieu";
        if (idx == 1) {
            sql += " <= ";
        } else {
            sql += " > ";
        }
        Calendar calendar = Calendar.getInstance();
        Date ngayHienTai = new Date(calendar.getTime().getTime());
//        sql += "cast( '" + "2023-04-12" + "' as date)";
        sql += "?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, ngayHienTai);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Phim p = new Phim();
                p.setID(rs.getInt("ID"));
                p.setTenPhim(rs.getString("TenPhim"));
                p.setDichTenPhim(rs.getString("DichTenPhim"));
                p.setHinhAnh(rs.getString("HinhAnh"));
                p.setTheLoai(rs.getString("TheLoai"));
                p.setNsx(rs.getString("Nsx"));
                p.setDaoDien(rs.getString("DaoDien"));
                p.setDienVien(rs.getString("DienVien"));
                p.setQuocGia(rs.getString("QuocGia"));
                p.setNgayKhoiChieu(rs.getDate("NgayKhoiChieu"));
                p.setTrailer(rs.getString("Trailer"));
                p.setNDPhim(rs.getString("NDPhim"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Phim> getSixPhimChieu(int idx) {
        List<Phim> list = new ArrayList<>();
        String sql = "select top 6 * from Phim where NgayKhoiChieu";
        if (idx == 1) {
            sql += " <= ";
        } else {
            sql += " > ";
        }
        Calendar calendar = Calendar.getInstance();
        Date ngayHienTai = new Date(calendar.getTime().getTime());
//        sql += "cast( '" + "2023-04-12" + "' as date)";
        sql +="?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, ngayHienTai);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Phim p = new Phim();
                p.setID(rs.getInt("ID"));
                p.setTenPhim(rs.getString("TenPhim"));
                p.setDichTenPhim(rs.getString("DichTenPhim"));
                p.setHinhAnh(rs.getString("HinhAnh"));
                p.setTheLoai(rs.getString("TheLoai"));
                p.setNsx(rs.getString("Nsx"));
                p.setDaoDien(rs.getString("DaoDien"));
                p.setDienVien(rs.getString("DienVien"));
                p.setQuocGia(rs.getString("QuocGia"));
                p.setNgayKhoiChieu(rs.getDate("NgayKhoiChieu"));
                p.setTrailer(rs.getString("Trailer"));
                p.setNDPhim(rs.getString("NDPhim"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Phim> getAllPhim() {
        List<Phim> list = new ArrayList<>();
        String sql = "select * from Phim";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Phim p = new Phim();
                p.setID(rs.getInt("ID"));
                p.setTenPhim(rs.getString("TenPhim"));
                p.setDichTenPhim(rs.getString("DichTenPhim"));
                p.setHinhAnh(rs.getString("HinhAnh"));
                p.setTheLoai(rs.getString("TheLoai"));
                p.setNsx(rs.getString("Nsx"));
                p.setDaoDien(rs.getString("DaoDien"));
                p.setDienVien(rs.getString("DienVien"));
                p.setQuocGia(rs.getString("QuocGia"));
                p.setNgayKhoiChieu(rs.getDate("NgayKhoiChieu"));
                p.setTrailer(rs.getString("Trailer"));
                p.setNDPhim(rs.getString("NDPhim"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Phim getPhimByID(int ID) {
        String sql = "select * from Phim where ID = " + ID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Phim p = new Phim();
                p.setID(rs.getInt("ID"));
                p.setTenPhim(rs.getString("TenPhim"));
                p.setDichTenPhim(rs.getString("DichTenPhim"));
                p.setHinhAnh(rs.getString("HinhAnh"));
                p.setTheLoai(rs.getString("TheLoai"));
                p.setNsx(rs.getString("Nsx"));
                p.setDaoDien(rs.getString("DaoDien"));
                p.setDienVien(rs.getString("DienVien"));
                p.setQuocGia(rs.getString("QuocGia"));
                p.setNgayKhoiChieu(rs.getDate("NgayKhoiChieu"));
                p.setTrailer(rs.getString("Trailer"));
                p.setNDPhim(rs.getString("NDPhim"));
                return p;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkPhimByTenPhim(String TenPhim) {
        String sql = "select * from Phim where TenPhim=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, TenPhim);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void insertPhim(Phim p) {

        try {
            String sql1 = "select top 1 ID from Phim order by ID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {
                int id = rs1.getInt(1) + 1;
                String sql2 = "insert Phim (ID, TenPhim, DichTenPhim, HinhAnh, "
                        + "TheLoai, Nsx, DaoDien, QuocGia, DienVien, NgayKhoiChieu, NDPhim)"
                        + "values (?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, id);
                st2.setString(2, p.getTenPhim());
                st2.setString(3, p.getDichTenPhim());
                st2.setString(4, p.getHinhAnh());
                st2.setString(5, p.getTheLoai());
                st2.setString(6, p.getNsx());
                st2.setString(7, p.getDaoDien());
                st2.setString(8, p.getQuocGia());
                st2.setString(9, p.getDienVien());
                st2.setDate(10, p.getNgayKhoiChieu());
                st2.setString(11, p.getNDPhim());
                
                st2.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deletePhim(int ID){
        try {
            String sql = "delete from Phim where ID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updatePhim(Phim p){
        String sql = "update Phim set TenPhim=?, DichTenPhim=?, HinhAnh=?, TheLoai=?, "
                + "Nsx=?, QuocGia=?, DienVien=?, DaoDien=?, NgayKhoiChieu=?,"
                + "NDPhim=? where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getTenPhim());
            st.setString(2, p.getDichTenPhim());
            st.setString(3, p.getHinhAnh());
            st.setString(4, p.getTheLoai());
            st.setString(5, p.getNsx());
            st.setString(6, p.getQuocGia());
            st.setString(7, p.getDienVien());
            st.setString(8, p.getDaoDien());
            st.setDate(9, p.getNgayKhoiChieu());
            st.setString(10, p.getNDPhim());
            st.setInt(11, p.getID());
            
            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public List<Phim> getPhimBySeach(String text){
        List<Phim> list = new ArrayList<>();
        String sql = "select * from Phim where TenPhim like '%"+text+"%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, text);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Phim p = new Phim();
                p.setID(rs.getInt("ID"));
                p.setTenPhim(rs.getString("TenPhim"));
                p.setDichTenPhim(rs.getString("DichTenPhim"));
                p.setHinhAnh(rs.getString("HinhAnh"));
                p.setTheLoai(rs.getString("TheLoai"));
                p.setNsx(rs.getString("Nsx"));
                p.setDaoDien(rs.getString("DaoDien"));
                p.setDienVien(rs.getString("DienVien"));
                p.setQuocGia(rs.getString("QuocGia"));
                p.setNgayKhoiChieu(rs.getDate("NgayKhoiChieu"));
                p.setTrailer(rs.getString("Trailer"));
                p.setNDPhim(rs.getString("NDPhim"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public static void main(String[] args) {
        PhimDAO dao = new PhimDAO();
        List<Phim> list = dao.getPhimBySeach("marry");
        for(Phim i : list){
            System.out.println(i.getTenPhim());
        }
    }

}
