--SQLQuery7-SetDaysOff.sql
USE PD_321;
GO

SET DATEFIRST 1;
GO

ALTER PROCEDURE sp_SetDaysOff	@year AS INT
--CREATE PROCEDURE sp_SetDaysOff	@year AS INT
AS
BEGIN
	EXEC sp_SetNewYearHolidays @year, N'Новогодние%';
	EXEC sp_EasterDateDetermine @year, N'Пасха%';
	EXEC sp_SummerHolidaysStart @year, N'Летние%';
	EXEC sp_DaysOffInsert @year, N'Выход%'

	SELECT
		[Дата]		=	[date],
		[Праздник]	=	holiday_name
	FROM DaysOFF 
	JOIN Holidays2 ON (holiday=holiday_id)
END 