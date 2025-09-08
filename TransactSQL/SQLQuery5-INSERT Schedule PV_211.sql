--SQLQuery5-INSERT Schedule PV_211.sql
USE PD_321;
GO

--DELETE FROM Schedule;
--SELECT * FROM Schedule;

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


DECLARE		@group				AS		INT		=	(SELECT group_id			FROM Groups			WHERE group_name='PV_211');
DECLARE		@teacher			AS		INT		=	(SELECT teacher_id			FROM Teachers		WHERE first_name=N'Олег');

PRINT		(@start_date1);
PRINT		(@discipline1);
PRINT		(@lessons_count1);
PRINT		(@group);
PRINT		(@teacher);
PRINT		('========================================');

DECLARE		@lesson_number		AS		INT		=	1;

WHILE @lesson_number <= (@lessons_count1 + 1)
BEGIN
		-- Генерируем занятия для Понедельника
	IF DATEPART(WEEKDAY, @date1) = 1 -- Понедельник
    BEGIN
		PRINT(@date1);
		PRINT(DATENAME(WEEKDAY, @date1));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline1, @teacher, @date1, @start_time);

		SET @lesson_number = @lesson_number+1;

        PRINT (DATEADD(MINUTE, 95, @start_time));
		
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline1, @teacher, @date1, @start_time1);

		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели
		PRINT('----------------------------------------------------------')
	END;

    -- Генерируем занятия для Четверга
	IF DATEPART(WEEKDAY, @date1) = 4
    BEGIN
		PRINT(@date1);
		PRINT(DATENAME(WEEKDAY, @date1));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline1, @teacher, @date1, @start_time); 
		
		SET @lesson_number = @lesson_number + 1;
		
        PRINT (DATEADD(MINUTE, 95, @start_time));
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline1, @teacher, @date1, @start_time1);

		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели

		PRINT('----------------------------------------------------------')
	END;

    -- Генерируем занятия для Пятницы
	IF DATEPART(WEEKDAY, @date1) = 5
    BEGIN
		PRINT(@date1);
		PRINT(DATENAME(WEEKDAY, @date1));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline1, @teacher, @date1, @start_time);

		SET @lesson_number = @lesson_number+1;

        PRINT (DATEADD(MINUTE, 95, @start_time));
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline1, @teacher, @date1, @start_time1);
		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели
		PRINT('----------------------------------------------------------')
	END;


END

PRINT('==========================================================')

PRINT		(@start_date2);
PRINT		(@discipline2);
PRINT		(@lessons_count2);
PRINT		(@group);
PRINT		(@teacher);
PRINT		('========================================');

WHILE @lesson_number <= (@lessons_count2 + @lesson_number + 1 )
BEGIN
		-- Генерируем занятия для Понедельника
	IF DATEPART(WEEKDAY, @date2) = 1 -- Понедельник
    BEGIN
		PRINT(@date2);
		PRINT(DATENAME(WEEKDAY, @date2));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline2, @teacher, @date2, @start_time);

		SET @lesson_number = @lesson_number+1;

        PRINT (DATEADD(MINUTE, 95, @start_time));
		
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline2, @teacher, @date2, @start_time1);

		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count2 + @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели
		PRINT('----------------------------------------------------------')
	END;

    -- Генерируем занятия для Четверга
	IF DATEPART(WEEKDAY, @date2) = 4
    BEGIN
		PRINT(@date2);
		PRINT(DATENAME(WEEKDAY, @date2));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline2, @teacher, @date2, @start_time); 
		
		SET @lesson_number = @lesson_number + 1;
		
        PRINT (DATEADD(MINUTE, 95, @start_time));
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline2, @teacher, @date2, @start_time1);

		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count2 + @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели

		PRINT('----------------------------------------------------------')
	END;

    -- Генерируем занятия для Пятницы
	IF DATEPART(WEEKDAY, @date2) = 5
    BEGIN
		PRINT(@date2);
		PRINT(DATENAME(WEEKDAY, @date2));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline2, @teacher, @date2, @start_time);

		SET @lesson_number = @lesson_number+1;

        PRINT (DATEADD(MINUTE, 95, @start_time));
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline2, @teacher, @date2, @start_time1);
		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count2 + @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели
		PRINT('----------------------------------------------------------')
	END;

	SET @date2 = DATEADD(DAY, 1, @date2);
END

PRINT('==========================================================')

PRINT		(@start_date3);
PRINT		(@discipline3);
PRINT		(@lessons_count3);
PRINT		(@group);
PRINT		(@teacher);
PRINT		('========================================');

WHILE @lesson_number <= (@lessons_count3 + @lessons_count2 + @lessons_count1 + 1 )
BEGIN
		-- Генерируем занятия для Понедельника
	IF DATEPART(WEEKDAY, @date3) = 1 -- Понедельник
    BEGIN
		PRINT(@date3);
		PRINT(DATENAME(WEEKDAY, @date3));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline3, @teacher, @date3, @start_time);

		SET @lesson_number = @lesson_number+1;

        PRINT (DATEADD(MINUTE, 95, @start_time));
		
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline3, @teacher, @date3, @start_time1);

		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count3 + @lessons_count2 + @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели
		PRINT('----------------------------------------------------------')
	END;

    -- Генерируем занятия для Четверга
	IF DATEPART(WEEKDAY, @date3) = 4
    BEGIN
		PRINT(@date3);
		PRINT(DATENAME(WEEKDAY, @date3));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline3, @teacher, @date3, @start_time); 
		
		SET @lesson_number = @lesson_number + 1;
		
        PRINT (DATEADD(MINUTE, 95, @start_time));
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline3, @teacher, @date3, @start_time1);

		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count3 + @lessons_count2 + @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели

		PRINT('----------------------------------------------------------')
	END;

    -- Генерируем занятия для Пятницы
	IF DATEPART(WEEKDAY, @date3) = 5
    BEGIN
		PRINT(@date3);
		PRINT(DATENAME(WEEKDAY, @date3));
		PRINT(@lesson_number);
		PRINT(@start_time);
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline3, @teacher, @date3, @start_time);

		SET @lesson_number = @lesson_number+1;

        PRINT (DATEADD(MINUTE, 95, @start_time));
		INSERT INTO Schedule (lesson_id, [group], discipline, teacher, [date], [time]) 
		    VALUES (@lesson_number, @group, @discipline3, @teacher, @date3, @start_time1);
		SET @lesson_number = @lesson_number + 1;
		IF @lesson_number >= @lessons_count3 + @lessons_count2 + @lessons_count1 + 1 BREAK; -- Выходим, если достигли цели
		PRINT('----------------------------------------------------------')
	END;

	SET @date3 = DATEADD(DAY, 1, @date3);	
	IF (@date3	>=	'2025-05-01' AND @date3	<=	'2025-05-09')
		BEGIN
			SET	@date3 = DATEADD(DAY, 9, @date3);
			CONTINUE;
		END
END

PRINT('==========================================================')

--SELECT * FROM Schedule