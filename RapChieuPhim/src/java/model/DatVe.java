
package model;

public class DatVe {
    /*
    	ID int identity(1,1) primary key,
	LichChieuId int references LichChieu(ID),
	NguoiDungId int not null,
	LoaiNDId int not null,
	Ngay nvarchar(15) not null,
	TongTien int not null,
	foreign key (NguoiDungId, LoaiNDId) references NguoiDung(ID, LoaiId)
    */
    private int ID;
    private LichChieu lichChieu;
    private NguoiDung nguoiDung;
    private String Ngay;
    private int TongTien;

    public DatVe() {
    }

    public DatVe(int ID, LichChieu lichChieu, NguoiDung nguoiDung, String Ngay, int TongTien) {
        this.ID = ID;
        this.lichChieu = lichChieu;
        this.nguoiDung = nguoiDung;
        this.Ngay = Ngay;
        this.TongTien = TongTien;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public LichChieu getLichChieu() {
        return lichChieu;
    }

    public void setLichChieu(LichChieu lichChieu) {
        this.lichChieu = lichChieu;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public String getNgay() {
        return Ngay;
    }

    public void setNgay(String Ngay) {
        this.Ngay = Ngay;
    }

    public int getTongTien() {
        return TongTien;
    }

    public void setTongTien(int TongTien) {
        this.TongTien = TongTien;
    }
    
}
