DECLARE @HolidayStartDate DATE, @HolidayEndDate DATE, @HolidayName VARCHAR(100);

-- --- ���������� ����� ��� ��������� ��� ---

DECLARE @StartYearForHolidays INT = 2024; -- ���, � �������� �������� ��������� ����������
DECLARE @EndYearForHolidays INT = 2030; -- ���, �� �������� ���������� ���������
DECLARE @LoopYear INT = @StartYearForHolidays;
DECLARE @EasterDate DATE;
DECLARE @EasterHolidayStartDate DATE;
DECLARE @EasterHolidayEndDate DATE;
DECLARE @EasterHolidayDuration INT = 3; -- ����������������� �������� �� ����� (��������, 3 ���: ���� ����� + 2)

WHILE @LoopYear <= @EndYearForHolidays
BEGIN
 SET @EasterDate = dbo.fnGetOrthodoxEasterDate(@LoopYear); -- ���������� ���� �������
 SET @EasterHolidayStartDate = @EasterDate;
 SET @EasterHolidayEndDate = DATEADD(DAY, @EasterHolidayDuration - 1, @EasterDate); -- -1, ��� ��� ���� ����� ��� ��������� ������ ����

PRINT (@EasterHolidayStartDate);
PRINT (@EasterHolidayEndDate);
PRINT ('--------------')

 WHILE @EasterHolidayStartDate <= @EasterHolidayEndDate
 BEGIN
 --INSERT INTO dbo.Holidays (HolidayDate, HolidayName)
 --VALUES (@EasterHolidayStartDate, '�����');
 PRINT (@EasterHolidayStartDate);

 SET @EasterHolidayStartDate = DATEADD(DAY, 1, @EasterHolidayStartDate);
 END;

 SET @LoopYear = @LoopYear + 1;

 END