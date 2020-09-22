USE HowKteam
GO


-- LEFT JOIN và RIGHT JOIN còn được gọi là HALF OUTER JOIN
-- HALF JOIN không có tính đối xứng
-- Left join: hiện lên thông tin bảng bên trái có mà bảng bên phải không có (xét theo điều kiện)
SELECT * FROM dbo.GIAOVIEN LEFT JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM 

-- Right join: hiện lên thông tin bảng bên phải có mà bảng bên phải không có (xét theo điều kiện)
SELECT * FROM dbo.GIAOVIEN RIGHT JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM 