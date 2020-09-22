USE HowKteam
GO

-- Kiểu dữ liệu tự định nghĩa
-- mục đích: tạo ra 1 kiểu dữ liệu cho riêng mình
-- cấu trúc: EXEC sp_addtype 'Tên kiểu dữ liệu' , 'Tên kiểu dữ liệu thực tế' , 'NOT NULL' (có hay không đều được)
-- Chỗ lưu trữ: Programmability/Types/Use-Defined Data Types
EXEC sp_addtype 'NNAME','NVARCHAR(100)','NOT NULL'

CREATE TABLE TestType1
(
	Name NNAME, -- Sử dụng kiểu dữ liệu tự định nghĩa
	DiaChi NVARCHAR(500)
)
GO

EXEC sp_addtype 'NADDRESS','NVARCHAR(100)','NOT NULL'

-- Xóa kiểu dữ liệu tự định nghĩa
EXEC sys.sp_droptype 'NADDRESS'
