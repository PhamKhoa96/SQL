USE HowKteam
GO

SELECT GV.MAGV, GV.HOTEN, NT.TEN FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV = NT. MAGV
 
-- Lấy ra giáo viên lương > 2000
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > 2000

-- Lấy ra giáo viên là nữ và lương > 2000
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > 2000 AND PHAI = N'Nữ'

-- Lấy ra giáo viên > 40 tuổi
-- YEAR() -> lấy ra năm của ngày
-- GETDAY() -> lấy ra ngày hiện tại
SELECT * FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) > 40

-- Lấy ra Họ tên giáo viên, năm sinh và tuổi của giáo viên <= 50 tuổi
SELECT HOTEN, YEAR(GETDATE()) AS Namsinh, YEAR(GETDATE()) - YEAR(NGSINH) AS Age FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) <= 50

-- Lấy ra Mã GV, Tên GV, Tên khoa của GV đó làm việc
SELECT GV.MAGV, GV.HOTEN, K.TENKHOA FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K
WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA

-- Lấy ra những giáo viên là trưởng bộ môn
SELECT GV.* FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MAGV = BM.TRUONGBM

-- Đếm số lượng giáo viên
-- COUNT(*) -> đếm số lượng của tất cả record
-- COUNT(tên trường) -> đếm số lượng của trường đó
SELECT COUNT(*) AS N'Số lượng giáo viên' FROM dbo.GIAOVIEN

-- Đếm số lượng người thân của giáo viên có Mã GV là 007
SELECT COUNT(*) AS N'Số lượng người thân của GV 007' FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV AND GV.MAGV = '007'

-- Lấy ra tên giáo viên và tên để tài ngưởi đó tham gia (Lưu ý: GVCNDT (GV chủ nhiệm DT) <> GVTGDT (GV tham gia DT))
SELECT GV. HOTEN, DT.TENDT FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT, dbo.DETAI AS DT
WHERE GV.MAGV = TGDT.MAGV AND TGDT.MADT = DT.MADT

-- Lấy ra tên giáo viên và tên để tài ngưởi đó tham gia nếu GV đó tham gia nhiều hơn 2 công việc trong đề tài đó
-- Truy vấn lồng sẽ giải quyết

-- Bài tập:
-- 1. Xuất ra thông tin GV và GV quản lý chủ nhiệm của người đó
SELECT GV1.HOTEN, GV2.HOTEN FROM dbo.GIAOVIEN AS GV1, dbo.GIAOVIEN AS GV2
WHERE GV1.GVQLCM = GV2.MAGV
-- 2. Xuất ra số lượng giáo viên của khoa CNTT
SELECT COUNT(*) AS N'Số lượng GV của khoa CNTT' FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K
WHERE GV.MABM = BM.MABM  AND BM.MAKHOA = K.MAKHOA 
AND K.MAKHOA = N'CNTT'
-- 3. Xuất ra thông tin giáo viên và đề tài mà người đó tham gia nếu mà kết quả là đạt
SELECT GV.*, DT.TENDT FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT, dbo.DETAI AS DT
WHERE GV.MAGV = TGDT.MAGV AND TGDT.MADT = DT.MADT
AND TGDT.KETQUA = N'đạt'