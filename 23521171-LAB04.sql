-- Tạo bảng KHOA
CREATE TABLE KHOA 
(
	MAKHOA VARCHAR(4),
	TENKHOA VARCHAR(40),
	NGTLAP SMALLDATETIME,
	TRGKHOA CHAR(4)
	CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
)
GO
-- Tạo bảng MONHOC
CREATE TABLE MONHOC
(
	MAMH VARCHAR(10),
	TENMH VARCHAR(40),
	TCLT TINYINT,
	TCTH TINYINT,
	MAKHOA VARCHAR(4),
	CONSTRAINT PK_MONHOC PRIMARY KEY (MAMH),
)
GO
-- Tạo bảng DIEUKIEN
CREATE TABLE DIEUKIEN
(
	MAMH VARCHAR(10),
	MAMH_TRUOC VARCHAR(10),
	CONSTRAINT PK_DIEUKIEN PRIMARY KEY (MAMH, MAMH_TRUOC)
)
GO
-- Tạo bảng GIAOVIEN
CREATE TABLE GIAOVIEN
(
	MAGV CHAR(4),
	HOTEN VARCHAR(40),
	HOCVI VARCHAR(10),
	HOCHAM VARCHAR(10),
	GIOITINH VARCHAR(3),
	NGSINH SMALLDATETIME,
	NGVL SMALLDATETIME,
	HESO NUMERIC(4,2),
	MUCLUONG MONEY,
	MAKHOA VARCHAR(4)
	CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MAGV)
)
GO
-- Tạo bảng HOCVIEN
CREATE TABLE HOCVIEN
(
	MAHV CHAR(5),
	HO VARCHAR(40),
	TEN VARCHAR(10),
	NGSINH SMALLDATETIME,
	GIOITINH VARCHAR(3),
	NOISINH VARCHAR(40),
	MALOP CHAR(3),
	CONSTRAINT PK_HOCVIEN PRIMARY KEY (MAHV)
)
GO
-- Tạo bảng LOP
CREATE TABLE LOP
(
	MALOP CHAR(3),
	TENLOP VARCHAR(40),
	TRGLOP CHAR(5),
	SISO TINYINT,
	MAGVCN CHAR(4)
	CONSTRAINT PK_LOP PRIMARY KEY (MALOP)
)
GO
-- Tạo bảng GIANGDAY
CREATE TABLE GIANGDAY
(
	MALOP CHAR(3),
	MAMH VARCHAR(10),
	MAGV CHAR(4),
	HOCKY TINYINT,
	NAM SMALLINT,
	TUNGAY SMALLDATETIME,
	DENNGAY SMALLDATETIME
	CONSTRAINT PK_GIANGDAY PRIMARY KEY (MALOP, MAMH),
)
GO
-- Tạo bảng KETQUATHI
CREATE TABLE KETQUATHI
(
	MAHV CHAR(5),
	MAMH VARCHAR(10),
	LANTHI TINYINT,
	NGTHI SMALLDATETIME,
	DIEM NUMERIC(4,2),
	KQUA VARCHAR(10)
	CONSTRAINT PK_KETQUATHI PRIMARY KEY (MAHV, MAMH, LANTHI)
)
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP, TRGKHOA)
VALUES 
    ('KHMT', 'Khoa hoc may tinh', '2005-06-07', 'GV01'),
    ('HTTT', 'He thong thong tin', '2005-06-07', 'GV02'),
    ('CNPM', 'Cong nghe phan mem', '2005-06-07', 'GV04'),
    ('MTT', 'Mang va truyen thong', '2005-10-20', 'GV03'),
    ('KTMT', 'Ky thuat may tinh', '2005-12-20', NULL);
