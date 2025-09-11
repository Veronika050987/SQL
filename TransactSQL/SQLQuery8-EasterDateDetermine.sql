--SQLQuery8-EasterDateDetermine.sql
USE PD_321;
GO
--SET DATEFIRST 1;

--CREATE PROCEDURE sp_EasterDateDetermine
--CREATE PROCEDURE sp_EasterDateDetermine @year	AS	INT,	@holiday_name	NVARCHAR(150)
ALTER PROCEDURE sp_EasterDateDetermine @year	AS	INT,	@holiday_name	NVARCHAR(150)
AS
BEGIN    
    DECLARE	@holiday	    AS	TINYINT	        =	(SELECT holiday_id	 FROM Holidays2 WHERE holiday_name LIKE @holiday_name);
	DECLARE @duration	    AS	TINYINT	        =	(SELECT duration	 FROM Holidays2 WHERE holiday_id	=	@holiday);  
	
    DECLARE @start_date	AS	DATE	=	DATEFROMPARTS(@year, 1, 1);
	SET		@start_date =	DATEADD(DAY, 1-DATEPART(WEEKDAY,@start_date),@start_date);

    DECLARE @a INT, @b INT, @c INT, @day INT, @e INT, @f INT, @g INT, @h INT, @i INT, @k INT, @l INT, @month INT;
    SET @a = YEAR(GETDATE()) % 4;
    SET @b = YEAR(GETDATE()) % 7;
    SET @c = YEAR(GETDATE()) % 19;
    SET @day = (19 * @c + 15) % 30;
    SET @e = (2 * @a + 4 * @b - @day + 34) % 7;
    SET @f = ( @day + @e + 114 );

    SET @month = @f / 31;
    SET @day = (@f % 31) + 1;

    --DECLARE @DateOfEaster   DATE    = DATEADD(DAY, @day - 1, DATEFROMPARTS(YEAR(GETDATE()), @month, 1));
    DECLARE @DateOfEaster   DATE    = DATEADD(DAY, @day - 1, DATEFROMPARTS(YEAR(GETDATE()), @month, 1));

    DECLARE @Offset         INT     = 13;
    DECLARE @startEaster    DATE    = DATEADD(DAY, @Offset, @DateOfEaster);

    PRINT(@holiday);
	PRINT(@duration);
    PRINT(@startEaster);

    DECLARE @date		AS	DATE	=	@startEaster;
    WHILE	@date <	DATEADD(DAY, @duration, @startEaster)
	BEGIN
			PRINT(@date);
			INSERT DaysOFF
			    VALUES (@date, @holiday)
			SET	@date = DATEADD(DAY, 1, @date);
	END
END

--EXEC sp_EasterDateDetermine 2025, N'Пасха%'; 