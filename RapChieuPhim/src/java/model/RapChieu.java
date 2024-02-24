
package model;

public class RapChieu {
    /*
    	ID int not null,
	TenRap nvarchar(50) not null,
	DiaChi nvarchar(255) not null,
    */
    private int ID;
    private String TenRap , DiaChi, HinhAnh ;

    public RapChieu() {
    }

    public RapChieu(int ID, String TenRap, String DiaChi, String HinhAnh) {
        this.ID = ID;
        this.TenRap = TenRap;
        this.DiaChi = DiaChi;
        this.HinhAnh = HinhAnh;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTenRap() {
        return TenRap;
    }

    public void setTenRap(String TenRap) {
        this.TenRap = TenRap;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }

    public String getHinhAnh() {
        return HinhAnh;
    }

    public void setHinhAnh(String HinhAnh) {
        this.HinhAnh = HinhAnh;
    }

    
}
