USE HowKteam
GO

CREATE FUNCTION UF_PrintName (@Name NVARCHAR(100))
RETURNS INT

-- Trigger: dùng để bắt thông tin sự kiện
-- được gọi mổi khi có thao tác thay đổi thông tin bảng
-- mặc nhiên ta sẽ có 2 bảng:
-- INSERTED: chứa những trường đã Insert | Update vào bảng
-- DELETED: chứa những trường đã bị xóa khỏi bảng
-- Không nên lạm dụng TRIGGER vì mỗi lần thay đổi bảng thì nó sẽ vào TRIGGER check -> tốc độ truy vấn bị chậm lại

CREATE TRIGGER UTG_InsertGV 
ON dbo.GIAOVIEN 
FOR INSERT, UPDATE  -- Lấy thông tin từ sự kiện INSERT hoặc UPDATE vào bảng giáo viên
AS
BEGIN
	PRINT 'Trigger'
END
GO

-- Khi ta thực hiện thao tác insert vào bảng thì TRIGGER sẽ được chạy trước, nếu thỏa thì mới thực hiện lệnh INSERT
INSERT dbo.GIAOVIEN
        ( MAGV ,
          HOTEN ,
          LUONG ,
          PHAI ,
          NGSINH ,
          DIACHI ,
          GVQLCM ,
          MABM
        )
VALUES  ( N'011' , -- MAGV - nchar(3)
          N'Giao Vien Moi' , -- HOTEN - nvarchar(50)
          0.0 , -- LUONG - float
          N'Nam' , -- PHAI - nchar(3)
          GETDATE() , -- NGSINH - date
          N'dadad' , -- DIACHI - nchar(50)
          NULL , -- GVQLCM - nchar(3)
          N'MMT'  -- MABM - nchar(4)
        )


-- Sửa TRIGGER
ALTER TRIGGER UTG_InsertGV 
ON dbo.GIAOVIEN 
FOR INSERT, UPDATE  -- Lấy thông tin từ sự kiện INSERT hoặc UPDATE vào bảng giáo viên
AS
BEGIN
	ROLLBACK TRAN -- ROLLBACK TRANSACTION: Phiên làm việc sẽ bị kết thúc và phiên làm việc này sẽ bị hủy bỏ
	PRINT 'Trigger2'
END
GO

-- Do trong TRIGGER có ROLLBACK TRAN -> lệnh INSERT bị hủy bỏ
INSERT dbo.GIAOVIEN
        ( MAGV ,
          HOTEN ,
          LUONG ,
          PHAI ,
          NGSINH ,
          DIACHI ,
          GVQLCM ,
          MABM
        )
VALUES  ( N'012' , -- MAGV - nchar(3)
          N'Giao Vien Moi' , -- HOTEN - nvarchar(50)
          0.0 , -- LUONG - float
          N'Nam' , -- PHAI - nchar(3)
          GETDATE() , -- NGSINH - date
          N'dadad' , -- DIACHI - nchar(50)
          NULL , -- GVQLCM - nchar(3)
          N'MMT'  -- MABM - nchar(4)
        )

-- xóa TRIGGER
DROP TRIGGER UTG_InsertGV

------------------------------------------------------------------------------------
-- BT: không cho phép xóa thông tin của giáo viên nhỏ hơn 1 tuổi
-- Cách 1: Không sử dụng bảng mặc định đi kèm với TRIGGER (DELETED & INSERTED)
CREATE TRIGGER KhongXoaGV40 
ON GIAOVIEN
FOR DELETE
AS
BEGIN
	DECLARE @Tuoi INT
	SELECT @Tuoi = YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN
	IF @Tuoi < 1
		BEGIN		
			PRINT N'Không được xóa người nhỏ hơn 1 tuổi'
			ROLLBACK TRAN
		END
END

DELETE dbo.GIAOVIEN WHERE MAGV = N'011'

DROP TRIGGER KhongXoaGV40

-- Cách 2: sử dụng bảng mặc định đi kèm với TRIGGER (DELETED & INSERTED)
CREATE TRIGGER KhoangXoaGV40_ver2
ON dbo.GIAOVIEN
FOR DELETE
AS
BEGIN
	DECLARE @Count INT = 0

	SELECT @Count = COUNT(*) FROM DELETED
	WHERE YEAR(GETDATE()) - YEAR(DELETED.NGSINH) < 1

	IF @Count > 0
		BEGIN
			PRINT N'Không được xóa giáo viên < 1 tuổi'
			ROLLBACK TRAN
		END
END

DELETE dbo.GIAOVIEN WHERE MAGV = N'011'

DROP TRIGGER KhoangXoaGV40_ver2
-- LƯU Ý: nếu như dữ liệu bị ràng buộc với nhau (được tham chiếu tới các bảng khác). Nếu xóa thì nó sẽ thông báo lỗi lỗi này trước. 
----------Sau đó vượt qua được lỗi này thì nó mới tới cửa TRIGGER ( giống như TRIGGER là cửa kiểm tra cuối cùng)


