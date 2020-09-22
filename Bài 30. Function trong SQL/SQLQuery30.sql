USE HowKteam
GO

-- Ví dụ 1:
-- (Tạo function không có Parameter)
CREATE FUNCTION UF_SelectAllGiaoVien()    -- LƯU Ý: cần có ()
RETURNS TABLE
AS 
RETURN SELECT * FROM dbo.GIAOVIEN
GO

-- Sử dụng function
SELECT * FROM dbo.UF_SelectAllGiaoVien()

-- Ví dụ 2: truyền vào mã GV, xuất ra lương
-- (Tạo function có parameter)
CREATE FUNCTION UF_SelectLuongGV (@MaGV CHAR(10))            -- Nếu muốn update function thì chỉ cần thay CREATE -> ALTER
RETURNS INT
AS
BEGIN
	DECLARE @Luong INT
	SELECT @Luong = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV
	RETURN @Luong
END

-- Sử dụng function
SELECT dbo.UF_SelectLuongGV (N'001')  -- LƯU Ý: cần thêm "dbo." vào khi dùng

SELECT dbo.UF_SelectLuongGV(MAGV) FROM dbo.GIAOVIEN

-- Sửa fucntion
ALTER CREATE FUNCTION UF_SelectLuongGV (@MaGV CHAR(10))
RETURNS INT
AS
BEGIN
	DECLARE @Luong INT
	SELECT @Luong = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV
	RETURN @Luong
END

-- Xóa function
DROP FUNCTION dbo.UF_SelectAllGiaoVien

-- Ví dụ 3: Tạo function tính một số truyền vào có phải là số chẵn hay không
CREATE FUNCTION TinhSoChan (@So INT)
RETURNS NVARCHAR(100)
BEGIN
	DECLARE @KetQua NVARCHAR(100)
	IF @So % 2 = 0
		SET @KetQua = N'Số chẵn'
	ELSE 
		SET @KetQua = N'Số lẻ'
	RETURN @KetQua
END
GO

SELECT dbo.TinhSoChan(5) AS KQ

-- Tạo function tính tuổi
CREATE FUNCTION SoTuoi (@NgaySinh DATE)
RETURNS INT
AS
BEGIN
	RETURN YEAR(GETDATE()) - YEAR(@NgaySinh)
END

-- Kiểm tra tuổi là số chẵn hay lẻ 
SELECT dbo.SoTuoi(NGSINH), dbo.TinhSoChan(dbo.SoTuoi(NGSINH)) FROM dbo.GIAOVIEN