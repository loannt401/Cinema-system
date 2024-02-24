
package model;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

public class VeDaMua {
    private String tenrap , tenPhim, tenPhong, ngayDat;
    private Date ngayChieu ;
    private Time batdau , ketThuc ;
    private List<Ghe> dsghetrongve ;

    public VeDaMua() {
    }

    public VeDaMua(String tenrap, String tenPhim, String tenPhong, String ngayDat, Date ngayChieu, Time batdau, Time ketThuc, List<Ghe> dsghetrongve) {
        this.tenrap = tenrap;
        this.tenPhim = tenPhim;
        this.tenPhong = tenPhong;
        this.ngayDat = ngayDat;
        this.ngayChieu = ngayChieu;
        this.batdau = batdau;
        this.ketThuc = ketThuc;
        this.dsghetrongve = dsghetrongve;
    }

    public String getTenrap() {
        return tenrap;
    }

    public void setTenrap(String tenrap) {
        this.tenrap = tenrap;
    }

    public String getTenPhim() {
        return tenPhim;
    }

    public void setTenPhim(String tenPhim) {
        this.tenPhim = tenPhim;
    }

    public String getTenPhong() {
        return tenPhong;
    }

    public void setTenPhong(String tenPhong) {
        this.tenPhong = tenPhong;
    }

    public String getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(String ngayDat) {
        this.ngayDat = ngayDat;
    }

    public Date getNgayChieu() {
        return ngayChieu;
    }

    public void setNgayChieu(Date ngayChieu) {
        this.ngayChieu = ngayChieu;
    }

    public Time getBatdau() {
        return batdau;
    }

    public void setBatdau(Time batdau) {
        this.batdau = batdau;
    }

    public Time getKetThuc() {
        return ketThuc;
    }

    public void setKetThuc(Time ketThuc) {
        this.ketThuc = ketThuc;
    }

    public List<Ghe> getDsghetrongve() {
        return dsghetrongve;
    }

    public void setDsghetrongve(List<Ghe> dsghetrongve) {
        this.dsghetrongve = dsghetrongve;
    }

    
}
