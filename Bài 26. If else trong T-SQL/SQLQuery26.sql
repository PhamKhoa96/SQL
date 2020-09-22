USE HowKteam
GO	

-- Ví dụ 1: Kiểm tra xem lương của giáo viên nhập vào có > luongTB hay không. Có thì xuất ra lớn hơn, ngược lại thì nhỏ hơn
DECLARE @LuongTrungBinh INT
SELECT @LuongTrungBinh = SUM(LUONG)/COUNT(*) FROM dbo.GIAOVIEN

DECLARE @MaGV CHAR(10) = '001'
DECLARE @LuongMaGV INT = 0

SELECT @LuongMaGV = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV

IF @LuongMaGV > @LuongTrungBinh
	-- (dùng BEGIN và END khi có nhiều hơn 1 câu lệnh thực hiên sau IF hoặc ELSE)
	BEGIN
		PRINT @LuongMaGV
		PRINT @LuongTrungBinh
		PRINT N'Lớn hơn'
	END
ELSE
	BEGIN
		PRINT @LuongMaGV
		PRINT @LuongTrungBinh
		PRINT N'Nhỏ hơn'
	END

-- Ví dụ 2: Nếu lương của giáo viên nhập vào lớn hơn lương trung bình thì cập nhật lương của tất cả GV thành lương nhập vào
-- Ngược lại chỉ update lương của GV Nữ
DECLARE @LuongTrungBinh INT
SELECT @LuongTrungBinh = SUM(LUONG)/COUNT(*) FROM dbo.GIAOVIEN

DECLARE @MaGV CHAR(10) = '001'
DECLARE @LuongMaGV INT = 0

SELECT @LuongMaGV = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV

IF @LuongMaGV > @LuongTrungBinh
		UPDATE dbo.GIAOVIEN SET LUONG = @LuongMaGV
ELSE
	BEGIN
		UPDATE dbo.GIAOVIEN SET LUONG = @LuongMaGV
		WHERE PHAI = N'Nữ'
	END