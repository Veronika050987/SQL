--SQLQuery7-HolidaysCheck.sql
USE PD_321;
GO
SET DATEFIRST 1;

--;
EXEC sp_SetDaysOff 2026;
SELECT * FROM DaysOFF;

