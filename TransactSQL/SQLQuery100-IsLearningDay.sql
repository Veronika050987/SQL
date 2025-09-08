----SQLQuery100-IsLearningDay.sql
USE PD_321;
GO

CREATE FUNCTION IsLearningDay
(
	@group_name		AS		NCHAR(10),
	@date			AS		DATE
)
RETURNS BIT
AS
BEGIN
	DECLARE		@group			AS INT		=	(SELECT group_id		FROM Groups WHERE group_name = @group_name);
	DECLARE		@learning_days	AS TINYINT	=	(SELECT learning_days FROM Groups WHERE group_id = @group); 
	DECLARE		@week_day		AS TINYINT  =	DATEPART(WEEKDAY, @date);
	DECLARE		@exponent		AS TINYINT	=	@week_day-1;
	--DECLARE		@learning_day   AS BIT		=	@learning_days & POWER(2, @exponent);
	RETURN		@learning_days & POWER(2, @exponent);
	--RETURN		@learning_day;
END