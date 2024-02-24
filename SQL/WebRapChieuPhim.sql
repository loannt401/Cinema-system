create database WebRapChieuPhim on primary
(
	name = N'WebRapChieuPhim',
	filename = N'D:\Elearn\WebRapChieuPhim.mdf',
	size = 3072KB,
	maxsize = unlimited,
	filegrowth = 1024KB
)
LOG ON
(
	name = N'WebRapChieuPhim_log', 
	filename = N'D:\Elearn\WebRapChieuPhim_log.ldf',
	size = 1024KB,
	maxsize = 2048GB,
	filegrowth = 10%
)
collate Vietnamese_CI_AS


backup database WebRapChieuPhim 
to disk = N'D:\Elearn\WebRapChieuPhim.bak'
with noformat, noinit, name = N'WebRapChieuPhim-Full Database Backup',
skip, norewind, nounload, stats = 10;

DROP DATABASE WebRapChieuPhim


create table Phim
(
	ID int not null,
	TenPhim nvarchar(255) not null,
	DichTenPhim nvarchar(255) null,
	HinhAnh nvarchar(max) not null,
	TheLoai nvarchar(50) not null,
	Nsx nvarchar(max) null,
	DaoDien nvarchar(50) null,
	DienVien nvarchar(max) null,
	QuocGia nvarchar(50) null,
	NgayKhoiChieu date not null,
	Trailer nvarchar(max) null,
	NDPhim nvarchar(max) null,
	constraint PK_Phim primary key clustered (ID asc)
)

insert Phim (ID, TenPhim, DichTenPhim, HinhAnh, TheLoai, DaoDien, DienVien, QuocGia, NgayKhoiChieu, Trailer, NDPhim)
values
(
	1,
	N'MARRY MY DEAD BODY',
	N'CHUYỆN TÔI VÀ MA QUỶ THÀNH NGƯỜI NHÀ',
	N'MarryMyDeadBody.jpg',
	N'Hành động, Hài',
	N'Cheng Wei Hao',
	N' Lâm Bách Hồng, Hứa Quang Hán',
	N'Đài Loan',
	cast('2023-04-07' as date),
	N'https://youtu.be/zxk_YEa2Ky0',
	N'Ming-Han là một cảnh sát nhiệt huyết. Một ngày nọ, trong quá trình truy bắt tội phạm cùng người đồng nghiệp xinh đẹp Zi-Qing, Ming-Han vô tình nhặt được một phong bao màu đỏ, và một nhóm người bất ngờ nhảy ra gọi anh là "con rể". Họ yêu cầu anh ta kết hôn với đứa con đã chết của họ. Ming-Han không thể chấp nhận quyết định này. Tuy nhiên, anh ấy sau đó anh ta gặp phải vô số sự cố xui xẻo. Điều đáng sợ hơn nữa là anh ta bắt đầu nhìn thấy người chồng ma Mao-Mao của mình. Vì vậy, Ming-Han đã tìm đến thầy để tìm cách. Để thoát khỏi Mao-Mao, Ming-Han không còn cách nào khác ngoài việc giúp anh ta thực hiện mọi mong muốn của mình. Nếu không, Mao-Mao sẽ theo anh ta mãi mãi.Đồng thời, Mao-Mao cũng đóng vai trò là đối tác của Ming-Han để giúp anh ta điều tra vụ buôn lậu ma túy. Một cuộc hành trình giả tưởng đầy tiếng cười và nước mắt giữa một người đàn ông thẳng thắn và một con ma đồng tính đã bắt đầu.'
);


