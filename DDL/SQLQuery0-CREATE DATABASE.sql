CREATE DATABASE PD_411_SQL
ON		-- параметр ON задаёт свойство файла создаваемой базы
(
	NAME		= PD_411_SQL, --ЛОГИЧЕСКОЕ ИМЯ ФАЙЛА
	FILENAME	= 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\PD_411_SQL.mdf',--ФИЗИЧЕСКОЕ ИМЯ ФАЙЛА
	SIZE		= 8MB,
	MAXSIZE		= 500MB,
	FILEGROWTH	= 5MB
)
LOG ON	-- этот параметр задаёт свойство файла журнала базы данных
(
	NAME		= PD_411_SQL_Log,
	FILENAME	= 'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\PD_411_SQL_log.ldf',--ФИЗИЧЕСКОЕ ИМЯ ФАЙЛА
	SIZE		= 8MB,
	MAXSIZE		= 500MB,
	FILEGROWTH	= 8MB
);
GO		-- применить