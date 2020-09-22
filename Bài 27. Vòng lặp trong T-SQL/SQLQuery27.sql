USE HowKteam
GO

-- Ví dụ 1:
DECLARE @i INT = 0
DECLARE @n INT = 10000

WHILE (@i < @n)
BEGIN
	PRINT @i
	SET @i += 1
END

-- Ví dụ 2:
SELECT HOTEN, LUONG INTO D FROM dbo.GIAOVIEN
WHERE 1<>1
GO

DECLARE @i FLOAT = 0
DECLARE @n INT = 10000 

WHILE (@i < @n)
BEGIN
	INSERT dbo.D (
	          LUONG
	        )
	VALUES  (
	          @i  -- LUONG - float
	        )
	SET @i += 1
END

SELECT * FROM dbo.D