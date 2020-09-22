USE SQLDBQuery
GO

-- Thêm dữ liệu
-- Kiễu số -> đưa vào số bình thường
-- Kiểu kí tự hoặc ngày -> cần để trong cặp nháy đơn
-- Kiểu unicode -> cần có N phía trước cặp nháy đơn N''
INSERT dbo.HocSinh ( MaHS, Name, NgaySinh ) -- lưu ý để thứ tự cho đúng với thứ tự value insert vào
VALUES  ( N'5', -- MaHS - nvarchar(10)
          N'HowKteam.com', -- Name - nvarchar(100)
          '19940419'  -- NgaySinh - date
          )
GO

CREATE TABLE Test
(
	MaSo INT,
	Ten NVARCHAR(10),
	NgaySinh DATE,
	Nam BIT,
	DiaChi CHAR(20),
	TienLuong FLOAT
)
GO

-- cách 1:
-- Insert đầy đủ cho tất cả các trường
INSERT dbo.Test
        ( MaSo ,
          Ten ,
          NgaySinh ,
          Nam ,
          DiaChi ,
          TienLuong
        )
VALUES  ( 10 , -- MaSo - int
          N'Phạm' , -- Ten - nvarchar(10)
          '19961024' , -- NgaySinh - date
          1 , -- Nam - bit
          'Địa chỉ nè' , -- DiaChi - char(20)
          10000.0  -- TienLuong - float
        )
GO

-- insert cho 1 số trường
INSERT dbo.Test
        ( MaSo ,
          Ten ,
          DiaChi ,
          TienLuong
        )
VALUES  ( 10 , -- MaSo - int
          N'Phạm' , -- Ten - nvarchar(10)
          'Địa chỉ nè' , -- DiaChi - char(20)
          10000.0  -- TienLuong - float
        )
GO

-- cách 2:
INSERT dbo.Test -- Không cần ghi các giá trị input nếu ta input theo tuần tự. Lưu ý, cách này thì phải insert cho tất cả các trường
VALUES  ( 14 , -- MaSo - int
          N'Phạm' , -- Ten - nvarchar(10)
          '19961024' , -- NgaySinh - date
          0 , -- Nam - bit
          'Địa chỉ nè' , -- DiaChi - char(20)
          10000.0  -- TienLuong - float
        )
GO


-- Xóa toàn bộ dữ liệu trong bảng (nhưng không xóa bảng)
DELETE dbo.Test
GO
-- Xóa dữ liệu có điều kiện thì dùng thêm WHERE
DELETE dbo.Test WHERE MaSo = 12
GO
-- Có thể kết hợp thêm các toán tử: >, <, >=, <=, <>, AND, OR, =
DELETE dbo.Test WHERE TienLuong > 5000 AND MaSo < 15
GO
DELETE dbo.Test WHERE TienLuong < 6000 OR MaSo > 11
GO

-- UPDATE dữ liệu cho các trường mong muốn
UPDATE dbo.Test SET TienLuong = 100, DiaChi = 'Dia Chi'
GO

-- UPDATE dữ liệu cho các trường mong muốn có điều kiện
UPDATE dbo.Test SET TienLuong = 9, DiaChi = 'Dia Chi 1' WHERE Nam <> 0
GO

-- Xem toàn bộ bảng
SELECT * FROM dbo.Test
GO