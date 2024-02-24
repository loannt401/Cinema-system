
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.PhongChieu;

public class PhongChieuDAO extends DBContext{
    public PhongChieu getPhongChieuByID(int ID){
        String sql = "select * from PhongChieu where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                PhongChieu p = new PhongChieu(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4));
                return p;
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public List<PhongChieu> getAllPhongChieu(){
        List<PhongChieu> list = new ArrayList<>();
        String sql = "select * from PhongChieu";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                PhongChieu p = new PhongChieu(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<PhongChieu> getAllPhongChieuByRapId(int RapId){
        List<PhongChieu> list = new ArrayList<>();
        String sql = "select * from PhongChieu where RapId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, RapId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                PhongChieu p = new PhongChieu(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
