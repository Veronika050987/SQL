SET DATEFIRST 1;
USE PD_321;
GO

--DELETE FROM Schedule;
--SELECT * FROM Schedule; 
--EXEC sp_AddSchedule N'PD_411', N'%MS SQL Server%', N'������', '2024-12-23', '13:30';
--EXEC sp_AddSchedule N'PD_411', N'%ADO.NET%', N'������';
--EXEC sp_AddSchedule N'PD_411', N'��������� ����������������%', N'������';
--EXEC sp_AddSchedule N'PD_411', N'������� ����������������%', N'������', '2025-08-18', '13:30';
--EXEC sp_AddSchedule N'PD_411', N'HTML/CSS%', N'������', '2025-08-18', '13:30';
--EXEC sp_SelectSchedule;
--EXEC sp_InsertIntoCompleteDisciplines;

--PRINT(dbo.GetNextLearningDay(N'PD_411', NULL));
--PRINT(N'-----------------------------');
--PRINT(dbo.IsLearningDay(N'PD_411', '2025-09-12'));
--PRINT(dbo.GetNextLearningDay(N'PD_411', DEFAULT));

EXEC	dbo.sp_SelectSchedule;