INSERT INTO LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN)
VALUES 
    ('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07'),
    ('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09'),
    ('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14');
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA)
VALUES 
    ('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
    ('CTRR', 'Cau truc roi rac', 5, 2, 'KHMT'),
    ('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
    ('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
    ('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
    ('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
    ('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
    ('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
    ('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 3, 1, 'HTTT'),
    ('HDH', 'He dieu hanh', 4, 1, 'KTMT'),
    ('NMCCNPM', 'Nhap mon cong nghe phan mem', 3, 1, 'CNPM'),
    ('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
    ('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');
INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
VALUES 
    ('K11', 'THDC', 'GV07', 1, 2006, '2006-02-01', '2006-12-05'),
    ('K12', 'THDC', 'GV06', 1, 2006, '2006-02-01', '2006-12-05'),
    ('K13', 'THDC', 'GV15', 1, 2006, '2006-02-01', '2006-12-05'),
    ('K11', 'CTRR', 'GV02', 1, 2006, '2006-09-01', '2006-05-17'),
    ('K12', 'CTRR', 'GV02', 1, 2006, '2006-09-01', '2006-05-17'),
    ('K13', 'CTRR', 'GV08', 1, 2006, '2006-09-01', '2006-05-17'),
    ('K11', 'CSDL', 'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
    ('K12', 'CSDL', 'GV09', 2, 2006, '2006-06-01', '2006-07-15'),
    ('K13', 'CTDLGT', 'GV15', 2, 2006, '2006-06-01', '2006-07-15'),
    ('K13', 'DHMT', 'GV07', 3, 2006, '2006-08-01', '2006-12-15'),
    ('K11', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
    ('K12', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
    ('K13', 'HDH', 'GV04', 3, 2007, '2007-02-01', '2007-02-18'),
    ('K12', 'HDH', 'GV04', 3, 2007, '2007-02-01', '2007-02-18'),
    ('K11', 'DHMT', 'GV07', 1, 2007, '2007-02-18', '2007-03-20');
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA)
VALUES
    ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-05-02', '2004-11-01', 5.00, 2250000, 'KHMT'),
    ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '1965-12-17', '2004-11-15', 4.50, 2025000, 'HTTT'),
    ('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1950-08-01', '2004-09-23', 4.00, 1800000, 'CNPM'),
    ('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '1960-01-22', '2004-11-15', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '1958-12-03', '2005-01-12', 3.00, 1350000, 'HTTT'),
    ('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '1953-03-11', '2005-01-12', 4.50, 2025000, 'KHMT'),
    ('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '1971-11-23', '2005-01-12', 4.00, 1800000, 'CNPM'),
    ('GV08', 'Le Thi Tran', 'KS', 'Null', 'Nu', '1974-03-26', '2005-05-15', 1.69, 760500, 'KHMT'),
    ('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '1966-12-31', '2005-03-01', 4.00, 1800000, 'HTTT'),
    ('GV10', 'Le Tran Anh Loan', 'KS', 'Null', 'Nu', '1972-07-17', '2005-05-15', 1.86, 837000, 'CNPM'),
    ('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '1980-12-12', '2005-05-15', 2.67, 1201500, 'MTT'),
    ('GV12', 'Tran Van Anh', 'CN', 'Null', 'Nam', '1981-03-29', '2005-05-15', 1.69, 760500, 'CNPM'),
    ('GV13', 'Nguyen Linh Dan', 'CN', 'Null', 'Nu', '1983-05-23', '2005-05-15', 1.69, 760500, 'MTT'),
    ('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '1976-11-30', '2005-03-10', 3.00, 1350000, 'MTT'),
    ('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '1978-04-05', '2005-05-15', 3.00, 1350000, 'KHMT');
INSERT INTO DIEUKIEN (MAMH, MAMH_TRUOC)
VALUES
    ('CSDL', 'CTRR'),
    ('CSDL', 'CTDLGT'),
    ('CTDLGT', 'THDC'),
    ('PTTKTT', 'THDC'),
    ('PTTKTT', 'CTDLGT'),
    ('DHMT', 'THDC'),
    ('LTHDT', 'THDC'),
    ('PTTKHTTT', 'CSDL');
-- Nhập dữ liệu cho HOCVIEN 
INSERT INTO HOCVIEN (MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP)
VALUES
('K1101','Nguyen Van','A','1986-01-27','Nam','TpHCM','K11'),
('K1102','Tran Ngoc','Han','1986-03-01','Nu','Kien Giang','K11'),
('K1103','Ha Duy','Lap','1986-04-18','Nam','Nghe An','K11'),
('K1104','Tran Ngoc','Linh','1986-03-30','Nu','Tay Ninh','K11'),
('K1105','Tran Minh','Long','1986-02-27','Nam','TpHCM','K11'),
('K1106','Le Nhat','Minh','1986-01-24','Nam','TpHCM','K11'),
('K1107','Nguyen Nhu','Nhut','1986-01-27','Nam','Ha Noi','K11'),
('K1108','Nguyen Manh','Tam','1986-02-27','Nam','Kien Giang','K11'),
('K1109','Phan Thi Thanh','Tam','1986-01-27','Nu','Vinh Long','K11'),
('K1110','Le Hoai','Thuong','1986-02-05','Nu','Can Tho','K11'),
('K1111','Le Ha','Vinh','1986-12-25','Nam','Vinh Long','K11'),
('K1201','Nguyen Van','B','1986-02-11','Nam','TpHCM','K12'),
('K1202','Nguyen Thi Kim','Duyen','1986-01-18','Nu','TpHCM','K12'),
('K1203','Tran Thi Kim','Duyen','1986-09-17','Nu','TpHCM','K12'),
('K1204','Truong My','Hanh','1986-05-19','Nu','Dong Nai','K12'),
('K1205','Nguyen Thanh','Nam','1986-04-17','Nam','TpHCM','K12'),
('K1206','Nguyen Thi Truc','Thanh','1986-03-04','Nu','Kien Giang','K12'),
('K1207','Tran Thi Bich','Thuy','1986-02-08','Nu','Nghe An','K12'),
('K1208','Huynh Thi Kim','Trieu','1986-04-08','Nu','Tay Ninh','K12'),
('K1209','Pham Thanh','Trieu','1986-02-23','Nam','TpHCM','K12'),
('K1210','Ngo Thanh','Tuan','1986-02-14','Nam','TpHCM','K12'),
('K1211','Do Thi','Xuan','1986-03-09','Nu','Ha Noi','K12'),
('K1212','Le Thi Phi','Yen','1986-03-12','Nu','TpHCM','K12'),
('K1301','Nguyen Thi Kim','Cuc','1986-06-09','Nu','Kien Giang','K13'),
('K1302','Truong Thi My','Hien','1986-03-18','Nu','Nghe An','K13'),
('K1303','Le Duc','Hien','1986-03-12','Nam','Tay Ninh','K13'),
('K1304','Le Quang','Hien','1986-04-18','Nam','TpHCM','K13'),
('K1305','Le Thi','Huong','1986-03-27','Nu','TpHCM','K13'),
('K1306','Nguyen Thai','Huu','1986-03-30','Nam','Ha Noi','K13'),
('K1307','Tran Minh','Man','1986-05-28','Nam','TpHCM','K13'),
('K1308','Nguyen Hieu','Nghia','1986-04-08','Nam','Kien Giang','K13'),
('K1309','Nguyen Trung','Nghia','1987-01-18','Nam','Nghe An','K13'),
('K1310','Tran Thi Hong','Tham','1986-04-22','Nu','Tay Ninh','K13'),
('K1311','Tran Minh','Thuc','1986-04-04','Nam','TpHCM','K13'),
('K1312','Nguyen Thi Kim','Yen','1986-09-07','Nu','TpHCM','K13');

INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA)
VALUES 
('K1101','CSDL',1,'2006-07-20',10.00,'Dat'),
('K1101','CTDLGT',1,'2006-12-28',9.00,'Dat'),
('K1101','THDC',1,'2006-05-20',9.00,'Dat'),
('K1101','CTRR',1,'2006-05-13',9.50,'Dat'),
('K1102','CSDL',1,'2006-07-20',4.00,'Khong Dat'),
('K1102','CSDL',2,'2006-07-27',4.25,'Khong Dat'),
('K1102','CSDL',3,'2006-08-10',4.50,'Khong Dat'),
('K1102','CTDLGT',1,'2006-12-28',4.50,'Khong Dat'),
('K1102','CTDLGT',2,'2007-01-05',4.00,'Khong Dat'),
('K1102','CTDLGT',3,'2007-01-15',6.00,'Dat'),
('K1102','THDC',1,'2006-05-20',5.00,'Dat'),
('K1102','CTRR',1,'2006-05-13',7.00,'Dat'),
('K1103','CSDL',1,'2006-07-20',3.50,'Khong Dat'),
('K1103','CSDL',2,'2006-07-27',8.25,'Dat'),
('K1103','CTDLGT',1,'2006-12-28',7.00,'Dat'),
('K1103','THDC',1,'2006-05-20',8.00,'Dat'),
('K1103','CTRR',1,'2006-05-13',6.50,'Dat'),
('K1104','CSDL',1,'2006-07-20',3.75,'Khong Dat'),
('K1104','CTDLGT',1,'2006-12-28',4.00,'Khong Dat'),
('K1104','THDC',1,'2006-05-20',4.00,'Khong Dat'),
('K1104','CTRR',1,'2006-05-13',4.00,'Khong Dat'),
('K1104','CTRR',2,'2006-05-20',3.50,'Khong Dat'),
('K1104','CTRR',3,'2006-06-30',4.00,'Khong Dat'),
('K1201','CSDL',1,'2006-07-20',6.00,'Dat'),
('K1201','CTDLGT',1,'2006-12-28',5.00,'Dat'),
('K1201','THDC',1,'2006-05-20',8.50,'Dat'),
('K1201','CTRR',1,'2006-05-13',9.00,'Dat'),
('K1202','CSDL',1,'2006-07-20',8.00,'Dat'),
('K1202','CTDLGT',1,'2006-12-28',4.00,'Khong Dat'),
('K1202','CTDLGT',2,'2007-01-05',5.00,'Dat'),
('K1202','THDC',1,'2006-05-20',4.00,'Khong Dat'),
('K1202','THDC',2,'2006-05-27',4.00,'Khong Dat'),
('K1202','CTRR',1,'2006-05-13',3.00,'Khong Dat'),
('K1202','CTRR',2,'2006-05-20',4.00,'Khong Dat'),
('K1202','CTRR',3,'2006-06-30',6.25,'Dat'),
('K1203','CSDL',1,'2006-07-20',9.25,'Dat'),
('K1203','CTDLGT',1,'2006-12-28',9.50,'Dat'),
('K1203','THDC',1,'2006-05-20',10.00,'Dat'),
('K1203','CTRR',1,'2006-05-13',10.00,'Dat'),
('K1204','CSDL',1,'2006-07-20',8.50,'Dat'),
('K1204','CTDLGT',1,'2006-12-28',6.75,'Dat'),
('K1204','THDC',1,'2006-05-20',4.00,'Khong Dat'),
('K1204','CTRR',1,'2006-05-13',6.00,'Dat'),
('K1301','CSDL',1,'2006-12-20',4.25,'Khong Dat'),
('K1301','CTDLGT',1,'2006-07-25',8.00,'Dat'),
('K1301','THDC',1,'2006-05-20',7.75,'Dat'),
('K1301','CTRR',1,'2006-05-13',8.00,'Dat'),
('K1302','CSDL',1,'2006-12-20',6.75,'Dat'),
('K1302','CTDLGT',1,'2006-07-25',5.00,'Dat'),
('K1302','THDC',1,'2006-05-20',8.00,'Dat'),
('K1302','CTRR',1,'2006-05-13',8.50,'Dat'),
('K1303','CSDL',1,'2006-12-20',4.00,'Khong Dat'),
('K1303','CTDLGT',1,'2006-07-25',4.50,'Khong Dat'),
('K1303','CTDLGT',2,'2006-08-07',4.00,'Khong Dat'),
('K1303','CTDLGT',3,'2006-08-15',4.25,'Khong Dat'),
('K1303','THDC',1,'2006-05-20',4.50,'Khong Dat'),
('K1303','CTRR',1,'2006-05-13',3.25,'Khong Dat'),
('K1303','CTRR',2,'2006-05-20',5.00,'Dat'),
('K1304','CSDL',1,'2006-12-20',7.75,'Dat'),
('K1304','CTDLGT',1,'2006-07-25',9.75,'Dat'),
('K1304','THDC',1,'2006-05-20',5.50,'Dat'),
('K1304','CTRR',1,'2006-05-13',5.00,'Dat'),
('K1305','CSDL',1,'2006-12-20',9.25,'Dat'),
('K1305','CTDLGT',1,'2006-07-25',10.00,'Dat'),
('K1305','THDC',1,'2006-05-20',8.00,'Dat'),
('K1305','CTRR',1,'2006-05-13',10.00,'Dat');
ALTER TABLE LOP ADD CONSTRAINT FK_TL_HV FOREIGN KEY (TRGLOP) REFERENCES HOCVIEN(MAHV)
ALTER TABLE LOP ADD	CONSTRAINT FK_GVCN_GV FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV) 
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_MAKHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MAMH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MALOP_2 FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MAGV FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE KHOA ADD CONSTRAINT FK_TRGKHOA_GV FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE MONHOC ADD CONSTRAINT FK_MAKHOA_2 FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_MAMH_TRUOC FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_MAMH_2 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_MAHV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_MAMH_3 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
GO

-- III. 19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT MAKHOA, TENKHOA
FROM KHOA
WHERE NGTLAP = (
    SELECT MIN (NGTLAP)
    FROM KHOA
)
-- III. 20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(MAGV) AS SOLUONG
FROM GIAOVIEN
WHERE HOCHAM = 'GS' OR HOCHAM = 'PGS'

-- III. 21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT TENKHOA, COUNT(MAGV) AS SOLUONG
FROM KHOA, GIAOVIEN
WHERE GIAOVIEN.MAKHOA = KHOA.MAKHOA AND( HOCVI = 'CN' OR HOCVI = 'KS' OR HOCVI = 'Ths' OR HOCVI = 'TS' OR HOCVI = 'PTS')
GROUP BY TENKHOA

-- III. 22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT 
    MAMH, 
    KQUA, 
    COUNT(*) AS SoLuongHocVien
FROM 
    KETQUATHI
GROUP BY 
    MAMH, KQUA
ORDER BY 
    MAMH, KQUA;


-- III. 23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
SELECT GIAOVIEN.MAGV, HOTEN
FROM GIAOVIEN, LOP, GIANGDAY
WHERE GIAOVIEN.MAGV = LOP.MAGVCN AND GIANGDAY.MALOP = LOP.MALOP
GROUP BY GIAOVIEN.MAGV, HOTEN

-- III. 24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT TOP 1 HO, TEN, SISO
FROM HOCVIEN, LOP
WHERE HOCVIEN.MAHV = LOP.TRGLOP
ORDER BY SISO DESC 

-- III. 25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
SELECT HO, TEN 
FROM HOCVIEN, LOP, KETQUATHI
WHERE HOCVIEN.MAHV = LOP.TRGLOP AND KETQUATHI.MAHV = HOCVIEN.MAHV AND KQUA = 'Khong Dat'
GROUP BY HO, TEN
HAVING COUNT(DISTINCT MAMH) > 3

-- III. 26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9, 10 nhiều nhất.
SELECT TOP 1
    H.MAHV, 
    H.HO,
    H.TEN, 
    COUNT(KQ.MAMH) AS SoMonDat9_10
FROM 
    HOCVIEN H
JOIN 
    KETQUATHI KQ ON H.MAHV = KQ.MAHV
WHERE 
    KQ.DIEM = 9 OR KQ.DIEM = 10
GROUP BY 
    H.MAHV, H.HO, H.TEN
ORDER BY 
    SoMonDat9_10 DESC

-- III. 27. Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9, 10 nhiều nhất.
SELECT 
    L.MALOP,
    H.MAHV, 
    H.HO,
    H.TEN, 
    COUNT(KQ.MAMH) AS SoMonDat9_10
FROM 
    LOP L
JOIN 
    HOCVIEN H ON L.MALOP = H.MALOP
JOIN 
    KETQUATHI KQ ON H.MAHV = KQ.MAHV
WHERE 
    KQ.DIEM = 9 OR KQ.DIEM = 10
GROUP BY 
    L.MALOP, H.MAHV, H.HO, H.TEN
HAVING 
    COUNT(KQ.MAMH) = (
        SELECT 
            MAX(SoMon)
        FROM (
            SELECT 
                COUNT(KQ1.MAMH) AS SoMon
            FROM 
                HOCVIEN H1
            JOIN 
                KETQUATHI KQ1 ON H1.MAHV = KQ1.MAHV
            WHERE 
                H1.MALOP = L.MALOP AND (KQ1.DIEM = 9 OR KQ1.DIEM = 10)
            GROUP BY 
                H1.MAHV
        ) AS SubQuery
    )
ORDER BY L.MALOP;

-- III. 28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT 
    HOCKY,
    NAM,
    MAGV,
   
    COUNT(DISTINCT maMH) AS soMonHoc,
    COUNT(DISTINCT maLop) AS soLop
FROM 
    GIANGDAY
GROUP BY 
    MAGV, HOCKY, NAM;

-- III. 29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT 
    GD.MAGV,
    GV.HOTEN
    HOCKY,
    GD.NAM
FROM 
    GIANGDAY GD
JOIN 
    GIAOVIEN GV ON GD.MAGV = GV.MAGV
GROUP BY 
    GD.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM
HAVING 
    COUNT(GD.MAMH) = (
        SELECT 
            MAX(SL)
        FROM (
            SELECT 
                MAGV,
                HOCKY,
                NAM,
                COUNT(MAMH) AS SL
            FROM 
                GIANGDAY
            GROUP BY 
                MAGV, HOCKY, NAM
        ) AS MAX_SOMONDAY
        WHERE 
            MAX_SOMONDAY.HOCKY = GD.HOCKY 
            AND MAX_SOMONDAY.NAM = GD.NAM
    );


-- III. 30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT TOP 1
    MH.MAMH, 
    MH.TENMH
FROM 
    MONHOC MH
JOIN 
    KETQUATHI KQ ON MH.MAMH = KQ.MAMH
WHERE 
    KQ.LANTHI = 1 
    AND KQ.KQUA = 'KHONG DAT'
GROUP BY 
    MH.MAMH, MH.TENMH
ORDER BY 
    COUNT(KQ.MAHV) DESC 

-- III. 31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT 
    HV.MAHV, 
    HV.HO,
    HV.TEN
FROM 
    HOCVIEN HV
JOIN 
    KETQUATHI KQ ON HV.MAHV = KQ.MAHV
WHERE 
    KQ.LANTHI = 1 
GROUP BY 
    HV.MAHV, HV.HO, HV.TEN
HAVING 
    COUNT(CASE WHEN KQ.KQUA <> 'DAT' THEN 1 END) = 0;

-- III. 32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
SELECT 
    HV.MAHV, 
    HV.HO,
    HV.TEN 
FROM 
    HOCVIEN HV
JOIN 
    KETQUATHI KQ ON HV.MAHV = KQ.MAHV
WHERE 
    KQ.LANTHI = 1 
GROUP BY 
    HV.MAHV, HV.HO, HV.TEN
HAVING 
    COUNT(CASE WHEN KQ.KQUA <> 'DAT' THEN 1 END) = 0;

-- III. 33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn và đều đạt (chỉ xét lần thi thứ 1).
SELECT 
    HV.MAHV, 
    HV.HO,
    HV.TEN
FROM 
    HOCVIEN HV
JOIN 
    KETQUATHI KQ ON HV.MAHV = KQ.MAHV
WHERE 
    KQ.LANTHI = 1 
    AND KQ.KQUA = 'DAT'
GROUP BY 
    HV.MAHV, HV.HO, HV.TEN
HAVING 
    COUNT(DISTINCT KQ.MAMH) = (SELECT COUNT(DISTINCT MAMH) FROM MONHOC);

-- III. 34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn và đều đạt (chỉ xét lần thi sau cùng).
SELECT 
    HV.MAHV, 
    HV.HO,
    HV.TEN
FROM 
    HOCVIEN HV
JOIN 
    KETQUATHI KQ ON HV.MAHV = KQ.MAHV
WHERE 
    KQ.LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV = HV.MAHV)
    AND KQ.KQUA = 'DAT'
GROUP BY 
    HV.MAHV, HV.HO, HV.TEN
HAVING 
    COUNT(DISTINCT KQ.MAMH) = (SELECT COUNT(DISTINCT MAMH) FROM MONHOC);

-- III. 35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
SELECT 
    KQ.MAMH, 
    HV.MAHV, 
    HV.HO,
    HV.TEN, 
    KQ.DIEM
FROM 
    KETQUATHI KQ
JOIN 
    HOCVIEN HV ON KQ.MAHV = HV.MAHV
WHERE 
    KQ.LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV = KQ.MAHV AND MAMH = KQ.MAMH)
    AND KQ.DIEM = (SELECT MAX(DIEM) FROM KETQUATHI WHERE MAMH = KQ.MAMH AND LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAMH = KQ.MAMH))
ORDER BY 
    KQ.MAMH;
