--SQLQuery2.sql
USE PD_321;
GO

--SELECT columns FROM tables;

--SELECT	
--		direction_id		AS	N'Номер направления',
--		direction_name		AS	N'Название'
--FROM	Directions;

----INSERT	Groups
----		(group_id,group_name,direction)
----VALUES	(34,N'SU_511',2);

--SELECT
--		group_name			AS	N'Название группы',
--		direction_name		AS	N'Направление обучения'
--FROM	Groups,Directions
--WHERE	direction	=	direction_id
--AND		direction	LIKE(N'Сетевые технологи%')
--;
----% - все возможные символы

--SELECT
--		last_name + '' + first_name + '' + middle_name AS N'Студент',
--		group_name AS N'Группа',
--		direction_name AS N'Направление обучения'
--FROM	Students,Groups,Directions
--WHERE	[group]		= group_id
--AND		direction	= direction_id
--;
--

SELECT 
	COUNT(stud_id) AS N'Количество студентов'
FROM Students;