DECLARE @StartTime TIME(0) = '13:30:00'; -- Начало первой пары
DECLARE @PairDuration INT = 95; -- Длительность одной пары в минутах
DECLARE @BreakDuration INT = 10; -- Длительность перерыва между парами в минутах
DECLARE @TargetLessons INT = 20; -- Общее количество занятий

-- Объявляем временную таблицу для хранения расписания
IF OBJECT_ID('tempdb..#Schedule_tmp') IS NOT NULL DROP TABLE #Schedule_tmp;
CREATE TABLE #Schedule_tmp (
    Date DATE,
    DayOfWeek VARCHAR(20),
    PairNumber INT,
    StartTime TIME(0),
    EndTime TIME(0),
    Description VARCHAR(50)
);

-- Объявляем переменные для цикла
DECLARE @CurrentDate DATE = DATEADD(wk,DATEDIFF(wk,0,GETDATE()),0); -- Начинаем с ближайшего понедельника
DECLARE @LessonCounter INT = 0; -- Счетчик сгенерированных занятий

-- Цикл для генерации занятий до достижения целевого количества
WHILE @LessonCounter < @TargetLessons
BEGIN
    -- Проверяем, является ли текущий день нужным днем недели
    -- DATEPART(WEEKDAY, @CurrentDate) = 2 для Понедельника (по умолчанию)
    -- DATEPART(WEEKDAY, @CurrentDate) = 5 для Четверга (по умолчанию)
    -- DATEPART(WEEKDAY, @CurrentDate) = 6 для Пятницы (по умолчанию)

    -- Генерируем занятия для Понедельника
    IF DATEPART(WEEKDAY, @CurrentDate) = 2 -- Понедельник
    BEGIN
        -- Пара 1
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            'Понедельник',
            1,
            @StartTime,
            DATEADD(MINUTE, @PairDuration, @StartTime),
            'Пара 1'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- Выходим, если достигли цели

        -- Пара 2
        DECLARE @SecondPairStartTime TIME(0) = DATEADD(MINUTE, @PairDuration + @BreakDuration, @StartTime);
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            'Понедельник',
            2,
            @SecondPairStartTime,
            DATEADD(MINUTE, @PairDuration, @SecondPairStartTime),
            'Пара 2'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- Выходим, если достигли цели
    END;

    -- Генерируем занятия для Четверга
    IF DATEPART(WEEKDAY, @CurrentDate) = 5 -- Четверг
    BEGIN
        -- Пара 1
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            'Четверг',
            1,
            @StartTime,
            DATEADD(MINUTE, @PairDuration, @StartTime),
            'Пара 1'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- Выходим, если достигли цели

        -- Пара 2
        SET @SecondPairStartTime = DATEADD(MINUTE, @PairDuration + @BreakDuration, @StartTime);
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            'Четверг',
            2,
            @SecondPairStartTime,
            DATEADD(MINUTE, @PairDuration, @SecondPairStartTime),
            'Пара 2'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- Выходим, если достигли цели
    END;

    -- Генерируем занятия для Пятницы
    IF DATEPART(WEEKDAY, @CurrentDate) = 6 -- Пятница
    BEGIN
        -- Пара 1
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            'Пятница',
            1,
            @StartTime,
            DATEADD(MINUTE, @PairDuration, @StartTime),
            'Пара 1'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- Выходим, если достигли цели

        -- Пара 2
        SET @SecondPairStartTime = DATEADD(MINUTE, @PairDuration + @BreakDuration, @StartTime);
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            'Пятница',
            2,
            @SecondPairStartTime,
            DATEADD(MINUTE, @PairDuration, @SecondPairStartTime),
            'Пара 2'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- Выходим, если достигли цели
    END;

    -- Переходим к следующему дню
    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END;

-- Выбираем данные из временной таблицы
SELECT
    Date AS Дата,
    DayOfWeek AS День_Недели,
    PairNumber AS Номер_Пары,
    StartTime AS Время_начала,
    EndTime AS Время_окончания,
    Description AS Описание
FROM #Schedule_tmp
ORDER BY Date, PairNumber;