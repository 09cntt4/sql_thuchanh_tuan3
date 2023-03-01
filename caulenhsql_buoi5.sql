--18
select count(DEAN.MADA) as ' tổng đề án'
from DEAN
--19
SELECT TenPhg as ' tên Phòng', TenDA as 'Tên dự án'
FROM NHANVIEN INNER JOIN PHONGBAN ON NHANVIEN.Phg = PHONGBAN.MaPhg INNER JOIN PHANCONG ON NHANVIEN.MaNV = PHANCONG.MA_NVIEN
INNER JOIN DEAN ON DEAN.MaDA = PHANCONG.MaDA
GROUP BY TenPhg, TenDA

--20
	select TENPHG,count(*) as' số lượng'
	from PHONGBAN,DEAN
	where maphg=phong
	group by TENPHG


--21
select count(*) as 'số lượng chủ trì'
	from PHONGBAN,DEAN
	where PHONG=MAPHG and TENPHG like N'Nghiên cứu'


--22
SELECT AVG(NHANVIEN.LUONG) as'Lương trung bình'
	FROM NHANVIEN
	WHERE NHANVIEN.PHAI = N'Nữ'
--23
select count(*) as 'Số thân nhân của Tiến'
	from NHANVIEN,THANNHAN
	where MANV=MA_NVIEN and HOVN = N'Đinh' and TENLOT=N'Bá' and TENNV=N'Tiến'

--24
SELECT (HoVN  + ' ' + TenLot + ' ' + TenNV) AS N'Họ Tên', YEAR(NgSinh) AS N'Năm sinh'
FROM NHANVIEN
ORDER BY (2023-YEAR(NgSinh)) ASC

--25
SELECT DEAN.MaDA, SUM(PHANCONG.ThoiGian) as'Tổng số giờ'
	FROM DEAN, PHANCONG
	WHERE DEAN.MaDA = PHANCONG.MaDA
	GROUP BY DEAN.MaDA
--26
select dean.TENDA,sum(PHANCONG.THOIGIAN) as 'Tổng giờ làm'
	from PHANCONG,DEAN
	where PHANCONG.MADA = DEAN.MADA
	group by DEAN.TENDA
--27
select TENDA+'' as 'Tên đề án' ,count(*) as 'số lượng nhân viên'
	from NHANVIEN,DEAN
	where TENDA= DEAN.TENDA
	group by DEAN.TENDA
--28
select HOVN+' '+TENNV as 'Họ Và Tên',count(*) as 'Số lượng thân nhân'
	from NHANVIEN,THANNHAN
	where MANV = MA_NVIEN
	group by HOVN,TENNV
--29
select hovn,tennv,count(*) AS 'SỐ LƯỢNG ĐÊ ÁN'
	from NHANVIEN,PHANCONG
	where MANV=MA_NVIEN
	group by hovn,tennv
--30
select TENPHG ,avg(luong) as 'Lương trung bình của nhân viên'
from PHONGBAN,NHANVIEN
where MAPHG=phg
group By TENPHG
--31
select TENPHG,COUNT(*) as 'Số lượng nhân viên làm việc'
	from PHONGBAN,NHANVIEN
	where MAPHG=PHG
	group by TENPHG
	having avg(LUONG)>5200000
--32
select TENPHG,count(*) as 'số lượng đề án'
	from PHONGBAN,DEAN
	where maphg=phong
	group by TENPHG
--33
select TENPHG,HOVN,TENLOT,TENNV,count(*) as 'Số lượng đề án'
	from PHONGBAN,NHANVIEN,DEAN
	where MANV=TRPHG and MAPHG=PHONG
	group by TENPHG,HOVN,TENLOT,TENNV
--34
select DEAN.TENDA,count(TEN_CONG_VIEC) as 'Số lượng nhân viên tham gia đề án'
	from DEAN,CONGVIEC
	where dean.MADA = CONGVIEC.MADA
	group by DEAN.TENDA