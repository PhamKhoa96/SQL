USE HowKteam
GO

-- TRANSACTION: phiên giao dịch (VD: trong giao dịch ngân hàng có các thao tác: đăng nhập, lấy mã OTP,...)
-- để kết thúc 1 transaction thì có 2 TH
-- TH1: ROLLBACK TRANSACTION
-- TH2: COMMIT TRANSACTION

-- Ví dụ 1:
-- Không cho thực hiện transaction
BEGIN TRANSACTION
DELETE dbo.NGUOITHAN1 WHERE TEN = 'Test100000' -- Transaction này cho thao tác DELETE
-- chuỗi thao tác loằn ngoằn phức tạp 
ROLLBACK TRANSACTION -- TH1: Hủy bỏ transaction: tới đây ra không muốn thực hiện thao tác DELETE nữa mà muốn quay trở lại đầu phiên giao dịch

-- Kiểm tra lại
SELECT * FROM dbo.NGUOITHAN1 WHERE TEN = 'Test100000'

-- Ví dụ 2:
-- Không cho thực hiện transaction
-- (ta cũng có thể đặt tên cho transaction)

DECLARE @Trans VARCHAR(20)
SET @Trans = 'Trans1'

BEGIN TRANSACTION @Trans
DELETE dbo.NGUOITHAN1 WHERE TEN = 'Test100000'
-- chuỗi thao tác loằn ngoằn phức tạp
COMMIT TRANSACTION @Trans -- TH2: Cho phép thực hiện transaction
-- Kiểm tra lại
SELECT * FROM dbo.NGUOITHAN1 WHERE TEN = 'Test100000'

-------------------------------------------------------------------------
-- Đặt nhiều mốc thời gian trong transaction để quay lại
BEGIN TRANSACTION

SAVE TRANSACTION Trans1
DELETE dbo.NGUOITHAN1 WHERE TEN = 'Test100001'

SAVE TRANSACTION Trans2
DELETE dbo.NGUOITHAN1 WHERE TEN = 'Test100002'

ROLLBACK TRANSACTION Trans2  -- 'Test100001' bị xóa nhưng 'Test100002' sẽ không bị xóa





