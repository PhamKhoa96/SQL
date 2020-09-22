-- Khóa chính là duy nhất:
-- Mục tiêu: 
-- đây là giá trị định danh cho bảng, có các tính chất:
-- Các giá trị trong trường được set primary key là duy nhất (không có giá trị nào trùng nhau trong 1 trường nếu trường đó được set là khóa chính)
-- NOT NULL 
-- để khóa ngoại tham chiếu tới
-- có thể có nhiều hơn 2 trường trong 1 bảng là 1 khóa chính (nghĩa là các trường này kết hợp thành 1 khóa chính, chứ không phải là nhiều khóa chính, khóa chính chỉ có duy nhất 1 cái)

-- Thực hành:
-- UNIQUE: duy nhất -> trong toàn bộ bảng. Trường nào có từ khóa UNIQUE thì không thể có 2 gtri trùng nhau
-- NOT NULL: Trường đó không được phép NULL
-- DEFAULT: Gía trị mặc định của trường đó nếu không gán giá trị khi insert
USE SQLDBQuery
GO

CREATE TABLE TestPrimaryKey1
(
	ID INT UNIQUE NOT NULL DEFAULT 1,
	Name NVARCHAR(100) DEFAULT N'HowKteam.com'
)
GO

INSERT dbo.TestPrimaryKey1
        ( ID)
VALUES  ( 0)
INSERT dbo.TestPrimaryKey1
        ( ID)
VALUES  ( 1)
INSERT dbo.TestPrimaryKey1
        ( ID)
VALUES  ( 2)

-- do 2 thuộc tính UNIQUE và NOT NULL nên ta không thể thực hiện 2 dòng lệnh dưới đây
INSERT dbo.TestPrimaryKey1
        ( ID)
VALUES  ( 0)
INSERT dbo.TestPrimaryKey1
        ( ID)
VALUES  ( NULL)

-- Tạo PRIMARY KEY
-- Cách 1: tạo ngay khi tạo bảng 
CREATE TABLE TestPrimaryKey2
(
	ID INT PRIMARY KEY, -- PRIMARY KEY sẽ có thuộc tính là UNIQUE và NOT NULL
	Name NVARCHAR(100) DEFAULT N'HowKteam.com'
)
GO
-- Cách 2: khi đã tạo bảng rồi (bảng này chưa có được set PRIMARY KEY) và muốn sửa trường nào đó thành PRIMARY EKY
CREATE TABLE TestPrimaryKey3
(
	ID INT,
	Name NVARCHAR(100) NOT NULL DEFAULT N'HowKteam.com'
)
GO
ALTER TABLE dbo.TestPrimaryKey3 ADD PRIMARY KEY (Name) -- lưu ý, trường muốn sửa thành PRIMARY KEY phải có thuộc tính NOT NULL
-- Cách 3: Tạo PRIMARY KEY trong bảng không phải ngay khi khai báo
CREATE TABLE TestPrimaryKey4
(
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'HowKteam.com'
	PRIMARY KEY (ID)
)
GO
-- Cách 4: Tạo PRIMARY KEY ngay trong bảng mà đặt tên cho KEY đó
CREATE TABLE TestPrimaryKey5
(
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'HowKteam.com'
	
	CONSTRAINT PK_Test5  -- đặt tên cho key, sau này xóa key cho dễ
	PRIMARY KEY (ID) -- nghĩa là bây giờ ID đóng vai trò là PRIMARY KEY và có tên là PK_Test5
)
GO
-- Cách 5: Giống cách 2 nhưng có đặt tên cho PRIMARY KEY như cách 4
CREATE TABLE TestPrimaryKey6
(
	ID INT,
	Name NVARCHAR(100) NOT NULL DEFAULT N'HowKteam.com'
)
GO
ALTER TABLE dbo.TestPrimaryKey6 ADD CONSTRAINT PK_Test6 PRIMARY KEY (Name)


----------------------------------
-- Ví dụ: Khóa chính có 2 trường
CREATE TABLE TestPrimaryKey7
(
	ID1 INT NOT NULL,
	ID2 INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'HowKteam.com'
	PRIMARY KEY (ID1,ID2)
)
GO

SELECT * FROM dbo.TestPrimaryKey7