--SQLQuery3-INSERT FROM PD_411.sql
USE PD_321;
GO

--INSERT INTO 
--	Groups (group_id, group_name, direction)
--	VALUES (24, N'PD_411', 1);

--INSERT INTO 
--	PD_321.dbo.Students (last_name, first_name, middle_name, birth_date, [group])
--SELECT last_name, first_name, middle_name, birth_date, [group] FROM PD_411.dbo.Students; 

SELECT COUNT(stud_id) AS N'���������� ���������', [group] AS N'����� ������'
FROM Students
GROUP BY [group];

--SELECT COUNT(s.stud_id) AS N'���������� ���������'
----, g.group_id AS N'����� ������'
--, g.direction AS N'�����������'
--FROM Students AS s, Groups AS g, Directions AS d
--WHERE  g.group_id = s.[group]
--GROUP BY g.direction
--;