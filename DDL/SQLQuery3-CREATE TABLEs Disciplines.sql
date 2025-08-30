USE PD_411_SQL;
GO

--CREATE TABLE Disciplines
--(
--	discipline_id		INT				PRIMARY KEY,
--	discipline_name		NVARCHAR(256)	NOT NULL,
--	number_of_lessons	TINYINT			NOT NULL
--);

CREATE TABLE TeachersDisciplinesRelation
(
	teacher		INT,
	discipline	INT,
	PRIMARY KEY (teacher,discipline),
	CONSTRAINT FK_TDR_Teachers		FOREIGN KEY (teacher)			REFERENCES Teachers(teacher_id),
	CONSTRAINT FK_TDR_Disciplines	FOREIGN KEY (discipline)		REFERENCES Disciplines(discipline_id)
);