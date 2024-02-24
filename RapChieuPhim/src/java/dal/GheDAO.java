
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Ghe;
import model.LoaiGhe;

public class GheDAO extends DBContext{
    public LoaiGhe getLoaiGheByID(int ID){
        String sql = "select * from LoaiGhe where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                LoaiGhe l = new LoaiGhe(rs.getInt(1), rs.getString(2), rs.getInt(3));
                return l;
            }
        } catch (SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public List<Ghe> getAllGheByLichChieuId(int LichChieuId){
        List<Ghe> list = new ArrayList<>();
        String sql = "select distinct Ghe.ID, Ghe.HangGhe, Ghe.STT, Ghe.PhongId, Ghe.LoaiGheId\n"
                + "from Ghe, DatCho, DatVe\n"
                + "where (DatVe.LichChieuId = ?) and (DatVe.ID = DatCho.DatVeId) \n"
                + "and (DatCho.GheId = Ghe.ID) and (DatCho.PhongId = Ghe.PhongId);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, LichChieuId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Ghe g = new Ghe();
                g.setID(rs.getInt(1));
                g.setHangGhe(rs.getString(2));
                g.setSTT(rs.getInt(3));
                g.setPhongId(rs.getInt(4));
                LoaiGhe l = getLoaiGheByID(rs.getInt(5));
                g.setLoaiGhe(l);
                list.add(g);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
    
    public Ghe getGheByID(int GheId, int PhongId){
        String sql = "select * from Ghe where ID=? and PhongId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, GheId);
            st.setInt(2, PhongId);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                Ghe g = new Ghe();
                g.setID(rs.getInt(1));
                g.setHangGhe(rs.getString(2));
                g.setSTT(rs.getInt(3));
                g.setPhongId(rs.getInt(4));
                LoaiGhe l = getLoaiGheByID(rs.getInt(5));
                g.setLoaiGhe(l);
                return g;
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public static void main(String[] args) {

        
    }
}
