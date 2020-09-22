-- Đánh index
-- ƯU ĐIỂM: tăng tốc độ tìm kiếm
-- NHƯỢC ĐIỂM: giảm tốc độ chỉnh sửa dữ liệu
-- (Vì cơ bản index sẽ làm thay đổi cấu trúc của dữ liệu để dễ dàng cho việc tìm kiếm. Cấu trúc bị thay đổi thì sẽ làm giảm thời gian update/ chỉnh sửa dữ liệu)

USE HowKteam
GO

-- VD 1: Tạo index trên bảng giáo viên
CREATE INDEX IndexName ON dbo.GIAOVIEN


-- VD2:
-- Copy bảng NGUOITHAN sang bảng NGUOITHAN1
SELECT * INTO NGUOITHAN1 FROM dbo.NGUOITHAN

-- Thêm dữ liệu vào bảng NGUOITHAN1
DECLARE @i INT = 1
WHILE (@i < 1000000)
BEGIN
	INSERT dbo.NGUOITHAN1
	        ( MAGV, TEN, NGSINH, PHAI )
	VALUES  ( N'001', -- MAGV - nchar(3)
	          N'Test' + CAST(@i AS NCHAR(12)), -- TEN - nchar(12)
	          GETDATE(), -- NGSINH - datetime
	          N'NAM'  -- PHAI - nchar(3)
	          )
	SET @i += 1
END

-- Đánh INDEX tăng dần cho trường MaGV trên bảng NGUOITHAN1. Cho phép các giá trị trong trường đánh index trùng nhau 
CREATE INDEX IndexName ON dbo.NGUOITHAN1(MaGV ASC)
-- Thử tìm kiếm:
SELECT * FROM dbo.NGUOITHAN1
WHERE MAGV = N'001' AND TEN = N'Test999999'

-- VD 3:
-- Đánh INDEX tăng dần cho trường MaGV trên bảng NGUOITHAN1. KHÔNG cho phép các giá trị trong trường đánh index trùng nhau (thêm UNIQUE vào)
CREATE UNIQUE INDEX IndexNameO ON dbo.GIAOVIEN(MaGV ASC)