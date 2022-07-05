--1 Was sind Indexes?--
/*
Die Suche in einem Datenbankindex entspricht am ehesten der Suche in einem Duden. 
Das Grundkonzept ist, dass die Eintr�ge in einer wohldefinierten Reihenfolge vorliegen. 
Wenn die Daten sortiert sind, kann man einzelne Eintr�ge schnell finden, 
da sich die Position des Eintrags aus der Sortierreihenfolge ergibt.
*/
--Vorbereitung--
USE master
go
DROP DATABASE Indizes
CREATE DATABASE  Indizes
use Indizes
go
create table Movies(
	Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Title varchar(50)
);
DECLARE @cnt INT = 0;
WHILE @cnt < 100000
BEGIN
   insert into Movies (Title) values (concat('Movie', str(@cnt)));
   SET @cnt = @cnt + 1;
END;
go

--2 Indexes Erstellen/L�schen--
CREATE INDEX title_index ON Movies (Title);

--3 Indexes dauer beurteilen

GO         
SET STATISTICS TIME ON;  
GO  
SELECT * 
FROM Movies
WHERE Title = 'Movie12345';
GO  
SET STATISTICS TIME OFF;  
GO
/* Mann sieht bei Messages die Dauer*/
--4 Vergleich indexes bei viel datens�tze--
/*
1: "3 Indexes dauer beurteilen" Skript ausf�hren und dauer notieren
2: Skript f�r 100000 datens�tze generieren ausf�hren
3: "3 Indexes dauer beurteilen" Skript ausf�hren und dauer notieren
*/