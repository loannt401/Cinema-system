
package model;

import java.sql.Date;
import java.sql.Time;

public class LichChieu {
    /*
    ID int identity(1,1) primary key,
	PhimId int references Phim(ID),
	PhongId int references PhongChieu(ID),
	NgayId int references NgayChieu(ID),
	BatDau time not null,
	KetThuc time not null,
    */
    
    private int ID, PhimId, PhongId, NgayId;
    private Time BatDau , KetThuc ;

    public LichChieu() {
    }

    public LichChieu(int ID, int PhimId, int PhongId, int NgayId, Time BatDau, Time KetThuc) {
        this.ID = ID;
        this.PhimId = PhimId;
        this.PhongId = PhongId;
        this.NgayId = NgayId;
        this.BatDau = BatDau;
        this.KetThuc = KetThuc;
    }
    
    

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getPhimId() {
        return PhimId;
    }

    public void setPhimId(int PhimId) {
        this.PhimId = PhimId;
    }

    public int getPhongId() {
        return PhongId;
    }

    public void setPhongId(int PhongId) {
        this.PhongId = PhongId;
    }

    public int getNgayId() {
        return NgayId;
    }

    public void setNgayId(int NgayId) {
        this.NgayId = NgayId;
    }

    public Time getBatDau() {
        return BatDau;
    }

    public void setBatDau(Time BatDau) {
        this.BatDau = BatDau;
    }

    public Time getKetThuc() {
        return KetThuc;
    }

    public void setKetThuc(Time KetThuc) {
        this.KetThuc = KetThuc;
    }

    
    
}
