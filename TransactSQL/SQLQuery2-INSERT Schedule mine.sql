--SQLQuery1-INSERT Schedule mine.sql
USE PD_321;
GO

SET DATEFIRST 1;

DECLARE		@start_date			AS		DATE	=	'2025-08-18';
DECLARE		@date				AS		DATE	=	@start_date;
DECLARE		@start_time			AS		TIME	=	'13:30';
DECLARE		@start_time1		AS		TIME	=	'15:05';


DECLARE		@discipline			AS		SMALLINT=	(SELECT	discipline_id		FROM Disciplines	WHERE discipline_name LIKE N'%MS SQL SERVER%');
DECLARE		@lessons_count		AS		TINYINT	=	(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_name LIKE N'%MS SQL SERVER%');
DECLARE		@group				AS		INT		=	(SELECT group_id			FROM Groups			WHERE group_name='PD_411');
DECLARE		@teacher			AS		INT		=	(SELECT teacher_id			FROM Teachers		WHERE first_name=N'Юыху');

PRINT		(@start_date);
PRINT		(@discipline);
PRINT		(@lessons_COUNT);
PRINT		(@group);
PRINT		(@teacher);
PRINT		('========================================');

DECLARE		@lesson_number		AS		INT		=	1;

WHILE(@lesson_number < @lessons_count)
BEGIN		
		PRINT(@date);
		
		PRINT(DATENAME(WEEKDAY, @date));
		
		PRINT(@lesson_number);

		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline, @teacher, @date, @start_time);
		
		SET @lesson_number = @lesson_number+1;
		PRINT(DATEADD(MINUTE, 95, @start_time));

		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline, @teacher, @date, @start_time1);		
		
		SET @lesson_number = @lesson_number+1;
		SET @date = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date)=5,3,2), @date);
		PRINT('----------------------------------------------------------')
		
		
		--INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		--    VALUES (@lesson_number, @group, @discipline, @teacher, @date, @start_time1);


END

SELECT * FROM Schedule