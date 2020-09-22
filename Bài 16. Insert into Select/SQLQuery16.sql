-- INSERT INTO SELECT -> copy dữ liệu vào một bảng đã tồn tại

-- Tạo ra 1 bảng GiaoVien mới có các trường như bảng GiaoVien NHƯNG KHÔNG có dữ liệu
SELECT * INTO TableF
FROM dbo.GIAOVIEN
WHERE 1<>1
-- Đưa dữ liệu vào bảng TableB trống vừa tạo
INSERT INTO TableF
SELECT * FROM dbo.GIAOVIEN