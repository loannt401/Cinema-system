
package model;

import java.util.ArrayList;
import java.util.List;

public class XacNhanVe {
    private NguoiDung nguoiDung;
    private LichChieu lichChieu;
    private PhongChieu phongChieu;
    private Phim phim;
    private List<Ghe> dsGhe;
    private int tongTien;

    public XacNhanVe() {
        dsGhe = new ArrayList<>();
    }

    public XacNhanVe(NguoiDung nguoiDung, LichChieu lichChieu, PhongChieu phongChieu, Phim phim, List<Ghe> dsGhe, int tongTien) {
        this.nguoiDung = nguoiDung;
        this.lichChieu = lichChieu;
        this.phongChieu = phongChieu;
        this.phim = phim;
        this.dsGhe = dsGhe;
        this.tongTien = tongTien;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public LichChieu getLichChieu() {
        return lichChieu;
    }

    public void setLichChieu(LichChieu lichChieu) {
        this.lichChieu = lichChieu;
    }

    public PhongChieu getPhongChieu() {
        return phongChieu;
    }

    public void setPhongChieu(PhongChieu phongChieu) {
        this.phongChieu = phongChieu;
    }

    public Phim getPhim() {
        return phim;
    }

    public void setPhim(Phim phim) {
        this.phim = phim;
    }

    public List<Ghe> getDsGhe() {
        return dsGhe;
    }

    public void setDsGhe(List<Ghe> dsGhe) {
        this.dsGhe = dsGhe;
    }

    public int getTongTien() {
        return tongTien;
    }

    public void setTongTien(int tongTien) {
        this.tongTien = tongTien;
    }

    
    
}
