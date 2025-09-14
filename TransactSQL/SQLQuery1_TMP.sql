DECLARE @HolidayStartDate DATE, @HolidayEndDate DATE, @HolidayName VARCHAR(100);

-- --- Добавление Пасхи для диапазона лет ---

DECLARE @StartYearForHolidays INT = 2024; -- Год, с которого начинаем генерацию праздников
DECLARE @EndYearForHolidays INT = 2030; -- Год, до которого генерируем праздники
DECLARE @LoopYear INT = @StartYearForHolidays;
DECLARE @EasterDate DATE;
DECLARE @EasterHolidayStartDate DATE;
DECLARE @EasterHolidayEndDate DATE;
DECLARE @EasterHolidayDuration INT = 3; -- Продолжительность выходных на Пасху (например, 3 дня: сама Пасха + 2)

WHILE @LoopYear <= @EndYearForHolidays
BEGIN
 SET @EasterDate = dbo.fnGetOrthodoxEasterDate(@LoopYear); -- Используем нашу функцию
 SET @EasterHolidayStartDate = @EasterDate;
 SET @EasterHolidayEndDate = DATEADD(DAY, @EasterHolidayDuration - 1, @EasterDate); -- -1, так как сама Пасха уже считается первым днем

PRINT (@EasterHolidayStartDate);
PRINT (@EasterHolidayEndDate);
PRINT ('--------------')

 WHILE @EasterHolidayStartDate <= @EasterHolidayEndDate
 BEGIN
 --INSERT INTO dbo.Holidays (HolidayDate, HolidayName)
 --VALUES (@EasterHolidayStartDate, 'Пасха');
 PRINT (@EasterHolidayStartDate);

 SET @EasterHolidayStartDate = DATEADD(DAY, 1, @EasterHolidayStartDate);
 END;

 SET @LoopYear = @LoopYear + 1;

 END