/* 
NHẮC LẠI KIẾN THỨC:
Chương trình con (CTC) là một đoạn chương trình thực hiện trọn vẹn hay một chức năng nào đó.             Trong Turbo Pascal, có 2 dạng CTC:

·        Thủ tục (PROCEDURE): Dùng để thực hiện một hay nhiều nhiệm vụ nào đó.

·        Hàm (FUNCTION): Trả về một giá trị nào đó (có kiểu vô hướng, kiểu string). Hàm có thể sử dụng trong các biểu thức.


Chú ý: Trong quá trình xây dựng CTC, khi nào thì nên dùng thủ tục/hàm?

Dùng hàm
- Kết quả của bài toán trả về 1 giá trị duy nhất (kiểu vô hướng, kiểu string).
- Lời gọi CTC cần nằm trong các biểu thức tính toán.

Dùng thủ tục
- Kết quả của bài toán không trả về giá trị nào hoặc trả về nhiều giá trị hoặc trả về  kiểu dữ liệu có cấu trúc (Array, Record, File).
- Lời gọi CTC không nằm trong các biểu thức tính toán.
*/

/*
- STORE torng SQL
- Là chương trình hay thủ tục
- Mục đích là để tái sử dụng code lại
- Ta có thể dùng Transact- SQL EXECUTE (EXEC) để thực thi các stored procedure
- stored procedure khác với các hàm xử lí là giá trị trả về của chúng
- không chứa trong tên và chúng không được sử dụng trực tiếp trong biểu thức
*/

/* CÁC TÍNH CHẤT
- Động: có thể chỉnh sửa khối lệnh, tái sử dụng nhiều lần
- Nhanh hơn: Tự phân tích cú pháp cho tối ưu. Và tạo bản sao để lần chạy sau không cần thực thi lại từ đầu
- Bảo mật: Giới hạn quyền cho user nào sử dụng user nào không
- Giảm bandwidth: Với các gói transaction lớn. Vài ngàn dòng lệnh thì dùng store sẽ đảm bảo
*/

/*
CREATE PROC <Tên store>
[Parameter nếu có]
BEGIN
	<Code xử lí>
END

Nếu chỉ là cấu trúc truy vấn thì có thể không cần BEIGN và END
*/

-- Ví dụ 1:
-- Tạo procedure (hay gọi là store)
CREATE PROC USP_Test
@MaGV NVARCHAR(10), @Luong INT
AS
BEGIN
	SELECT * FROM dbo.GIAOVIEN WHERE MAGV = @MaGV AND LUONG = @Luong
END
GO

-- Thực thi STORE PROCEDURE
--Cách 1
EXEC dbo.USP_Test @MaGV = N'001', @Luong = 1500
--Cách 2
EXEC dbo.USP_Test N'001', 1500
GO

-- Ví dụ 2:
CREATE PROC USP_SelectAllGiaoVien
AS
SELECT * FROM dbo.GIAOVIEN

EXEC USP_SelectAllGiaoVien

-- Xóa procedure
DROP PROC dbo.USP_SelectAllGiaoVien



