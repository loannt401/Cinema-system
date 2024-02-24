
package model;

public class NguoiDung {
    /*
        ID int not null,
	HoTen nvarchar(50) not null,
	Sdt char(10) not null,
	Email nvarchar(50) not null, 
	MatKhau nvarchar(50) not null,
	LoaiId int references LoaiND(ID),
    */
    private int ID;
    private String HoTen , Sdt, Email, MatKhau;
    private LoaiND loaiND;

    public NguoiDung() {
    }

    public NguoiDung(int ID, String HoTen, String Sdt, String Email, String MatKhau, LoaiND loaiND) {
        this.ID = ID;
        this.HoTen = HoTen;
        this.Sdt = Sdt;
        this.Email = Email;
        this.MatKhau = MatKhau;
        this.loaiND = loaiND;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String HoTen) {
        this.HoTen = HoTen;
    }

    public String getSdt() {
        return Sdt;
    }

    public void setSdt(String Sdt) {
        this.Sdt = Sdt;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getMatKhau() {
        return MatKhau;
    }

    public void setMatKhau(String MatKhau) {
        this.MatKhau = MatKhau;
    }

    public LoaiND getLoaiND() {
        return loaiND;
    }

    public void setLoaiND(LoaiND loaiND) {
        this.loaiND = loaiND;
    }

    
}
