-- AULA 7: 2022.10.01
-- Atividade 4

CREATE DATABASE bd_Gravadora;

USE bd_Gravadora;

CREATE TABLE Gravadora (
	Grav_Cod int primary key auto_increment,
    Grav_Nome varchar(100) not null,
    Grav_End varchar(255)
);

CREATE TABLE Autor (
	Aut_Cod int primary key auto_increment,
    Aut_Nome varchar(100) not null
);

CREATE TABLE Album (
	Album_Cod int primary key auto_increment,
    CD_Grav_Cod int not null,
    CD_Nome varchar(100) not null,
    CD_Valor double(4,2),
    CD_Data_Lanc date,
    Foreign key (CD_Grav_Cod) references Gravadora (Grav_Cod)
);

CREATE TABLE Musica (
	Mus_Cod int primary key auto_increment,
    Mus_Nome varchar(100) not null,
    Mus_Duracao time not null,
    Mus_Faixa char(2) not null
);

CREATE TABLE Item_CD (
	Ite_Mus_Cod int not null,
    Ite_Album_Cod int not null,
    foreign key (Ite_Mus_Cod) references Musica (Mus_Cod),
    foreign key (Ite_Album_Cod) references Album (Album_Cod)
);

CREATE TABLE Musica_Autor (
	Mus_Cod int not null,
    Aut_Cod int not null,
    foreign key (Mus_Cod) references Musica (Mus_Cod),
    foreign key (Aut_Cod) references Autor (Aut_Cod)
);

-- AULA 7: 2022.10.29
-- Atividade 5

use bd_gravadora;

INSERT INTO Gravadora (Grav_Nome, Grav_End)
VALUES 
		("We Are Triumphant", "Boston, Massachusetts, EUA"),
        ("Sumerian Records", "Los Angeles, California, EUA"),
        ("Rise Records", "Portland, Oregon, EUA"),
        ("SharpTone Records", "Los Angeles, California, EUA"),
        ("Famined Records", "Los Angeles, California, EUA"),
        ("Fearless Records", "Los Angeles, California, EUA"),
        ("UNFD", "Melbourne, Australia");
        
SELECT * FROM Gravadora;

INSERT INTO Autor (Aut_Nome)
VALUES
		("Wvnder"),
        ("Galleons"),
        ("Asking Alexandria"),
        ("The Wise Man's Fear"),
        ("Hollow Front"),
        ("Windrunner"),
        ("Yours Truly");
        
SELECT * FROM Autor;

INSERT INTO Album (CD_Grav_Cod, CD_Nome, CD_Valor, CD_Data_Lanc)
VALUES
		(1, "Precipe", null, "2016-08-19"),
        (1, "Wander", null, "2014-08-25"),
        (2, "From Death to Destiny", null, "2013-08-03"),
        (2, "Asking Alexandria", null, "2017-12-15"),
        (5, "MAI", null, "2018-11-30"),
        (7, "Self Care", null, "2020-09-18"),
        (5, "Galleons", null, "2021-05-13");
        
SELECT * FROM Album;

INSERT INTO Musica (Mus_Nome, Mus_Duracao, Mus_Faixa)
VALUES
		("Afterimage", "00:04:30", "1"),
        ("Thanks a Lot", "00:03:07", "6"),
        ("Believe", "00:04:31", "7"),
        ("Into the Fire", "00:03:57", "2"),
        ("Orchid", "00:05:26", "5"),
        ("Siamese Souls", "00:04:22", "1"),
        ("Let's Pretend", "00:03:39", "5");
        
SELECT * FROM Musica;

INSERT INTO Item_CD (Ite_Mus_Cod, Ite_Album_Cod)
VALUES
		(1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (5, 5),
        (6, 6),
        (7, 7);
        
SELECT * FROM Item_CD;

INSERT INTO Musica_Autor (Mus_Cod, Aut_Cod)
VALUES
		(1, 1),
        (2, 1),
        (3, 3),
        (4, 3),
        (5, 6),
        (6, 7),
        (7, 2);
        
SELECT * FROM Musica_Autor;