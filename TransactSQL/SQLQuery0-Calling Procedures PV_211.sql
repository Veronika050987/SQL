SET DATEFIRST 1;
USE PD_321;
GO

--DELETE FROM Schedule;
EXEC sp_AddSchedule_PV_211 N'PV_211', N'%MS SQL Server%', N'Ковтун', '2025-08-18', '13:30';
EXEC sp_SelectSchedule_PV_211 N'PD_411', N'%ADO.NET%', N'Ковтун';
EXEC sp_SelectSchedule;
PRINT(dbo.GetNextLearningDay(N'PV_211', NULL));
PRINT(N'-----------------------------');
PRINT(dbo.IsLearningDay(N'PV_211', '2025-09-05'));
PRINT(dbo.GetNextLearningDay(N'PD_211'));