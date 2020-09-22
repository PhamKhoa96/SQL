USE HowKteam
GO

CREATE TABLE TestAuto
(
	ID INT PRIMARY KEY IDENTITY, 
	-- IDENTITY:
	-- tự tăng trường này, phải là số nguyên
	-- Mặc định bắt đầu từ 1 và tăng 1 đơn vị
	-- IDENTITY(5, 10) -> tự tăng, bắt đầu từ 5, mỗi lần tăng 10 đơn vị
	NAME NVARCHAR(100)
)
GO

INSERT dbo.TestAuto ( NAME ) VALUES  ( N'')
INSERT dbo.TestAuto ( NAME ) VALUES  ( N'')
INSERT dbo.TestAuto ( NAME ) VALUES  ( N'')
INSERT dbo.TestAuto ( NAME ) VALUES  ( N'')
INSERT dbo.TestAuto ( NAME ) VALUES  ( N'')
INSERT dbo.TestAuto ( NAME ) VALUES  ( N'')
INSERT dbo.TestAuto ( NAME ) VALUES  ( N'')
INSERT dbo.TestAuto ( NAME ) VALUES  ( N'')

SELECT * FROM dbo.TestAuto

DROP TABLE dbo.TestAuto