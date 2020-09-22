USE HowKteam
GO


-- INNER JOIN: Lấy các giá trị trùng của 2 bảng theo điều kiện
-- INNER JOIN có tính đối xứng
-- mọi join đều bắt buộc cần có điều kiện:
SELECT * FROM dbo.GIAOVIEN INNER JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM

-- cách làm lên tương đương với:
SELECT * FROM dbo.GIAOVIEN, dbo.BOMON
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM

-- Bài tập
-- có thể viết tắt INNER JOIN -> JOIN
SELECT * FROM dbo.BOMON JOIN dbo.KHOA
ON KHOA.MAKHOA = BOMON.MAKHOA