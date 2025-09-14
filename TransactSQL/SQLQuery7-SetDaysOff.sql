--SQLQuery7-SetDaysOff.sql
USE PD_321;
GO

SET DATEFIRST 1;
GO

ALTER PROCEDURE sp_SetDaysOff	@year AS INT
--CREATE PROCEDURE sp_SetDaysOff	@year AS INT
AS
BEGIN
	EXEC sp_SetNewYearHolidays @year, N'����������%';
	EXEC sp_EasterDateDetermine @year, N'�����%';
	EXEC sp_SummerHolidaysStart @year, N'������%';
	EXEC sp_DaysOffInsert @year, N'�����%'

	SELECT
		[����]		=	[date],
		[��������]	=	holiday_name
	FROM DaysOFF 
	JOIN Holidays2 ON (holiday=holiday_id)
END 