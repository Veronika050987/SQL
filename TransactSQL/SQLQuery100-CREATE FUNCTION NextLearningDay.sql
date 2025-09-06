--SQLQuery100-CREATE FUNCTION GetNextLearningDay.sql
USE PD_321;
GO

ALTER FUNCTION GetNextLearningDay
(
	@group_name		NCHAR(10)
	--@date			DATE	= NULL --	(SELECT MAX([date]) FROM Schedule WHERE [group] = SELECT group_id FROM Groups WHERE group_name=@group_name));
)
RETURNS		DATE
AS
BEGIN
	DECLARE @group			AS INT			=	(SELECT group_id		FROM Groups		WHERE group_name	= @group_name);
	DECLARE @learning_days	AS TINYINT		=	(SELECT learning_days	FROM Groups		WHERE group_id		= @group);
	DECLARE @last_date		AS DATE			=	(SELECT MAX([date])		FROM Schedule	WHERE [group]		= @group);
	--PRINT(@last_date);
	--DECLARE	@last_day		AS TINYINT	=	DATEPART(WEEKDAY,@last_date);
	--PRINT(@last_day)
	DECLARE @next_date		AS	DATE		=	DATEADD(DAY, 1, @last_date);
	WHILE	dbo.IsLearningDay(@group_name, @next_date) = 0
	BEGIN
		SET @next_date	=	DATEADD(DAY, 1, @next_date);
	END
	RETURN	@next_date;
END