--SQLQuery3-INSERT Schedule PD_411.sql
USE PD_321;
GO

SET DATEFIRST 1;

DECLARE		@start_date1		AS		DATE	=	'2025-01-27';
DECLARE		@start_date2		AS		DATE	=	'2025-04-07';
DECLARE		@start_date3		AS		DATE	=	'2025-04-28';

DECLARE		@date1				AS		DATE	=	@start_date1;
DECLARE		@date2				AS		DATE	=	@start_date2;
DECLARE		@date3				AS		DATE	=	@start_date3;

DECLARE		@start_time			AS		TIME	=	'13:30';
DECLARE		@start_time1		AS		TIME	=	'15:05';


DECLARE		@discipline1		AS		SMALLINT=	(SELECT	discipline_id		FROM Disciplines	WHERE discipline_name LIKE N'%MS SQL SERVER%');
DECLARE		@lessons_count1		AS		TINYINT	=	(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_name LIKE N'%MS SQL SERVER%');

DECLARE		@discipline2		AS		SMALLINT=	(SELECT	discipline_id		FROM Disciplines	WHERE discipline_name LIKE N'%UML%');
DECLARE		@lessons_count2		AS		TINYINT	=	(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_name LIKE N'%UML%');

DECLARE		@discipline3		AS		SMALLINT=	(SELECT	discipline_id		FROM Disciplines	WHERE discipline_name LIKE N'%приложений на языке C#%');
DECLARE		@lessons_count3		AS		TINYINT	=	(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_name LIKE N'%приложений на языке C#%');


DECLARE		@group				AS		INT		=	(SELECT group_id			FROM Groups			WHERE group_name='PD_411');
DECLARE		@teacher			AS		INT		=	(SELECT teacher_id			FROM Teachers		WHERE first_name=N'Олег');

PRINT		(@start_date1);
PRINT		(@discipline1);
PRINT		(@lessons_COUNT1);
PRINT		(@group);
PRINT		(@teacher);
PRINT		('========================================');

DECLARE		@lesson_number		AS		INT		=	26;

WHILE(@lesson_number < @lessons_count1 + 26)
BEGIN		
		PRINT(@date1);
		
		PRINT(DATENAME(WEEKDAY, @date1));
		
		PRINT(@lesson_number);

		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline1, @teacher, @date1, @start_time);
		
		SET @lesson_number = @lesson_number+1;
		PRINT(DATEADD(MINUTE, 95, @start_time));

		
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline1, @teacher, @date1, @start_time1);		
		
		SET @lesson_number = @lesson_number+1;
		SET @date1 = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date1)=5,3,2), @date1);
		PRINT('----------------------------------------------------------')
		
END

PRINT('==========================================================')
PRINT		(@start_date2);
PRINT		(@discipline2);
PRINT		(@lessons_COUNT2);
PRINT		(@group);
PRINT		(@teacher);
PRINT('----------------------------------------------------------')

WHILE(@lesson_number < @lessons_count2 + @lessons_count1 + 26)
BEGIN		
		PRINT(@date2);
		
		PRINT(DATENAME(WEEKDAY, @date2));
		
		PRINT(@lesson_number);

		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline2, @teacher, @date2, @start_time);
		
		SET @lesson_number = @lesson_number+1;
		PRINT(DATEADD(MINUTE, 95, @start_time));

		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline2, @teacher, @date2, @start_time1);		
		
		SET @lesson_number = @lesson_number+1;
		SET @date2 = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date2)=5,3,2), @date2);
		PRINT('----------------------------------------------------------')
		
END

PRINT('==========================================================')
PRINT		(@start_date3);
PRINT		(@discipline3);
PRINT		(@lessons_COUNT3);
PRINT		(@group);
PRINT		(@teacher);
PRINT('----------------------------------------------------------')

WHILE(@lesson_number < @lessons_count3 + @lessons_count2 + @lessons_count1 + 26)
BEGIN		
		PRINT(@date3);
		
		PRINT(DATENAME(WEEKDAY, @date3));
		
		PRINT(@lesson_number);

		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline3, @teacher, @date3, @start_time);
		
		SET @lesson_number = @lesson_number+1;
		PRINT(DATEADD(MINUTE, 95, @start_time));

		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline3, @teacher, @date3, @start_time1);		
		
		SET @lesson_number = @lesson_number+1;
		SET @date3 = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date3)=5,3,2), @date3);
		PRINT('----------------------------------------------------------')
		
END

SELECT * FROM Schedule