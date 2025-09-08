DECLARE @StartTime TIME(0) = '13:30:00'; -- ������ ������ ����
DECLARE @PairDuration INT = 95; -- ������������ ����� ���� � �������
DECLARE @BreakDuration INT = 10; -- ������������ �������� ����� ������ � �������
DECLARE @TargetLessons INT = 20; -- ����� ���������� �������

-- ��������� ��������� ������� ��� �������� ����������
IF OBJECT_ID('tempdb..#Schedule_tmp') IS NOT NULL DROP TABLE #Schedule_tmp;
CREATE TABLE #Schedule_tmp (
    Date DATE,
    DayOfWeek VARCHAR(20),
    PairNumber INT,
    StartTime TIME(0),
    EndTime TIME(0),
    Description VARCHAR(50)
);

-- ��������� ���������� ��� �����
DECLARE @CurrentDate DATE = DATEADD(wk,DATEDIFF(wk,0,GETDATE()),0); -- �������� � ���������� ������������
DECLARE @LessonCounter INT = 0; -- ������� ��������������� �������

-- ���� ��� ��������� ������� �� ���������� �������� ����������
WHILE @LessonCounter < @TargetLessons
BEGIN
    -- ���������, �������� �� ������� ���� ������ ���� ������
    -- DATEPART(WEEKDAY, @CurrentDate) = 2 ��� ������������ (�� ���������)
    -- DATEPART(WEEKDAY, @CurrentDate) = 5 ��� �������� (�� ���������)
    -- DATEPART(WEEKDAY, @CurrentDate) = 6 ��� ������� (�� ���������)

    -- ���������� ������� ��� ������������
    IF DATEPART(WEEKDAY, @CurrentDate) = 2 -- �����������
    BEGIN
        -- ���� 1
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            '�����������',
            1,
            @StartTime,
            DATEADD(MINUTE, @PairDuration, @StartTime),
            '���� 1'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- �������, ���� �������� ����

        -- ���� 2
        DECLARE @SecondPairStartTime TIME(0) = DATEADD(MINUTE, @PairDuration + @BreakDuration, @StartTime);
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            '�����������',
            2,
            @SecondPairStartTime,
            DATEADD(MINUTE, @PairDuration, @SecondPairStartTime),
            '���� 2'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- �������, ���� �������� ����
    END;

    -- ���������� ������� ��� ��������
    IF DATEPART(WEEKDAY, @CurrentDate) = 5 -- �������
    BEGIN
        -- ���� 1
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            '�������',
            1,
            @StartTime,
            DATEADD(MINUTE, @PairDuration, @StartTime),
            '���� 1'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- �������, ���� �������� ����

        -- ���� 2
        SET @SecondPairStartTime = DATEADD(MINUTE, @PairDuration + @BreakDuration, @StartTime);
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            '�������',
            2,
            @SecondPairStartTime,
            DATEADD(MINUTE, @PairDuration, @SecondPairStartTime),
            '���� 2'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- �������, ���� �������� ����
    END;

    -- ���������� ������� ��� �������
    IF DATEPART(WEEKDAY, @CurrentDate) = 6 -- �������
    BEGIN
        -- ���� 1
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            '�������',
            1,
            @StartTime,
            DATEADD(MINUTE, @PairDuration, @StartTime),
            '���� 1'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- �������, ���� �������� ����

        -- ���� 2
        SET @SecondPairStartTime = DATEADD(MINUTE, @PairDuration + @BreakDuration, @StartTime);
        INSERT INTO #Schedule_tmp (Date, DayOfWeek, PairNumber, StartTime, EndTime, Description)
        VALUES (
            @CurrentDate,
            '�������',
            2,
            @SecondPairStartTime,
            DATEADD(MINUTE, @PairDuration, @SecondPairStartTime),
            '���� 2'
        );
        SET @LessonCounter = @LessonCounter + 1;
        IF @LessonCounter >= @TargetLessons BREAK; -- �������, ���� �������� ����
    END;

    -- ��������� � ���������� ���
    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END;

-- �������� ������ �� ��������� �������
SELECT
    Date AS ����,
    DayOfWeek AS ����_������,
    PairNumber AS �����_����,
    StartTime AS �����_������,
    EndTime AS �����_���������,
    Description AS ��������
FROM #Schedule_tmp
ORDER BY Date, PairNumber;