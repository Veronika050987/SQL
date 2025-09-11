--SQLQuery9-SummerHolidaysStart.sql
USE PD_321;
GO
--SET DATEFIRST 1;

--CREATE PROCEDURE sp_SummerHolidaysStart @year	AS	INT,	@holiday_name	NVARCHAR(150)
ALTER PROCEDURE sp_SummerHolidaysStart @year	AS	INT,	@holiday_name	NVARCHAR(150)
AS
BEGIN    
    DECLARE	@holiday	    AS	TINYINT	        =	(SELECT holiday_id	 FROM Holidays2 WHERE holiday_name LIKE @holiday_name);
	DECLARE @duration	    AS	TINYINT	        =	(SELECT duration	 FROM Holidays2 WHERE holiday_id	=	@holiday);  
	
    DECLARE @start_date	AS	DATE	=	DATEFROMPARTS(@year, 1, 1);
	SET		@start_date =	DATEADD(DAY, 1-DATEPART(WEEKDAY,@start_date),@start_date);

 	DECLARE @lastDayOfJuly	DATE	= DATEFROMPARTS(@year, 7, 31);
	DECLARE @startOfLastWeek DATE	= DATEADD(DAY, -DATEPART(WEEKDAY, @lastDayOfJuly) + 2, @lastDayOfJuly);

    PRINT(@holiday);
	PRINT(@duration);
    PRINT(@startOfLastWeek);

	DECLARE @date		AS	DATE	=	@startOfLastWeek;
	WHILE	@date <	DATEADD(DAY, @duration, @startOfLastWeek)
	BEGIN
			PRINT(@date);
			INSERT DaysOFF
				VALUES (@date, @holiday)
			SET	@date = DATEADD(DAY, 1, @date);
	END
END

--EXEC sp_SummerHolidaysStart 2025, N'Летние%'
