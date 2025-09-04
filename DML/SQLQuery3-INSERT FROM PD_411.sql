--SQLQuery3-INSERT FROM PD_411.sql
USE PD_321;
GO

--INSERT INTO 
--	Groups (group_id, group_name, direction)
--	VALUES (24, N'PD_411', 1);

--INSERT INTO 
--	PD_321.dbo.Students (last_name, first_name, middle_name, birth_date, [group])
--SELECT last_name, first_name, middle_name, birth_date, [group] FROM PD_411.dbo.Students; 

--SELECT COUNT(stud_id) AS N'Количество студентов', [group] AS N'Номер группы'
--FROM Students
--GROUP BY [group];

SELECT  COUNT(s.stud_id) AS N'Количество студентов' 
, g.direction AS N'Направление' 
--, d.direction_name
--, g.group_id AS N'Номер группы'
FROM Students AS s, Groups AS g, Directions AS d
WHERE   (s.[group] = g.group_id and g.direction = d.direction_id)
GROUP BY g.direction
;

SELECT s.[group], COUNT(s.stud_id) AS N'Количество студентов'
FROM Students AS s
JOIN Groups AS gr ON  s.[group] = gr.group_id
GROUP BY s.[group];  


