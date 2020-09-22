USE HowKteam
GO

SELECT * FROM dbo.GIAOVIEN

-- Tạo ra một bảng lưu thông tin giáo viên, tên bộ môn và lương của giáo viên đó
SELECT GV.*, BM.TENBM INTO A FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MABM = BM.MABM

SELECT * FROM A

UPDATE dbo.GIAOVIEN SET LUONG = 9000
WHERE MAGV = N'006'
-- -> ta update cho bảng GIAOVIEN, nhưng bảng A không được update theo mặc dù A được tạo ra và tham chiếu tới bảng giáo viên
-- Vì A được tạo ra là bảng cứng, dữ liệu không để thay đổi theo bảng GIAOVIEN được

-- VIEW:
-- Là bảng ảo (khi bảng được tạo bằng view thì nó được lưu trong thư mục Views, không phải thư mục Tables)
-- Cập nhật dữ liệu theo bảng mà view truy vấn tới mỗi khi lấy view ra dùng

-- Tạo ra VIEW từ câu truy vấn
CREATE VIEW TestView AS 
SELECT * FROM dbo.GIAOVIEN

SELECT * FROM TestView
-- Update bảng GIAOVIEN
UPDATE dbo.GIAOVIEN SET LUONG = 90
WHERE MAGV = N'006'
-- View cũng được update theo
SELECT * FROM TestView
-- Update, Sửa bảng VIEW
ALTER VIEW TestView AS
SELECT HOTEN FROM dbo.GIAOVIEN
-- Xóa VIEW
DROP VIEW TestView

-- Đặt tên VIEW có kí tự unicode
CREATE VIEW [Giáo dục miễn phí] AS
SELECT * FROM dbo.KHOA

SELECT * FROM [Giáo dục miễn phí]