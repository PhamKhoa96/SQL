USE HowKteam
GO

-- Ví dụ 1: Xuất ra danh sách tên bộ môn và số lượng giáo viên của bộ môn đó
SELECT BM.TENBM, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MABM = BM.MABM
GROUP BY BM.TENBM
-- -> lƯU Ý: cột hiển thị phải là thuộc tính nẳm trong khối GROUP BY hoặc là Aggregate function

-- GROUP BY theo nhiều trường cũng được, nhưng kết quả không khác gì GROUP BY theo 1 trường (chỉ thay đổi thứ tự dòng hiển thị)
SELECT BM.TENBM, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MABM = BM.MABM
GROUP BY BM.TENBM, BM.MAKHOA

-- Ví dụ 2: Lấy ra danh sách giáo viên có lương > lương trung bình của giáo viên
SELECT GV.* FROM dbo.GIAOVIEN AS GV
WHERE GV.LUONG > (SELECT SUM(LUONG) FROM dbo.GIAOVIEN)/(SELECT COUNT(*) FROM dbo.GIAOVIEN)
-- hoặc
SELECT GV.* FROM dbo.GIAOVIEN AS GV
WHERE GV.LUONG > (SELECT AVG(LUONG) FROM dbo.GIAOVIEN)

-- Ví dụ 3: Xuất ra tên giáo viên và số lượng đề tài giáo viên đó tham gia
SELECT GV.HOTEN, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TG, dbo.DETAI AS DT
WHERE GV.MAGV = TG.MAGV AND TG.MADT = DT.MADT
GROUP BY GV.MAGV, GV.HOTEN

-- Ví dụ 4: Xuất ra tên giáo viên và số lượng công việc giáo viên đó tham gia
SELECT GV.HOTEN, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TG, dbo.CONGVIEC AS CV
WHERE GV.MAGV = TG.MAGV AND TG.MADT = CV.MADT
GROUP BY GV.MAGV, GV.HOTEN

/*
Bài tập:
1. Xuất ra tên giáo viên và số lượng người thân của giáo viên đó
2. Xuất ra tên giáo viên và số lượng để tài đạt mà giáo viên đó tham gia
3. Xuất ra tên khoa có tổng số lương của giáo viên trong khoa là lớn nhất
*/

-- BT1:
SELECT GV. HOTEN, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV
GROUP BY GV.MAGV, GV.HOTEN

-- BT2:
SELECT GV.HOTEN, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TG
WHERE GV.MAGV = TG.MAGV AND TG.KETQUA = N'Đạt'
GROUP BY GV.MAGV, GV.HOTEN

-- BT3:
SELECT TOP(1) * FROM
(
	SELECT K.TENKHOA, SUM(LUONG) AS N'Salary' FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K
	WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA
	GROUP BY K.MAKHOA, K.TENKHOA
) AS A
ORDER BY Salary DESC



/*
Transact-SQL provides the following Aggregate functions:

AVG          Returns the average value
COUNT	     Returns the number of rows
FISRT		 Returns the first value
LAST		 Returns the last value
MAX			 Returns the largest value
MIN			 Returns the smallest value
ROUND		 Returns a numeric field to the number of decimals specified
SUM			 Returns the sum
*/

/*
String Function

CHARINDEX		Returns the position of a substring in a string
CONCAT  		Adds two or more strings together
LEN / LENGTH	Returns the length of a string
LOWER / LCASE	Converts a string to lower-case
LTRIM			Removes leading spaces from a string
PATINDEX		Returns the position of a pattern in a string
REPLACE			Replaces all occurrences of a substring within a string, with a new substring
RIGHT			Extracts a number of characters from a string (starting from right)
RTRIM			Removes trailing spaces from a string
SUBSTRING		Extracts some characters from a string
TRIM			Removes leading and trailing spaces (or other specified characters) from a string
UPPER / UCASE	Converts a string to upper-case
*/