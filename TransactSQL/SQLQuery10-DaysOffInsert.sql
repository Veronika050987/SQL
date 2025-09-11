--SQLQuery10-DaysOffInsert.sql
USE PD_321;
GO

--SET DATEFIRST 1;

--CREATE PROCEDURE sp_DaysOffInsert	@year	AS	INT,	@holiday_name	NVARCHAR(150)
ALTER PROCEDURE sp_DaysOffInsert	@year	AS	INT,	@holiday_name	NVARCHAR(150)
AS
BEGIN
	DECLARE	@holiday	AS	TINYINT	=	(SELECT holiday_id	FROM Holidays2 WHERE holiday_name LIKE @holiday_name);
	DECLARE @duration	AS	TINYINT	=	(SELECT duration	FROM Holidays2 WHERE holiday_id	=	@holiday);
	DECLARE @start_date	AS	DATE	=	DATEFROMPARTS(@year, 1, 1);
	SET		@start_date =	DATEADD(DAY, 1-DATEPART(WEEKDAY,@start_date),@start_date);
	DECLARE @end_date	AS DATE		=	DATEFROMPARTS(@year, 12, 31);

	PRINT(@holiday);
	PRINT(@duration);
	PRINT(@start_date);
	PRINT(@end_date);

	DECLARE @date		AS	DATE	=	@start_date;
	WHILE	@date <=	@end_date
	BEGIN
			IF DATEPART(WEEKDAY, @date) = 6
			BEGIN
				PRINT(@date);
				SET	@date = DATEADD(DAY, 1, @date);
				INSERT DaysOFF
					VALUES (@date, @holiday)
				PRINT(@date);
				INSERT DaysOFF
					VALUES (@date, @holiday)
			END
			SET	@date = DATEADD(DAY, 1, @date);
	END
END

--EXEC sp_DaysOffInsert 2025, N'Выход%'