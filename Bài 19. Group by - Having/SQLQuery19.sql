 USE HowKteam
 GO

 -- Xuất ra số lượng giáo viên trong từng bộ môn mà số giáo viên > 2
 -- HAVING -> như where của select nhưng dành cho GROUP BY
 -- having là where của GROUP BY
 --(HAVING giải quyết vấn đề của agregate function không được được sử dụng trong where)

 SELECT dbo.BOMON.MABM, COUNT(*) FROM dbo.GIAOVIEN, dbo.BOMON
 WHERE dbo.BOMON.MABM = dbo.GIAOVIEN.MABM
 GROUP BY dbo.BOMON.MABM
 HAVING COUNT(*) > 2

 -- Xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó
 -- và có người thân
 -- và tuổi phải lớn hơn tuổi trung bình
 -- các biến dùng trong câu điều kiện HAVING phải nằm trong GROUP BY thì mới thực hiện được
 SELECT GV.LUONG, SUM(YEAR(GETDATE()) - YEAR(GV.NGSINH)) AS N'Tong tuoi' FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
 WHERE GV.MAGV = NT.MAGV 
 AND GV.MAGV IN (SELECT MAGV FROM dbo.NGUOITHAN)
 GROUP BY GV.LUONG, GV.NGSINH
 HAVING	YEAR(GETDATE()) - YEAR(GV.NGSINH) >
 ( 
	(SELECT SUM(YEAR(GETDATE()) - YEAR(GV1.NGSINH)) FROM dbo.GIAOVIEN AS GV1)
	/ (SELECT COUNT(*) FROM dbo.GIAOVIEN)
 )