USE HowKteam
GO

-- UNION: gộp 2 trường của 2 bảng thành 1
-- UNION: sẽ lấy các giá trị tồn tại ở cả 2 bảng
-- UNION: không cho phép 1 giá trị lặp lại nhiểu lần
SELECT MAGV FROM dbo.GIAOVIEN
WHERE LUONG >= 2500
UNION
SELECT MAGV FROM dbo.NGUOITHAN
WHERE PHAI = N'Nữ'

-- UNION ALL: cho phép 1 giá trị lặp lại nhiểu lần
SELECT MAGV FROM dbo.GIAOVIEN
WHERE LUONG >= 2500
UNION ALL
SELECT MAGV FROM dbo.NGUOITHAN
WHERE PHAI = N'Nữ'