insert Phim (ID, TenPhim, DichTenPhim, HinhAnh, TheLoai, Nsx, QuocGia, DienVien, DaoDien, NgayKhoiChieu, Trailer, NDPhim)
values
(
	2,
	N'THE SUPER MARIO BROS. MOVIE',
	N'PHIM ANH EM SUPER MARIO',
	N'TheSuperMario.jpg',
	N'Hoạt hình, Phiêu lưu',
	N'Nintendo, Illumination Entertainment, Universal Pictures',
	N'Mỹ, Nhật Bản',
	N'Chris Pratt, Jack Black, Keegan-Michael Key, Anya Taylor-Joy',
	N'Michael Jelenic, Aaron Horvath', 
	cast('2023-04-07' as date),
	N'https://youtu.be/QcinmCfoh8E',
	N'The Super Mario Bros. Movie xoay quanh cuộc phiêu lưu ở thế giới Vương quốc Nấm của anh em thợ sửa ống nước Mario và Luigi. Sau khi tình cờ bước tới vùng đất lạ từ một ống nước, Luigi đã bị chia tách với Mario và rơi vào tay quái vật rùa xấu xa Bowser, hắn đang âm mưu độc chiếm thế giới. Trong lúc cố gắng tìm kiếm người anh em của mình, Mario đã chạm mặt anh bạn nấm Toad và công chúa Peach. Từ đây họ sát cánh bên nhau trên hành trình ngăn chặn thế lực hắc ám.'
);

insert Phim (ID, TenPhim, HinhAnh, TheLoai, DienVien, QuocGia, Nsx, DaoDien, NgayKhoiChieu, Trailer, NDPhim)
values
(
	3,
	N'SIÊU LỪA GẶP SIÊU LẦY',
	N'SieuLuaGapSieuLay.jpg',
	N'Hài',
	N'Mạc Văn Khoa, Anh Tú',
	N'Việt Nam',
	N'89s Group',
	N'Võ Thanh Hòa',
	cast('2023-03-01' as date),
	N'https://youtu.be/NIVa1CCdFv4',
	N'Thuộc phong cách hành động – hài hước với các “cú lừa” thông minh và lầy lội đến từ bộ đôi Tú (Anh Tú) và Khoa (Mạc Văn Khoa), Siêu Lừa Gặp Siêu Lầy của đạo diễn Võ Thanh Hòa theo chân của Khoa – tên lừa đảo tầm cỡ “quốc nội” đến đảo ngọc Phú Quốc với mong muốn đổi đời. Tại đây, Khoa gặp Tú – tay lừa đảo “hàng real” và cùng Tú thực hiện các phi vụ từ nhỏ đến lớn. Cứ ngỡ sự ranh mãnh của Tú và sự may mắn trời cho của Khoa sẽ giúp họ trở thành bộ đôi bất khả chiến bại, nào ngờ lại đối mặt với nhiều tình huống dở khóc – dở cười. Nhất là khi băng nhóm của bộ đôi nhanh chóng mở rộng vì sự góp mặt của ông Năm (Nhất Trung) và bé Mã Lai (Ngọc Phước).'
);


insert Phim (ID, TenPhim, DichTenPhim, HinhAnh, TheLoai, Nsx, DaoDien, QuocGia, DienVien, NgayKhoiChieu, Trailer, NDPhim)
values 
(
	4, 
	N'SOULMATE',
	N'TRI KỶ',
	N'SOULMATE.jpg',
	N'Tình cảm, Lãng mạn, Tâm lý',
	N'Climax Studio',
	N'Min Young Keun',
	N'Hàn Quốc',
	N'Jeon So Nee, Kim Da Mi',
	cast ('2023-03-24' as date),
	N'https://youtu.be/K46K_1yTwUg',
	N'Soulmate là câu chuyện về Mi So (Kim Da Mi thủ vai) và Ha Eun (Jeon So Nee thủ vai) trong một mối quan hệ chồng chéo chất chứa những hạnh phúc, nỗi buồn, rung động và cả biệt ly. Từ giây phút đầu tiên gặp nhau dưới mái trường tiểu học, giữa hai cô gái đã hình thành một sợi dây liên kết đặc biệt. Và khi Ham Jin Woo (Byun Woo Seok thủ vai) bước vào giữa cả hai, đó cũng là lúc những vết nứt trong mối quan hệ của Mi So và Ha Eun xuất hiện.'
);

