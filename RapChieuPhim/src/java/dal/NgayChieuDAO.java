
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.NgayChieu;

public class NgayChieuDAO extends DBContext{
    public List<NgayChieu> getAllNgayChieuByPhimIdAndRapId(int PhimId, int RapId){
        List<NgayChieu> list = new ArrayList<>();
        String sql = "select distinct  NgayChieu.ID, NgayChieu.NgayChieu\n"
                + "from LichChieu, Phim, PhongChieu, RapChieu, NgayChieu\n"
                + "where (Phim.ID = LichChieu.PhimId) and (RapChieu.ID = PhongChieu.RapId)\n"
                + "and (PhongChieu.ID = LichChieu.PhongId) and (Phim.ID = ?) and (RapChieu.ID = ?) \n"
                + "and (NgayChieu.ID = LichChieu.NgayId);";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, PhimId);
            st.setInt(2, RapId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                NgayChieu n = new NgayChieu(rs.getInt(1), rs.getDate(2));
                list.add(n);
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public NgayChieu getNgayChieuByID(int ID){
        String sql = "select * from NgayChieu where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                NgayChieu n = new NgayChieu(rs.getInt(1), rs.getDate(2));
                return n;
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public List<NgayChieu> getAllNgayChieu(){
        List<NgayChieu> list = new ArrayList<>();
        String sql = "select * from NgayChieu";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                NgayChieu n = new NgayChieu(rs.getInt(1), rs.getDate(2));
                list.add(n);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int checkNgayChieu(String NgayChieu){
        String sql = "select * from NgayChieu where NgayChieu=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, NgayChieu);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
        
    }
    
    public int insertNgayChieu(String NgayChieu){
        String sql = "insert into NgayChieu values (cast('" + NgayChieu + "' as date))";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            
            String sql2 = "select top 1 ID from NgayChieu order by ID desc";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs2 = st2.executeQuery();
            if(rs2.next()){
                return rs2.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
}
