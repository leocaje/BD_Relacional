-- AULA 4. 2022.09.09

create database bd_Faculdade;

use bd_Faculdade;

create table Aluno ( 
	id_RA int(7) not null auto_increment, 
	Nome varchar(255), 
	dt_Nasc char(10),  
	Email varchar(255), 
	Telefone varchar(50), 
	Primary key (id_RA) 
); 

alter table Aluno
modify column Nome varchar(255) not null;

alter table Aluno
modify column Email varchar(255) not null;

create table Disciplina ( 
	id_Disc varchar(10) not null, 
	Nome_Disc varchar(255), 
	Curso varchar(255), 
	Carga_Horaria varchar(5), 
	Semestre_Ideal varchar(2), 
	Primary key (id_Disc) 
);

create table Nota_Aluno ( 
	id_RA int(7) not null, 
	id_Disc varchar(10) not null, 
	Media varchar(10) not null, 
	Foreign key (id_RA) references Aluno(id_RA), 
	Foreign key (id_Disc) references Disciplina(id_Disc) 
); 
