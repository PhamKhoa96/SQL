USE HowKteam
GO

-- CURSOR: con trỏ
-- Khi có nhu cầu duyệt từng record của bảng. Với mỗi record có kết quả xử lý riêng thì dùng cursor

-- DECLARE <Tên con trỏ> cursor for <câu SELECT> :Khởi tạo con trỏ, con trỏ này dựa vào kết quả trả về của câu truy vấn
-- OPEN <Tên con trỏ>

-- FETCH NEXT FROM <Tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn> :Đưa dữ liệu từ con trỏ nào vào biến nào để lấy ra sử dụng

-- WHILE @@FETCH_STATUS = 0
-- BEGIN
-- Câu lệnh thực hiện
-- FETCH NEXT FROM <Tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn>
-- END

-- CLOSE <Tên cont trỏ>
-- DEALLOCATE <Tên con trỏ> :Không dùng con trỏ nữa, hủy vùng nhớ đã xin cấp phát đi


------------------------------------------------------------------------------------------------
-- Từ tuổi của giáo viên
-- Nếu lớn hơn 40 thì cho lương là 2500
-- Nếu nhỏ hơn 40 và lớn hơn 30 thì cho lương là 2000
-- Ngược lại thì lương là 1500

-- Copy bảng GIAOVIEN ra bảng GIAOVIEN1
SELECT * INTO GIAOVIEN1 FROM dbo.GIAOVIEN
WHERE 1 <> 1

INSERT INTO GIAOVIEN1
SELECT * FROM GIAOVIEN

-- Lấy ra danh sách MaGV kèm tuổi đưa vào con trỏ có tên là GVCursor
DECLARE GVCursor CURSOR FOR SELECT MAGV, YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN1
	OPEN GVCursor

		DECLARE @MaGV CHAR(10)
		DECLARE @Tuoi INT

		FETCH NEXT FROM GVCursor INTO @MaGV, @Tuoi

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @Tuoi > 40
			UPDATE dbo.GIAOVIEN1 SET LUONG = 2500 WHERE MAGV = @MaGV -- nếu không có where thì nó update lương cả bảng giáo viên chứ không phải mỗi giáo viên đó
			IF @Tuoi < 40 AND @Tuoi > 30
			UPDATE dbo.GIAOVIEN1 SET LUONG = 2000 WHERE MAGV = @MaGV
			ELSE
			UPDATE dbo.GIAOVIEN1 SET LUONG = 1500 WHERE MAGV = @MaGV
		END

	CLOSE GVCursor
DEALLOCATE GVCursor