insert Phim (ID, TenPhim, DichTenPhim, HinhAnh, TheLoai, Nsx, DaoDien, QuocGia, NgayKhoiChieu, Trailer, NDPhim)
values 
(
	5,
	N'MIGRATION',
	N'NHÀ VỊT DI CƯ',
	N'MIGRATION.jpg',
	N'Hài, Hoạt hình, Phiêu lưu',
	N'Illumination Entertainment, Universal Pictures',
	N'Benjamin Renner',
	N'Mỹ',
	cast ('2023-12-07' as date),
	N'https://youtu.be/SRdCWLCPOrc',
	N'Bộ phim đã hé lộ về chuyến phiêu lưu đầy thú vị và nhiều sắc màu của đàn vịt trời. Đến mùa di cư, những đàn vịt nối đuôi nhau bay lượn vô cùng nhộn nhịp trên bầu trời. Một gia đình vịt nọ được dẫn dắt bởi vịt bố, cũng đã sẵn sàng “cất cánh” cho chuyến bay đến vùng đất mới trong tâm thế đầy hào hứng và vui vẻ. Thành viên phi hành đoàn cũng có độ tuổi rất đa dạng, từ “trẻ nhỏ”, “thiếu niên” cho đến vịt “trung niên”. Đang tự do bay lượn trong làn mây trắng bồng bềnh, nhà vịt đột ngột gặp phải cơn mưa lớn. Tiu ngỉu ôm nhau trú mưa dưới miếng gỗ nho nhỏ, cả nhà bỗng đối mặt với một sinh vật toát ra cảm giác đáng sợ nguy hiểm khó lường.'
);

insert Phim (ID, TenPhim, DichTenPhim, HinhAnh, TheLoai, DaoDien, QuocGia, Nsx, DienVien, NgayKhoiChieu, Trailer, NDPhim)
values
(
	6, 
	N'INDIANA JONES AND THE DIAL OF DESTINY',
	N'INDIANA JONES VÀ VÒNG QUAY ĐỊNH MỆNH',
	N'INDIANA_JONES.jpg',
	N'Hành động, Phiêu lưu',
	N'James Mangold',
	N'Mỹ',
	N'Lucasfilm',
	N'Antonio Banderas, Harrison Ford, Mads Mikkelsen',
	cast ('2023-06-30' as date),
	N'https://youtu.be/GAM3Pj__H-U',
	N'Trong chuyến phiêu lưu cuối cùng này, Indiana Jones cùng con gái nuôi Helena sẽ phải đối đầu với những tên phát xít hiểm ác. Indiana Jones 5 cũng sẽ là phần phim cuối cùng mà Harrison Ford hóa thân thành nhà khảo cổ học Indiana Jones - vai diễn làm nên tên tuổi và gắn liền với ông trong suốt hơn 40 năm.'
);


select * from Phim

select * from Phim where NgayKhoiChieu <= cast('2023-04-12' as date)




create table RapChieu
(
	ID int not null,
	TenRap nvarchar(50) not null,
	DiaChi nvarchar(255) not null,
	constraint PK_RapChieu primary key clustered (ID asc)
)

insert RapChieu (ID, TenRap, DiaChi) values (1, N'NTL Hà Nội', N'Hà Nội');
insert RapChieu (ID, TenRap, DiaChi ) values (2, N'NTL Hồ Chí Minh', N'Hồ Chí Minh');

create table PhongChieu
(
	ID int not null,
	RapId int not null,
	TenPhong nvarchar(50) not null,
	SoLuongGhe int not null,
	constraint PK_PhongChieu primary key clustered (ID asc)
)

insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (1, 1, N'Phòng 1', 70);
insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (2, 1, N'Phòng 2', 70);
insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (3, 1, N'Phòng 3', 70);
insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (4, 1, N'Phòng 4', 70);
insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (5, 1, N'Phòng 5', 70);

insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (6, 2, N'Phòng 1', 70);
insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (7, 2, N'Phòng 2', 70);
insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (8, 2, N'Phòng 3', 70);
insert PhongChieu (ID, RapId, TenPhong, SoLuongGhe) values (9, 2, N'Phòng 4', 70);

