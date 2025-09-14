--SQLQuery11-InsertIntoCompleteDisciplines.sql
USE PD_321;
GO

--CREATE PROCEDURE sp_InsertIntoCompleteDisciplines
ALTER PROCEDURE sp_InsertIntoCompleteDisciplines
AS
BEGIN

	INSERT INTO CompleteDisciplines 
			    ([group],   discipline, [date])
    SELECT      [group],    discipline, MAX([date])
    FROM        Schedule,   Disciplines
    WHERE       spent = 1
    GROUP BY    discipline, [group];

END


--EXEC sp_InsertIntoCompleteDisciplines