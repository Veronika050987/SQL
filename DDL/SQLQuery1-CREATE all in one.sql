﻿CREATE DATABASE PD_411_all_in_one
ON		-- параметр ON задаёт свойство файла создаваемой базы
(
	NAME		= PD_411_all_in_one, --ЛОГИЧЕСКОЕ ИМЯ ФАЙЛА
	FILENAME	= 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\PD_411_all_in_one.mdf',--ФИЗИЧЕСКОЕ ИМЯ ФАЙЛА
	SIZE		= 8MB,
	MAXSIZE		= 500MB,
	FILEGROWTH	= 5MB
)
LOG ON	-- этот параметр задаёт свойство файла журнала базы данных
(
	NAME		= PD_411_all_in_one_Log,
	FILENAME	= 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\PD_411_all_in_one_log.ldf',--ФИЗИЧЕСКОЕ ИМЯ ФАЙЛА
	SIZE		= 8MB,
	MAXSIZE		= 500MB,
	FILEGROWTH	= 8MB
);
GO		-- применить

USE PD_411_all_in_one;
GO

----------------------------------------------

CREATE TABLE Directions
(
	direction_id	TINYINT			PRIMARY KEY,
	directio_name	NVARCHAR(256)	NOT NULL  
);
CREATE TABLE Groups
(
	group_id		INT				PRIMARY KEY,
	group_name		NVARCHAR(16)	NOT NULL,
	direction		TINYINT			NOT NULL
	CONSTRAINT FK_Groups_Directions FOREIGN KEY REFERENCES Directions(direction_id)
);
CREATE TABLE Students
(	
	student_id		INT				PRIMARY KEY,
	last_name		NVARCHAR(150)	NOT NULL,
	first_name		NVARCHAR(150)	NOT NULL,
	middle_name		NVARCHAR(150),
	birth_date		DATE			NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT FK_Students_Groups	FOREIGN KEY REFERENCES Groups(group_id)
);
CREATE TABLE Teachers
(
	teacher_id		INT				PRIMARY KEY,
	last_name		NVARCHAR(150)	NOT NULL,
	first_name		NVARCHAR(150)	NOT NULL,
	middle_name		NVARCHAR(150),
	birth_date		DATE			NOT NULL,
	work_since		DATE			NOT NULL
);
CREATE TABLE Disciplines
(
	discipline_id		INT				PRIMARY KEY,
	discipline_name		NVARCHAR(256)	NOT NULL,
	number_of_lessons	TINYINT			NOT NULL
);
CREATE TABLE TeachersDisciplinesRelation
(
	teacher		INT,
	discipline	INT,
	PRIMARY KEY (teacher,discipline),
	CONSTRAINT FK_TDR_Teachers		FOREIGN KEY (teacher)			REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_TDR_Disciplines	FOREIGN KEY (discipline)		REFERENCES Disciplines(discipline_id)
);
CREATE TABLE Schedule
(
	lesson_id		BIGINT			PRIMARY KEY,
	[date]			DATE			NOT NULL,
	[time]			TIME			NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT		FK_Schedule_Groups	FOREIGN KEY REFERENCES Groups(group_id),
	discipline		INT				NOT NULL
	CONSTRAINT		FK_Schedule_Disciplines FOREIGN KEY REFERENCES Disciplines(discipline_id),
	teacher			INT				NOT NULL
	CONSTRAINT		FK_Schedule_Teachers	FOREIGN KEY REFERENCES Teachers(teacher_id),
	[status]		BIT				NOT NULL,
	[subject]		NVARCHAR(256)	
);

CREATE TABLE Grades
(
	student		INT,
	lesson		BIGINT,
	PRIMARY KEY(student,lesson),
	CONSTRAINT  FK_Grades_Students	FOREIGN KEY (student)	REFERENCES Students(student_id),
	CONSTRAINT	FK_Grades_Schedule	FOREIGN KEY (lesson)	REFERENCES Schedule(lesson_id),
	grade_1		TINYINT
	CONSTRAINT CK_Grade_1	CHECK	(grade_1 > 0 AND grade_1 <= 12),
	grade_2		TINYINT
	CONSTRAINT CK_Grade_2	CHECK	(grade_2 > 0 AND grade_2 <= 12),
);