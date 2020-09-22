USE HowKteam
GO
-- DECLARE: Tạo ra biến nhằm mục đích tái sử dụng
-- Dùng biến lưu trữ cho gọn lại
-- Chỉ dùng để lưu giá trị đơn (không lưu được table,..)

--------------------------------------------------------------------------------------
-- Ví dụ 1: Không sử dụng biến
-- Tìm ra mã GV của giáo viên có lương = 2100
SELECT GV0.MAGV FROM dbo.GIAOVIEN AS GV0
WHERE GV0.LUONG = 2100

-- Lấy ra tuổi của giáo viên tìm được ở trên
SELECT YEAR(GETDATE()) - YEAR(GV.NGSINH) FROM dbo.GIAOVIEN AS GV
WHERE GV.MAGV = 
(
	SELECT GV0.MAGV FROM dbo.GIAOVIEN AS GV0
	WHERE GV0.LUONG = 2100
)

-------------------------------------------------------------------------------------
-- Ví dụ 1: Sử dụng biến
-- Tạo ra một biến kiểu char lưu mã giáo viên có lương = 2100
DECLARE @Luong2100MaGV CHAR(10)
-- Tìm ra mã GV của giáo viên có lương = 2100
SELECT @Luong2100MaGV = GV0.MAGV  FROM dbo.GIAOVIEN AS GV0
WHERE GV0.LUONG = 2100
-- Lấy ra tuổi của giáo viên tìm được ở trên
SELECT YEAR(GETDATE()) - YEAR(GV.NGSINH) FROM dbo.GIAOVIEN AS GV
WHERE GV.MAGV = @Luong2100MaGV


-------------------------------------------------------------------------------------
-- Khởi tạo với kiểu dữ liệu
-- Biến bắt đầu = kí hiệu @
DECLARE @i INT

--Khởi tạo với giá trị mặc định
DECLARE @j INT = 0

-- set dữ liệu cho biến
SET @i = @i + 1
SET @i += 1
SET @j += @i

-- set thông qua câu select
DECLARE @MaxLuong INT
SELECT @MaxLuong = MAX(LUONG) FROM dbo.GIAOVIEN


-------------------------------------------------------------------------------------
-- BT1: Xuất ra số lượng người thân của giáo viên 001
-- Không dùng biến
SELECT COUNT(*) FROM dbo.NGUOITHAN AS NT
WHERE NT.MAGV = N'001'
-- Dùng biến
DECLARE @MaGV001 NVARCHAR(100) = N'001'
SELECT COUNT(*) FROM dbo.NGUOITHAN AS NT
WHERE NT.MAGV = @MaGV001

-- BT2: Xuất ra tên của giáo viên có lương thấp nhất
DECLARE @MinLuong INT
DECLARE @TenGV NVARCHAR(100)

SELECT @MinLuong = MIN(LUONG) FROM dbo.GIAOVIEN
SELECT HOTEN FROM dbo.GIAOVIEN WHERE LUONG = @MinLuong

-- Xuất giá trị ra màn hình dưới dạng text:
PRINT @MinLuong


SELECT * FROM dbo.GIAOVIEN