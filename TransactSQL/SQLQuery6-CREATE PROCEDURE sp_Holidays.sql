CREATE PROCEDURE sp_Holidays
AS
BEGIN
	--CREATE TABLE dbo.Holidays
	--(	
	--	holiday_id				INT				PRIMARY KEY,
	--	holiday_name			NVARCHAR(30)	NOT NULL,
	--	holiday_date		DATE			NOT NULL,
	--);

	INSERT INTO dbo.Holidays (holiday_name, holiday_date)
		VALUES	('New Year', '2024-12-31'),
				('New Year', '2025-01-01'),
				('New Year', '2025-01-02'),
				('New Year', '2025-01-03'),
				('New Year', '2025-01-04'),
				('New Year', '2025-01-05'),
				('New Year', '2025-01-06'),
				('New Year', '2025-01-07'),
				('New Year', '2025-01-08'),
				('New Year', '2025-01-09'),
				('New Year', '2025-01-10'),
				('New Year', '2025-01-11'),
				('New Year', '2025-01-12'),
				('New Year', '2025-01-13');


	INSERT INTO dbo.Holidays (holiday_name, holiday_date)
		VALUES	('23 February', '2025-02-23');

	INSERT INTO dbo.Holidays (holiday_name, holiday_date)
		VALUES	('8 March', '2025-03-08');

	INSERT INTO dbo.Holidays (holiday_name, holiday_start_date)
		VALUES	('Paques', '2025-04-20'),
				('Paques', '2025-04-21'),
				('Paques', '2025-04-22');
	
	INSERT INTO dbo.Holidays (holiday_name, holiday_date)
		VALUES	('May holidays', '2025-05-01'),
				('May holidays', '2025-05-02'),
				('May holidays', '2025-05-03'),
				('May holidays', '2025-05-04'),
				('May holidays', '2025-05-05'),
				('May holidays', '2025-05-06'),
				('May holidays', '2025-05-07'),
				('May holidays', '2025-05-08'),
				('May holidays', '2025-05-09'),
				('May holidays', '2025-05-10');
	
	INSERT INTO dbo.Holidays (holiday_name, holiday_date)
		VALUES	('Summer holidays', '2025-07-28'),
				('Summer holidays', '2025-07-29'),
				('Summer holidays', '2025-07-30'),
				('Summer holidays', '2025-07-31'),
				('Summer holidays', '2025-08-01'),
				('Summer holidays', '2025-08-02'),
				('Summer holidays', '2025-08-03'),
				('Summer holidays', '2025-08-04'),
				('Summer holidays', '2025-08-05'),
				('Summer holidays', '2025-08-06'),
				('Summer holidays', '2025-08-07'),
				('Summer holidays', '2025-08-08'),
				('Summer holidays', '2025-08-09'),
				('Summer holidays', '2025-08-10'),
				('Summer holidays', '2025-08-11'),
				('Summer holidays', '2025-08-12'),
				('Summer holidays', '2025-08-13'),
				('Summer holidays', '2025-08-14'),
				('Summer holidays', '2025-08-15'),
				('Summer holidays', '2025-08-16'),
				('Summer holidays', '2025-08-17');

END