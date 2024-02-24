
package model;

public class LoaiND {
    /*
    	ID int primary key,
	TenLoai nvarchar(50) not null,
    */
    private int ID;
    private String TenLoai ;

    public LoaiND() {
    }

    public LoaiND(int ID, String TenLoai) {
        this.ID = ID;
        this.TenLoai = TenLoai;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTenLoai() {
        return TenLoai;
    }

    public void setTenLoai(String TenLoai) {
        this.TenLoai = TenLoai;
    }
    
}
