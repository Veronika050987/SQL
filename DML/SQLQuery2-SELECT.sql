--SQLQuery2.sql
USE PD_321;
GO

--SELECT columns FROM tables;

--SELECT	
--		direction_id		AS	N'����� �����������',
--		direction_name		AS	N'��������'
--FROM	Directions;

----INSERT	Groups
----		(group_id,group_name,direction)
----VALUES	(34,N'SU_511',2);

--SELECT
--		group_name			AS	N'�������� ������',
--		direction_name		AS	N'����������� ��������'
--FROM	Groups,Directions
--WHERE	direction	=	direction_id
--AND		direction	LIKE(N'������� ���������%')
--;
----% - ��� ��������� �������

--SELECT
--		last_name + '' + first_name + '' + middle_name AS N'�������',
--		group_name AS N'������',
--		direction_name AS N'����������� ��������'
--FROM	Students,Groups,Directions
--WHERE	[group]		= group_id
--AND		direction	= direction_id
--;
--

SELECT 
	COUNT(stud_id) AS N'���������� ���������'
FROM Students;