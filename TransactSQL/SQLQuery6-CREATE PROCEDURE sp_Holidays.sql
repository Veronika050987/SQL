--SQLQuery6-CREATE PROCEDURE sp_Holidays.sql
USE PD_321;
GO

CREATE PROCEDURE sp_Holidays
AS
BEGIN
	--CREATE TABLE dbo.Holidays
	--(	
	--	holiday_id				INT				PRIMARY KEY,
	--	holiday_name			NVARCHAR(30)	NOT NULL,
	--	holiday_start_date		DATE			NOT NULL,
	--	holiday_duration		INT				NOT NULL		
	--);

	INSERT INTO dbo.Holidays (holiday_name, holiday_start_date, holiday_duration)
		VALUES ('New Year', '2024-12-31', 10);

	INSERT INTO dbo.Holidays (holiday_name, holiday_start_date, holiday_duration)
		VALUES ('23 February', '2025-02-23', 1);

	INSERT INTO dbo.Holidays (holiday_name, holiday_start_date, holiday_duration)
		VALUES ('8 March', '2025-03-08', 1);

	INSERT INTO dbo.Holidays (holiday_name, holiday_start_date, holiday_duration)
		VALUES ('Paques', '2025-04-20', 3);
	
	INSERT INTO dbo.Holidays (holiday_name, holiday_start_date, holiday_duration)
		VALUES ('May holidays', '2025-05-01', 10);
	
	INSERT INTO dbo.Holidays (holiday_name, holiday_start_date, holiday_duration)
		VALUES ('Summer holidays', '2025-07-28', 21);

END