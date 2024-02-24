
package model;

import java.sql.Date;

public class Phim { 
    private int ID;
    private String TenPhim, DichTenPhim, HinhAnh, TheLoai, Nsx, DaoDien, DienVien, QuocGia;
    private Date NgayKhoiChieu;
    private String Trailer, NDPhim;

    public Phim() {
    }

    public Phim(int ID, String TenPhim, String DichTenPhim, String HinhAnh, String TheLoai, String Nsx, String DaoDien, String DienVien, String QuocGia, Date NgayKhoiChieu, String Trailer, String NDPhim) {
        this.ID = ID;
        this.TenPhim = TenPhim;
        this.DichTenPhim = DichTenPhim;
        this.HinhAnh = HinhAnh;
        this.TheLoai = TheLoai;
        this.Nsx = Nsx;
        this.DaoDien = DaoDien;
        this.DienVien = DienVien;
        this.QuocGia = QuocGia;
        this.NgayKhoiChieu = NgayKhoiChieu;
        this.Trailer = Trailer;
        this.NDPhim = NDPhim;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTenPhim() {
        return TenPhim;
    }

    public void setTenPhim(String TenPhim) {
        this.TenPhim = TenPhim;
    }

    public String getDichTenPhim() {
        return DichTenPhim;
    }

    public void setDichTenPhim(String DichTenPhim) {
        this.DichTenPhim = DichTenPhim;
    }

    public String getHinhAnh() {
        return HinhAnh;
    }

    public void setHinhAnh(String HinhAnh) {
        this.HinhAnh = HinhAnh;
    }

    public String getTheLoai() {
        return TheLoai;
    }

    public void setTheLoai(String TheLoai) {
        this.TheLoai = TheLoai;
    }

    public String getNsx() {
        return Nsx;
    }

    public void setNsx(String Nsx) {
        this.Nsx = Nsx;
    }

    public String getDaoDien() {
        return DaoDien;
    }

    public void setDaoDien(String DaoDien) {
        this.DaoDien = DaoDien;
    }

    public String getDienVien() {
        return DienVien;
    }

    public void setDienVien(String DienVien) {
        this.DienVien = DienVien;
    }

    public String getQuocGia() {
        return QuocGia;
    }

    public void setQuocGia(String QuocGia) {
        this.QuocGia = QuocGia;
    }

    public Date getNgayKhoiChieu() {
        return NgayKhoiChieu;
    }

    public void setNgayKhoiChieu(Date NgayKhoiChieu) {
        this.NgayKhoiChieu = NgayKhoiChieu;
    }

    public String getTrailer() {
        return Trailer;
    }

    public void setTrailer(String Trailer) {
        this.Trailer = Trailer;
    }

    public String getNDPhim() {
        return NDPhim;
    }

    public void setNDPhim(String NDPhim) {
        this.NDPhim = NDPhim;
    }

    
}
