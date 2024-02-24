
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Ghe;

public class DatChoDAO extends DBContext{
    public List<Ghe> getDatChoByDatVeId(int DatVeId){
        List<Ghe> list = new ArrayList<>();
        String sql = "select * from DatCho where DatVeId=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, DatVeId);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                GheDAO dao = new GheDAO();
                Ghe g = dao.getGheByID(rs.getInt(1), rs.getInt(2));
                list.add(g);
            }
        } catch(SQLException e){
            System.out.println(e);
        }
        return list;
    }
}
