USE HowKteam
GO

-- Ví dụ 1: Kiểm tra xem giáo viên 001 có phải là giáo viên chủ nhiệm (giáo viên quản lí chuyên môn) hay không
-- Cách 1:
SELECT GV2.* FROM dbo.GIAOVIEN AS GV1, dbo.GIAOVIEN AS GV2
WHERE GV1.GVQLCM = GV2.MAGV
AND GV2.MAGV = N'001'

-- Cách 2: Truy vấn lồng trong WHERE
SELECT * FROM dbo.GIAOVIEN
WHERE MAGV = N'001'
AND MAGV IN
(
	SELECT GVQLCM FROM dbo.GIAOVIEN
)

-- Ví dụ 2:
-- Truy vấn lồng trong  FROM
SELECT * FROM dbo.GIAOVIEN, (SELECT * FROM dbo.DETAI) AS DT

-- câu trên tương đương với:
SELECT * FROM dbo.GIAOVIEN, dbo.DETAI

-- Ví dụ 3: Xuất ra danh sách giáo viên tham gia nhiều hơn 1 công việc trong đề tài
-- Lấy ra thông tin của Giáo viên
SELECT * FROM dbo.GIAOVIEN AS GV
-- Khi công việc người đó làm > 1
WHERE 1 <
(
	SELECT COUNT(*) FROM dbo.THAMGIADT
	WHERE MAGV = GV.MAGV
)

-- Ví dụ 4: Xuất ra thông tin của khoa mà có nhiểu hơn 2 giáo viên
SELECT * FROM dbo.KHOA AS K
WHERE 2 <
(
	SELECT COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
	WHERE K.MAKHOA = BM.MAKHOA AND BM.MABM = GV.MABM
)



/*
Bài tập:
1. Xuất ra thông tin giáo viên mà có hơn 2 người thân
2. Xuất ra danh sách các giáo viên lớn tuổi hơn ít nhất 5 giáo viên trong trường
-- Lấy ra danh sách (MaGV, Tuoi) as GVT
-- sắp xếp giảm dần
-- lấy ra danh sách  GVT2 với số lượng phần tử = 5
-- kiểm tra mã GV tồn tại trong GVT2 là đúng
*/

-- Sắp xếp giảm dần:
SELECT * FROM dbo.GIAOVIEN
ORDER BY MAGV DESC

-- Sắp xếp tăng dần:
SELECT * FROM dbo.GIAOVIEN
ORDER BY MAGV ASC

-- Lấy ra top 5 phần tử
SELECT TOP(5) * FROM dbo.GIAOVIEN

-- BT1:
SELECT * FROM dbo.GIAOVIEN
WHERE 2 <
(
	SELECT COUNT(*) FROM dbo.NGUOITHAN
	WHERE dbo.GIAOVIEN.MAGV = dbo.NGUOITHAN.MAGV
)
-- BT2:
-- Cách 1: có tạo thêm bảng
SELECT *, YEAR(GETDATE()) - YEAR(GV.NGSINH) AS N'Age' INTO A
FROM dbo.GIAOVIEN AS GV
 
SELECT TOP (5) * FROM A
ORDER BY Age DESC

-- Cách 2: truy vấn lồng, không cần tạo thêm bảng
SELECT TOP (5) * 
FROM
(
	SELECT *, YEAR(GETDATE()) - YEAR(GV.NGSINH) AS N'Age'
	FROM dbo.GIAOVIEN AS GV
) AS GVT
ORDER BY Age DESC
