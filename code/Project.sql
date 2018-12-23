DROP TABLE IF EXISTS Teams;

/*
5 Таблиц: teams, players, championships, plays, coaches
*/

CREATE TABLE IF NOT EXISTS Teams(
team_ID INTEGER
NOT NULL PRIMARY KEY 

AUTOINCREMENT,
name VARCHAR(30)
NOT NULL,
country VARCHAR(20)
NULL,
year_ INTEGER CHECK (1850 < year_ 

AND year_ < 2018)
NOT NULL,
additial_info TEXT
NULL
);

DROP TABLE IF EXISTS Players;

CREATE TABLE PLayers(
player_ID INTEGER
NOT NULL PRIMARY KEY 

AUTOINCREMENT,
team_ID INTEGER
NOT NULL,
name VARCHAR(30)
NOT NULL,
surname VARCHAR(30) NOT
NULL,
birth_year INTEGER CHECK (1970 < 

birth_year AND birth_year < 2000)
NOT NULL,
amplua TEXT
NOT NULL,
notes TEXT,
FOREIGN KEY (team_ID)
REFERENCES Teams (team_ID)
);

DROP TABLE IF EXISTS 

Championships;

CREATE TABLE Championships(
championship_ID INTEGER
NOT NULL PRIMARY KEY 

AUTOINCREMENT,
name
VARCHAR(50) NOT NULL,
country
VARCHAR(20),
year_ INTEGER NOT
NULL, CHECK (1900 < year_ and 

year_ < 2025)
);

DROP TABLE IF EXISTS Plays;

CREATE TABLE Plays(
  play_ID INTEGER PRIMARY KEY 

AUTOINCREMENT,
  championship_ID INTEGER NOT 

NULL,
  host_team_ID INTEGER NOT NULL,
  guest_team_ID INTEGER NOT NULL,
  result VARCHAR(20) NOT NULL 

CHECK (result = 'IN PROGRESS' OR 

result = 'HOST WON' OR result = 

'GUEST WON'),
FOREIGN KEY (championship_ID) 

REFERENCES Championships 

(championship_ID),
FOREIGN KEY (host_team_ID) 

REFERENCES Teams (team_ID),
FOREIGN KEY (guest_team_ID) 

REFERENCES Teams (team_ID)
);

DROP TABLE IF EXISTS Coaches;

CREATE TABLE Coaches(
coach_ID INTEGER PRIMARY KEY 

AUTOINCREMENT,
team_ID INTEGER NOT NULL,
name VARCHAR(20),
surname VARCHAR(20),
qualification VARCHAR(1)
CHECK(qualification = 'A' OR
qualification = 'B' OR
qualification = 'C'),
FOREIGN KEY (team_ID) REFERENCES
Teams (team_ID)
);


/*
Пример корректных данных
*/

INSERT INTO Teams (name, country, 

year_, additial_info) VALUES 

('REAL MADRID', 'Spain', 1902, 

'Current Champion (2017)');
INSERT INTO Teams (name, country, 

year_) VALUES ('LIVERPOOL', 

'England', 1892);
INSERT INTO Teams (name, country, 

year_) VALUES ('ROMA', 'Italy', 

1927);
INSERT INTO Teams (name, country, 

year_, additial_info) VALUES 

('BAVARIA', 'Germany', 1900, 'The 

best German footbal team.');

INSERT INTO Players (team_ID, 

name, surname, birth_year, 

amplua) VALUES (1, 'Christiano', 

'Ronaldo', 1985, 'forward');
INSERT INTO Players (team_ID, 

name, surname, birth_year, 

amplua) VALUES (4, 'Robert', 

'Levandovcki', 1988, 'forward');
INSERT INTO Players (team_ID, 

name, surname, birth_year, 

amplua) VALUES (4, 'Manuel', 

'Noyer', 1986, 'goalkeeper');
INSERT INTO Players (team_ID, 

name, surname, birth_year, 

amplua) VALUES (4, 'David', 

'Alaba', 1992, 'defender');
INSERT INTO Players (team_ID, 

name, surname, birth_year, 

amplua) VALUES (1, 'Garet', 

'Bale', 1989, 'forward');
INSERT INTO Players (team_ID, 

name, surname, birth_year, 

amplua) VALUES (2, 'Mohamed', 

'Salakh', 1992, 'forward');
INSERT INTO Players (team_ID, 

name, surname, birth_year, 

amplua) VALUES (3, 'Patrik', 

'Sheek', 1996, 'forward');

INSERT INTO Championships 

(country, name, year_) VALUES 

('EUROPE', 'Champions League', 

2018);

INSERT INTO Plays 

(championship_ID, host_team_ID, 

guest_team_ID, result) VALUES (1, 

1, 2, 'IN PROGRESS');

INSERT INTO Coaches (team_ID, 

name, surname) VALUES (2, 

'Urgen', 'Clopp');

/*
Вывод таблиц
*/

SELECT 'Teams';
SELECT * FROM Teams;

SELECT '';
SELECT 'Players';
SELECT * FROM Players;

SELECT '';
SELECT 'Championships';
SELECT * from Championships;

SELECT '';
SELECT 'Plays';
SELECT * from Plays;

SELECT '';
SELECT 'Coaches';
SELECT * from Coaches;
