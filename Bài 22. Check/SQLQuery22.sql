USE HowKteam
GO

CREATE TABLE TestCheck
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT CHECK (Luong > 3000 AND Luong < 9000)
	-- Tạo điều kiện cho các trường
)
GO


-- Kiểm tra thử xem check có hoạt động không
INSERT dbo.TestCheck
        ( Luong )
VALUES  ( 2000  -- Luong - int
          )

-- Có thể tạo check y như tạo khóa chính (nghĩa là PRIMARY KEY có bao nhiêu cách tạo thì CHECK có bấy nhiu cách tạo tương tự)
CREATE TABLE TestCheck2
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT, 
	CONSTRAINT CK_Luong CHECK (Luong > 3000 AND Luong < 9000)
)
GO

CREATE TABLE TestCheck4
(
	id INT PRIMARY KEY IDENTITY,
	Luong INT
)
GO
ALTER TABLE dbo.TestCheck3 ADD CONSTRAINT CK_Luong4 CHECK (Luong > 3000 AND Luong < 9000)