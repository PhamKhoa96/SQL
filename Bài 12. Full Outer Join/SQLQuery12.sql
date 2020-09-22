USE HowKteam
GO

-- FULL OUTER JOIN: Lấy các giá trị trùng của 2 bảng theo điều kiện và hiển thị cả giá trị không trùng
-- FULL OUTER JOIN có tính đối xứng
SELECT * FROM dbo.BOMON FULL OUTER JOIN dbo.GIAOVIEN
ON BOMON.MABM = GIAOVIEN.MABM

-- So sánh với INNER JOIN
SELECT * FROM dbo.GIAOVIEN, dbo.BOMON
WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM

-- CROSS JOIN là tổ hợp của mỗi record của bảng A và all record của bảng B
SELECT * FROM dbo.GIAOVIEN CROSS JOIN BOMON
-- cách làm lên tương đương với:
SELECT * FROM dbo.GIAOVIEN, dbo.BOMON