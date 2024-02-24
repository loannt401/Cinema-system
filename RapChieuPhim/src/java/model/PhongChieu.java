
package model;

public class PhongChieu {
    /*
    	ID int not null,
	RapId int not null,
	TenPhong nvarchar(50) not null,
	SoLuongGhe int not null,
    */
    private int ID;
    private int RapId ;
    private String TenPhong ;
    private int SoLuongGhe ;

    public PhongChieu() {
    }

    public PhongChieu(int ID, int RapId, String TenPhong, int SoLuongGhe) {
        this.ID = ID;
        this.RapId = RapId;
        this.TenPhong = TenPhong;
        this.SoLuongGhe = SoLuongGhe;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getRapId() {
        return RapId;
    }

    public void setRapId(int RapId) {
        this.RapId = RapId;
    }

    public String getTenPhong() {
        return TenPhong;
    }

    public void setTenPhong(String TenPhong) {
        this.TenPhong = TenPhong;
    }

    public int getSoLuongGhe() {
        return SoLuongGhe;
    }

    public void setSoLuongGhe(int SoLuongGhe) {
        this.SoLuongGhe = SoLuongGhe;
    }

    
}
