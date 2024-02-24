
package model;

import java.sql.Date;

public class NgayChieu {
    private int ID;
    private Date NgayChieu ;

    public NgayChieu() {
    }

    public NgayChieu(int ID, Date NgayChieu) {
        this.ID = ID;
        this.NgayChieu = NgayChieu;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public Date getNgayChieu() {
        return NgayChieu;
    }

    public void setNgayChieu(Date NgayChieu) {
        this.NgayChieu = NgayChieu;
    }
    
}
