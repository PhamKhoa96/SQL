USE HowKteam
GO

-- Xuất ra thông tin GV có tên bắt đầu bằng chữ n
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE N'n%'

-- Xuất ra thông tin GV có tên kết thúc bằng chữ n
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE N'%n'

-- Xuất ra thông tin GV có tên tồn tại chữ ế
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE N'%ế%'