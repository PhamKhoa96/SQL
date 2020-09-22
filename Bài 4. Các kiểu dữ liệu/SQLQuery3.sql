-- Các kiểu dữ liệu hay dùng

-- int: kiểu số nguyên, tập hợp N. Ví dụ: -9, 8, 6, 0, ...
-- float: kiểu số thực, tập hợp R. Ví dụ: -0.5, 6.1, ...
-- char: kiểu kí tự. Không viết tiếng việt được. Bộ nhớ cấp phát cứng. Ví dụ: A, a, B, f, ... (chú ý trong SQL không phân biệt hoa thường). Char(10) -> 10 ô nhớ này không ai được động vào. Luôn giữ 10 ô nhớ
-- varchar: kiểu kí tự. Không viết tiếng việt được. Bộ nhớ cấp phát động. Varchar(10) -> 10 ô nhớ này chỉ được lấy khi có dữ liệu nằm bên trong. 'KTeam' -> chỉ dùng 5 ô nhớ
-- nchar: như char nhưng có thể lưu tiếng việt
   -- bộ nhớ lưu max bằng 1/2 bộ nhớ lưu max của char (vì có phải dành ô nhớ để lưu trữ dấu)
-- nvarchar: như varchar nhưng có thể lưu tiếng việt
   -- bộ nhớ lưu max bằng 1/2 bộ nhớ lưu max của varchar (vì có phải dành ô nhớ để lưu trữ dấu)
-- date: lưu trữ ngày, tháng, năm, giờ.
-- time: lưu trữ giờ, phút, giây ...
-- bit: lưu giá trị 0 và 1.
-- text: lưu văn bản lớn
-- ntext: lưu vân bản có tiếng việt (chứa kí tự unicode)

CREATE TABLE Test
(
	Doc NVARCHAR(50),
	MaSV CHAR(10),
	Birthday DATE,
	Sex BIT
)
GO

-- Bài tập:
-- MaSV lưu 10 ô nhớ. MaSV = '1234567890KTeam' -> Kết quả lưu trữ sẽ là:
-- 1. '1234567890'
-- 2. '67890KTeam'
-- 3. Câu trả lời của bạn