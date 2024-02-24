
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.LoaiND;
import model.NguoiDung;

public class NguoiDungDAO extends DBContext{
    public LoaiND getLoaiNDByID(int ID){
        String sql = "select * from LoaiND where ID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                LoaiND l = new LoaiND(rs.getInt(1), rs.getString(2));
                return l;
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public NguoiDung getNguoiDungByIDAndLoaiId(int ID, int LoaiId){
        String sql = "select * from NguoiDung where ID=? and LoaiId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.setInt(2, LoaiId);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                NguoiDung n = new NguoiDung();
                n.setID(rs.getInt(1));
                n.setHoTen(rs.getString(2));
                n.setSdt(rs.getString(3));
                n.setEmail(rs.getString(4));
                n.setMatKhau(rs.getString(5));
                LoaiND l = getLoaiNDByID(rs.getInt(6));
                n.setLoaiND(l);
                return n;
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public NguoiDung checkNguoiDung(String email , String password){
        String sql = "select * from NguoiDung where Email=? and MatKhau=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                NguoiDung n = new NguoiDung();
                n.setID(rs.getInt(1));
                n.setHoTen(rs.getString(2));
                n.setSdt(rs.getString(3));
                n.setEmail(rs.getString(4));
                n.setMatKhau(rs.getString(5));
                LoaiND l = getLoaiNDByID(rs.getInt(6));
                n.setLoaiND(l);
                return n;
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public boolean checkNguoiDungByEmail(String email){
        String sql = "select * from NguoiDung where Email=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return false;
    }
    
    public void addKhachHang(String ten , String sdt , String email , String password){
        String sql = "insert into NguoiDung (ID, HoTen, Sdt, Email, MatKhau, LoaiId) values (?,?,?,?,?,?)";
        try {
           String sql2 = "select top 1 ID from NguoiDung where LoaiId=2 order by ID desc";
           PreparedStatement st = connection.prepareStatement(sql2);
           ResultSet rs = st.executeQuery();
           if(rs.next()){
               int ID = rs.getInt(1) + 1;
               PreparedStatement st2 = connection.prepareStatement(sql);
               st2.setInt(1, ID);
               st2.setString(2, ten);
               st2.setString(3, sdt);
               st2.setString(4, email);
               st2.setString(5, password);
               st2.setInt(6, 2);
               st2.executeUpdate();
           }
        } catch(SQLException e){
            System.out.println(e);
        }
    }
}
