
package model;

public class LoaiGhe {
    /*
    ID int not null,
	TenLoai nvarchar(30) not null,
	GiaTien int not null,
    */
    private int ID;
    private String TenLoai;
    private int GiaTien ;

    public LoaiGhe() {
    }

    public LoaiGhe(int ID, String TenLoai, int GiaTien) {
        this.ID = ID;
        this.TenLoai = TenLoai;
        this.GiaTien = GiaTien;
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

    public int getGiaTien() {
        return GiaTien;
    }

    public void setGiaTien(int GiaTien) {
        this.GiaTien = GiaTien;
    }

    
    
}
