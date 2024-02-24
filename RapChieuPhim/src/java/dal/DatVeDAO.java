
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.DatVe;
import model.Ghe;
import model.LichChieu;
import model.NgayChieu;
import model.NguoiDung;
import model.Phim;
import model.PhongChieu;
import model.RapChieu;

public class DatVeDAO extends DBContext{
    public void addDatVe(int LichChieuId, NguoiDung nd, int tongTien, List<Ghe> dsghe){
        String sql = "insert into DatVe (LichChieuId, NguoiDungId, LoaiNDId, Ngay, TongTien) values (?,?, ?,?,?)";
        LocalDate datveDate = java.time.LocalDate.now();
        String date = datveDate.toString();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, LichChieuId);
            st.setInt(2, nd.getID());
            st.setInt(3, nd.getLoaiND().getID());
            st.setString(4, date);
            st.setInt(5, tongTien);
            st.executeUpdate();
            
            String sql1 = "select top 1 ID from DatVe order by ID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs1 = st1.executeQuery();
            if(rs1.next()){
                int DatVeId = rs1.getInt(1);
                for(Ghe i:dsghe){
                    String sql2 = "insert into DatCho(GheId,PhongId,DatVeId,Gia) values (?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, i.getID());
                    st2.setInt(2, i.getPhongId());
                    st2.setInt(3, DatVeId);
                    st2.setInt(4, i.getLoaiGhe().getGiaTien());
                    st2.executeUpdate();
                }
            }
            
            
        } catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public List<DatVe> getDatVeByNguoiDung (NguoiDung nd){
        List<DatVe> list = new ArrayList<>();
        String sql = "select ID, LichChieuId, Ngay, TongTien from DatVe where (NguoiDungId=?) and (LoaiNDId=?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, nd.getID());
            st.setInt(2, nd.getLoaiND().getID());
            ResultSet rs = st.executeQuery();
            int idx = 1;
            while (rs.next()){
                DatVe d = new DatVe();
                d.setID(rs.getInt("ID"));
                LichChieuDAO dao1 = new LichChieuDAO();
                LichChieu l = dao1.getLichChieuByID(rs.getInt("LichChieuId"));
                d.setLichChieu(l);
                d.setNguoiDung(nd);
                d.setNgay(rs.getString("Ngay"));
                d.setTongTien(rs.getInt("TongTien"));
                list.add(d);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        NguoiDungDAO dao = new NguoiDungDAO();
        NguoiDung nd = dao.getNguoiDungByIDAndLoaiId(1, 2);
        DatVeDAO dao2 = new DatVeDAO();
        List<DatVe> list = dao2.getDatVeByNguoiDung(nd);
        for(DatVe i:list){
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
            System.out.println();
        }
    }

}
