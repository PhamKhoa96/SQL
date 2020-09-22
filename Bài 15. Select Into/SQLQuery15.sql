USE HowKteam
GO

-- Tác dụng: Tạo 1 bảng mới từ 1 bảng đã có sẵn (đây không phải là bảng tạm mà là 1 bảng được tạo mới và tồn tại)

-- Lấy hết dữ liệu của bảng GiaoVien đưa vào bảng mới tên là TableA
-- Bảng này có các record tương ứng như bảng GiaoVien
SELECT * INTO TableA
FROM dbo.GIAOVIEN

-- Tạo ra 1 bảng là TableB mới. Có 1 cột dữ liệu là HoTen tương ứng như bảng GiaoVien
-- Với điều kiện lương > 2000
-- Dữ liệu của bảng TableB lấy từ bảng GiaoVien ra
SELECT HOTEN INTO TableB
FROM dbo.GIAOVIEN
WHERE LUONG > 2000

-- Tạo 1 bảng mới từ nhiều bảng (lưu ý trong 1 bảng hiện hữu thì tên các trường không được trùng nhau)
SELECT MAGV, HOTEN, TENBM INTO TableC
FROM dbo.GIAOVIEN, dbo.BOMON
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN. MABM

-- Tạo ra 1 bảng GiaoVien mới có các trường như bảng GiaoVien NHƯNG KHÔNG có dữ liệu
SELECT * INTO TableD
FROM dbo.GIAOVIEN
WHERE 6 > 9

-- Tạo ra 1 bảng GiaoVien mới có các trường như bảng GiaoVien VÀ có dữ liệu
-- Cách 1:
SELECT * INTO TableE
FROM dbo.GIAOVIEN
WHERE 6 < 9

-- Cách 2:
-- Tạo ra 1 bảng GiaoVien mới có các trường như bảng GiaoVien NHƯNG KHÔNG có dữ liệu
SELECT * INTO TableF
FROM dbo.GIAOVIEN
WHERE 1<>1
-- Đưa dữ liệu vào bảng TableB trống vừa tạo
INSERT INTO TableF
SELECT * FROM dbo.GIAOVIEN
