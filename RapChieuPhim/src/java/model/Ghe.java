
package model;

public class Ghe {
    /*
    ID int not null,
	HangGhe char(2) not null,
	STT int not null,
	PhongId int references PhongChieu(ID),
	LoaiGheId int references LoaiGhe(ID),
	primary key (ID, PhongId)
    */
    
    private int ID;
    private String HangGhe ;
    private int STT;
    private int PhongId;
    private LoaiGhe loaiGhe;

    public Ghe() {
    }

    public Ghe(int ID, String HangGhe, int STT, int PhongId, LoaiGhe loaiGhe) {
        this.ID = ID;
        this.HangGhe = HangGhe;
        this.STT = STT;
        this.PhongId = PhongId;
        this.loaiGhe = loaiGhe;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getHangGhe() {
        return HangGhe;
    }

    public void setHangGhe(String HangGhe) {
        this.HangGhe = HangGhe;
    }

    public int getSTT() {
        return STT;
    }

    public void setSTT(int STT) {
        this.STT = STT;
    }

    public int getPhongId() {
        return PhongId;
    }

    public void setPhongId(int PhongId) {
        this.PhongId = PhongId;
    }

    public LoaiGhe getLoaiGhe() {
        return loaiGhe;
    }

    public void setLoaiGhe(LoaiGhe loaiGhe) {
        this.loaiGhe = loaiGhe;
    }
    
    
}
