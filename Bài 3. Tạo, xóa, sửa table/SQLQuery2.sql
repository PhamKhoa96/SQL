CREATE DATABASE SQLDBQuery
GO -- thực thi tất cả các câu lệnh trên "GO" xong, rồi mới thực thi câu lệnh phía dưới 

-- Sử dụng SQLDBQuery
USE SQLDBQuery
GO

-- Tạo bảng GiaoVien có 2 thuộc tính
CREATE TABLE GiaoVien
(
	MaGV NVARCHAR(10),
	Name NVARCHAR(100)
)
GO

CREATE TABLE HocSinh
(
	MaHS NVARCHAR(10),
	Name NVARCHAR(100)
)
GO

-- Sửa bảng, thêm cột ngày sinh
ALTER TABLE dbo.HocSinh ADD NgaySinh DATE
GO

-- Xóa toàn bộ dữ liệu trong bảng
TRUNCATE TABLE dbo.HocSinh
GO

-- Xóa bảng
DROP TABLE dbo.HocSinh
GO