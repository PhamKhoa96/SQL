USE HowKteam
GO

-- Cấu trúc truy vấn
-- Lấy hết dữ liệu trong bảng BOMON ra
SELECT * FROM dbo.BoMon 
-- Lấy 2 trường MABM và TENBM trong bảng BOMON ra
SELECT MABM, TENBM FROM dbo.BOMON 
-- Lấy 2 trường MABM và TENBM trong bảng BOMON ra và đổi tên cột hiển thị (đặt alias)
SELECT MABM AS 'K1', TENBM AS 'K2' FROM dbo.BOMON

-- Xuất ra mã giáo viên + tên + tên bộ môn giáo viên đó dạy
SELECT GV.MAGV, GV.HOTEN, BM.TENBM FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM

-- Bài tập:
-- 1. Truy vấn thông tin của bảng Tham gia để tài
SELECT * FROM dbo.THAMGIADT
-- 2. Lấy ra Mã khoa và tên khoa tương ứng
SELECT MAKHOA, TENKHOA FROM dbo.KHOA
-- 3. Lấy ra Mã GV, tên GV và họ tên người thân tương ứng
SELECT GV.MAGV, GV.HOTEN, NT.TEN FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
-- 4. Lấy ra Mã GV, Tên GV, Tên khoa của GV đó làm việc
SELECT GV.MAGV, GV.HOTEN, K.TENKHOA FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K