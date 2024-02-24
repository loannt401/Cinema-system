
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.LichChieu;

public class LichChieuDAO extends DBContext{
    public List<LichChieu> getAllLichChieuByPhimIdAndRapId(int PhimId, int RapId){
        List<LichChieu> list = new ArrayList<>();
        String sql = "select LichChieu.ID, LichChieu.PhimId, LichChieu.PhongId, LichChieu.NgayId, LichChieu.BatDau, LichChieu.KetThuc\n"
                + "from LichChieu, Phim, PhongChieu, RapChieu\n"
                + "where (Phim.ID = LichChieu.PhimId) and (RapChieu.ID = PhongChieu.RapId) "
                + "and (PhongChieu.ID = LichChieu.PhongId) and (Phim.ID = ?) and (RapChieu.ID = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, PhimId);
            st.setInt(2, RapId);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                LichChieu l = new LichChieu(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getTime(5), rs.getTime(6));
                list.add(l);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public LichChieu getLichChieuByID(int ID){
        String sql = "select * from LichChieu where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                LichChieu l = new LichChieu(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getTime(5), rs.getTime(6));
                return l;
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public List<LichChieu> getAllLichChieuByPhongIdasc (int RapId){
        List<LichChieu> list = new ArrayList<>();
        String sql = "select LichChieu.ID, LichChieu.PhimId, LichChieu.PhongId, LichChieu.NgayId, LichChieu.BatDau, LichChieu.KetThuc "
                + "from LichChieu, PhongChieu, RapChieu "
                + "where (LichChieu.PhongId = PhongChieu.ID and PhongChieu.RapId = RapChieu.ID "
                + "and RapChieu.ID = ?)"
                + "order by PhongId asc";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, RapId);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                LichChieu l = new LichChieu(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getTime(5), rs.getTime(6));
                list.add(l);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void insertLichChieu(LichChieu lc,String BatDau,String KetThuc){
        String sql = "insert LichChieu (PhimId, PhongId, NgayId, BatDau, KetThuc) values(?,?,?, cast ('"+ BatDau +":00' as time) ,cast ('" + KetThuc + ":00' as time))";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lc.getPhimId());
            st.setInt(2, lc.getPhongId());
            st.setInt(3, lc.getNgayId());
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        LichChieuDAO dao = new LichChieuDAO();
        List<LichChieu> list = dao.getAllLichChieuByPhongIdasc(1);
        for(LichChieu i : list){
            System.out.println(i.getBatDau());
        }
    }
}
