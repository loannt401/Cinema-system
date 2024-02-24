
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.RapChieu;

public class RapChieuDAO extends DBContext{
    public List<RapChieu> getAllRapChieu(){
        List<RapChieu> list = new ArrayList<>();
        String sql = "select * from RapChieu";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                RapChieu r = new RapChieu();
                r.setID(rs.getInt("ID"));
                r.setTenRap(rs.getString("TenRap"));
                r.setDiaChi(rs.getString("DiaChi"));
                r.setHinhAnh(rs.getString("HinhAnh"));
                list.add(r);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public RapChieu getRapChieuByID(int RapId){
            String sql = "select * from RapChieu where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, RapId);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                RapChieu r = new RapChieu();
                r.setID(rs.getInt("ID"));
                r.setTenRap(rs.getString("TenRap"));
                r.setDiaChi(rs.getString("DiaChi"));
                r.setHinhAnh(rs.getString("HinhAnh"));
                return r;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<RapChieu> getAllRapChieuByPhimId(int PhimId){
        List<RapChieu> list = new ArrayList<>();
        String sql = "select distinct RapChieu.ID, RapChieu.TenRap, RapChieu.DiaChi, RapChieu.HinhAnh\n"
                + "from RapChieu, PhongChieu, LichChieu, Phim\n"
                + "where (Phim.ID = LichChieu.PhimId) and (LichChieu.PhongId = PhongChieu.ID)\n"
                + "and (PhongChieu.RapId = RapChieu.ID) and (Phim.ID = 1);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                RapChieu r = new RapChieu();
                r.setID(rs.getInt("ID"));
                r.setTenRap(rs.getString("TenRap"));
                r.setDiaChi(rs.getString("DiaChi"));
                r.setHinhAnh(rs.getString("HinhAnh"));
                list.add(r);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
}