create table LichChieu
(
	ID int not null,
	PhimId int not null,
	PhongId int not null,
	NgayChieu date not null,
	BatDau time not null,
	KetThuc time not null,
	constraint PK_LichChieu primary key clustered (ID asc)
)

insert LichChieu (ID, PhimId, PhongId, NgayChieu, BatDau, KetThuc)
values
(
	1,
	1, 
	1, 
	cast ('2023-05-07' as date),
	cast ('08:30:00' as time),
	cast ('10:30:00' as time)
);

insert LichChieu (ID, PhimId, PhongId, NgayChieu, BatDau, KetThuc)
values
(
	2,
	1,
	6,
	cast ('2023-05-07' as date),
	cast ('09:30:00' as time),
	cast ('11:30:00' as time)
);

select * from LichChieu
select * from Phim
select * from PhongChieu
select * from RapChieu

select LichChieu.ID, LichChieu.PhimId, LichChieu.PhongId, LichChieu.NgayChieu, LichChieu.BatDau, LichChieu.KetThuc
from LichChieu, Phim, PhongChieu, RapChieu
where (Phim.ID = LichChieu.PhimId) and (RapChieu.ID = PhongChieu.RapId) and (PhongChieu.ID = LichChieu.PhongId) and (Phim.ID = 1) and (RapChieu.ID = 2);

select * from Phim where ID = 1;

alter table LichChieu
add constraint FK_LichChieu_PhimId
foreign key (PhimId)
references Phim(ID);

alter table LichChieu
add constraint FK_LichChieu_PhongId
foreign key (PhongId)
references PhongChieu(ID);

alter table PhongChieu
add constraint FK_PhongChieu_RapId
foreign key (RapId)
references RapChieu(ID);

drop table LichChieu;
drop table PhongChieu;
drop table RapChieu;


create table Ghe
(
	ID int not null,
	HangGhe char(2) not null,
	STT int not null,
	PhongId int not null,
	LoaiGheId int not null,
	KTGhe int not null,
	constraint PK_Ghe primary key clustered (ID asc)
)


create table LoaiGhe
(
	ID int not null,
	TenLoai nvarchar(30) not null,
	GiaTien money not null,
	constraint PK_LoaiGhe primary key clustered (ID asc)
)

alter table Ghe
add constraint FK_Ghe_PhongId
foreign key (PhongId)
references PhongChieu(ID)

alter table Ghe
add constraint FK_Ghe_LoaiGheId
foreign key (LoaiGheId)
references LoaiGhe(ID)

create table NguoiDung
(
	ID int not null,
	HoTen nvarchar(50) not null,
	NgaySinh date not null,
	Sdt char(10) not null,
	Email nvarchar(50) not null, 
	MatKhau nvarchar(50) not null,
	LoaiId int not null,
	constraint PK_NguoiDung primary key clustered (ID asc)
)

create table LoaiNguoiDung
(
	ID int not null,
	TenLoai nvarchar(50) not null,
	constraint PK_LoaiNguoiDung primary key clustered (ID asc)
)

alter table NguoiDung
add constraint FK_NguoiDung_LoaiId
foreign key (LoaiId)
references LoaiNguoiDung(ID)

create table DatVe
(
	ID int not null,
	LichChieuId int not null,
	NguoiDungId int not null,
	NgayDat date not null,
	constraint PK_DatVe primary key clustered (ID asc)
)

alter table DatVe
add constraint FK_DatVe_LichChieuId
foreign key (LichChieuId)
references LichChieu(ID)

alter table DatVe
add constraint FK_DatVe_NguoiDungId
foreign key (NguoiDungId)
references NguoiDung(ID)

create table DatCho
(
	ID int not null,
	GheId int not null,
	DatVeId int not null,
	constraint PK_DatCho primary key clustered (ID asc)
)

alter table DatCho
add constraint FK_DatCho_GheId
foreign key (GheId)
references Ghe(ID)

alter table DatCho
add constraint FK_DatCho_DatVeId
foreign key (DatVeId)
references DatVe(ID)
















