/* 
Trabalho final: MODELAGEM DE BANCO DE DADOS
Desenvolver um banco de dados, tema livre
2022.06.07
*/

create database USP;

use USP;

create table CAMPUS (
	id_Campus varchar(10) primary key not null,
	Nome_Campus varchar(50),
	Cidade varchar (30),
	Bairro varchar (30),
	Institutos varchar (300)
);

create table INSTITUTO (
	id_Instituto varchar(10) primary key not null,
	Nome_Instituto varchar(100),
	Sigla_Instituto varchar(10),
	Cursos varchar(100),
	Biblioteca varchar(100)
);

alter table INSTITUTO
add column id_Campus varchar(10);

alter table INSTITUTO
add foreign key (id_Campus)
references CAMPUS (id_Campus);

describe INSTITUTO;

create table CURSO (
	id_Curso varchar(10) primary key not null,
	Nome_Curso varchar(50),
	Habilitacao varchar(50),
	Tipo_Formacao varchar(30),
	Periodo varchar(50),
	Duracao_Ideal varchar(15),
	Carga_Horaria char(5),
	Total_Credito char(3),
	Departamentos varchar(50)
);

alter table CURSO
add column id_Campus varchar(10);

alter table CURSO
add foreign key (id_Campus)
references CAMPUS (id_Campus);

alter table CURSO
add column id_Instituto varchar(10);

alter table CURSO
add foreign key (id_Instituto)
references INSTITUTO (id_Instituto);

describe CURSO;

create table DEPARTAMENTO(
	id_Departamento varchar(10) primary key not null,
	Nome_Departamento varchar(50),
	Sigla_Departamento varchar(10),
	Habilitacoes varchar(100)
);

alter table DEPARTAMENTO
add column id_Curso varchar(10);

alter table DEPARTAMENTO
add foreign key (id_Curso)
references CURSO (id_Curso);

alter table DEPARTAMENTO
add column id_Instituto varchar(10);

alter table DEPARTAMENTO
add foreign key (id_Instituto)
references INSTITUTO (id_Instituto);

alter table DEPARTAMENTO
add column id_Campus varchar(10);

alter table DEPARTAMENTO
add foreign key (id_Campus)
references CAMPUS (id_Campus);

describe DEPARTAMENTO;

create table DISCIPLINA (
	id_Disciplina varchar(10) primary key not null,
	Nome_Disciplina varchar(50),
	Credito_Aula char(2),
	Credito_Trabalho char(2),
	Carga_Horaria char(3)
);

alter table DISCIPLINA
add column id_Departamento varchar(10);

alter table DISCIPLINA
add foreign key (id_Departamento)
references DEPARTAMENTO (id_Departamento);

alter table DISCIPLINA
add column id_Curso varchar(10);

alter table DISCIPLINA
add foreign key (id_Curso)
references CURSO (id_Curso);

alter table DISCIPLINA
add column id_Instituto varchar(10);

alter table DISCIPLINA
add foreign key (id_Instituto)
references INSTITUTO (id_Instituto);

alter table DISCIPLINA
add column id_Campus varchar(10);

alter table DISCIPLINA
add foreign key (id_Campus)
references CAMPUS (id_Campus);

describe DISCIPLINA;

alter table CURSO
modify column id_Campus varchar(10) after id_Instituto;

describe CURSO;

alter table DISCIPLINA
add column Tipo_Disciplina varchar(20) after Nome_Disciplina;

insert into CAMPUS values
('C01', 'Cidade Universit??ria - Armando de Salles Oliveira', 'S??o Paulo', 'Butant??', 'ECA, EEFE, EPUSP, FAU, FCF, FEA, FE, FFLCH, FMVZ, FO, IAG, IB, ICB, IEE, IEA, IEB, IF, IGc, IME, IMT, IP, IQ, IRI, IO'),
('C02', 'Largo S??o Franciso', 'S??o Paulo', 'S??', 'FDUSP'),
('C03', 'Complexo da Sa??de', 'S??o Paulo', 'Cerqueira C??sar', 'FMUSP, FSP, EE'),
('C04', 'USP Leste', 'S??o Paulo', 'Ermelino Matarazzo', 'EACH');

select * from CAMPUS;

alter table INSTITUTO
modify column Cursos varchar(500);

insert into INSTITUTO values
('8', 'Faculdade de Filosofia, Letras e Ci??ncias Humanas', 'FFLCH', 'Ci??ncias Sociais, Filosofia, Geografia, Hist??ria, Letras', 'Biblioteca Florestan Fernandes', 'C01'),
('27', 'Escola de Comunica????es e Artes', 'ECA', 'Artes C??nicas, Artes Visual, Audiovisual, Biblioteconomia, Editora????o, Educomunica????o, Jornalismo, M??sica, Publicidade e Propaganda, Rela????es P??blicas, Turismo', 'Biblioteca da ECA', 'C01'),
('45', 'Instituto de Matem??tica e Estat??stica', 'IME', 'Ci??ncia da Computa????o, Estat??stica, Matem??tica, Matem??tica Aplicada, Matem??tica Aplicada e Computacional', 'Biblioteca Carlos Benjamin de Lyra', 'C01'),
('86', 'Escola de Artes, Ci??ncias e Humanidades', 'EACH', 'Biotecnologia, Ci??ncias da Natureza, Educa????o F??sica e Sa??de, Gerontologia, Gest??o Ambiental, Gest??o de Pol??tica P??blicas, Lazer e Turismo, Marketing, Obstetr??cia, Sistemas de Informa????o, T??xtil e Moda', 'Biblioteca da EACH', 'C04');

select * from INSTITUTO;

alter table CURSO
modify column Habilitacao varchar(500);

insert into CURSO values
('LET', 'Letras', 'Alem??o, ??rabe, Arm??nio, Chin??s, Coreano, Espanhol, Franc??s, Grego, Hebraico, Ingl??s, Italiano, Japon??s, Latim, Lingu??stica, Portugu??s, Russo', 'Bacharelado, Licenciatura', 'Matutino, Noturno', '10 semestres', '3630', '185', 'DL, DLCV, DLM, DLO, DTLLC', '8', 'C01'),
('HIST', 'Hist??ria', '-', 'Bacharelado, Licenciatura', 'Vespertino, Noturno, Integral', '8 semestres', '3270', '190', 'DH', '8', 'C01'),
('GEO', 'Geografia', '-', 'Bacharelado, Licenciatura', 'Vespertino, Noturno, Integral', '8 semestres', '3375', '183', 'DG', '8', 'C01'),
('FIL', 'Filosofia', '-', 'Bacharelado, Licenciatura', 'Vespertino, Noturno, Integral', '8 semestres', '3000', '150', 'DF', '8', 'C01'),
('CSO', 'Ci??ncias Sociais', '-', 'Bacharelado, Licenciatura', 'Vespertino, Noturno, Integral', '8 semestres', '2550', '155', 'DA, DCP, DS', '8', 'C01');

select * from CURSO;

insert into DEPARTAMENTO values
('FLC', 'Departamento de Letras Cl??ssicas e Vern??culas', 'DLCV', 'Grego, Latim, Portugu??s', 'LET', '8', 'C01'),
('FLM', 'Departamento de Letras Modernas', 'DLM', 'Alem??o, Espanhol, Franc??s, Ingl??s, Italiano', 'LET', '8', 'C01'),
('FLO', 'Departamento de L??nguas Orientais', 'DLO', '??rabe, Arm??nio, Chin??s, Coreano, Hebraico, Japon??s, Russo', 'LET', '8', 'C01'),
('FLL', 'Departamento de Lingu??stica', 'DL', 'Lingu??stica', 'LET', '8', 'C01'),
('FLT', 'Departamento de Teoria Liter??ria e Literatura Comparada', 'DTLLC', '-', 'LET', '8', 'C01');

select * from DEPARTAMENTO;

alter table DISCIPLINA
add column Periodo_Ideal char(2) after Tipo_Disciplina;

alter table DISCIPLINA
add column Habilitacao_Disciplina varchar(15) after Nome_Disciplina;

insert into DISCIPLINA values
('FLC0112', 'Introdu????o aos Estudos Cl??ssicos I', 'Ciclo B??sico', 'Obrigat??ria', '1', '4', '0', '60', 'FLC', 'LET', '8', 'C01'),
('FLL0434', 'Elementos de Ling????stica II', 'Ciclo B??sico', 'Obrigat??ria', '2', '4', '0', '60', 'FLL', 'LET', '8', 'C01'),
('FLC0200', 'Literatura Brasileira I', 'Portugu??s', 'Obrigat??ria', '3', '4', '2', '120', 'FLC', 'LET', '8', 'C01'),
('FLM0520', 'An??lise e Pr??tica de Pron??ncia do Ingl??s', 'Ingl??s', 'Obrigat??ria', '3', '2', '1', '60', 'FLM', 'LET', '8', 'C01'),
('FLM1131', 'Franc??s II', 'Franc??s', 'Obrigat??ria', '4', '4', '1', '90', 'FLM', 'LET', '8', 'C01'),
('FLC0124', '??pica Grega: Homero', 'Grego', 'Obrigat??ria, Opt Eletiva', '5', '2', '1', '60', 'FLC', 'LET', '8', 'C01'),
('FLM0206', 'Introdu????o aos Estudos Tradutol??gicos', 'Letras Modernas', 'Optativa Eletiva', '5', '2', '2', '90', 'FLM', 'LET', '8', 'C01'),
('FLT0223', 'Teoria Liter??ria I', '-', 'Optativa Eletiva', '7', '2', '2', '90', 'FLT', 'LET', '8', 'C01'),
('FLL0444', 'Psicoling????stica', 'Ling????stica', 'Obrigat??ria, Opt Eletiva', '8', '2', '1', '60', 'FLL', 'LET', '8', 'C01'),
('FLM0576', 'T??picos do Romance', 'Ingl??s', 'Optativa Livre', '6', '2', '1', '60', 'FLM', 'LET', '8', 'C01'),
('FLO1510', 'Mitologia Chinesa', 'Chin??s', 'Optativa Livre', '3', '2', '2', '90', 'FLO', 'LET', '8', 'C01');

select * from DISCIPLINA;

select Nome_Disciplina from DISCIPLINA;

select * from DISCIPLINA
order by Nome_Disciplina asc;

select * from DISCIPLINA
order by id_Disciplina desc;

select Nome_Instituto, Sigla_Instituto
from INSTITUTO
where id_Instituto = 8;

select Nome_Curso
from CURSO
where id_Campus = 'C01';

select Nome_Departamento, Sigla_Departamento
from DEPARTAMENTO
where id_Departamento = 'FLM';

show index from CAMPUS;

select * from DISCIPLINA
where id_Departamento = 'FLM';

select * from DISCIPLINA
where id_Departamento = 'FLC';

select * from DISCIPLINA
where id_Departamento = 'FLO';

select * from DISCIPLINA
where id_Departamento = 'FLT';

select * from DISCIPLINA
where id_Departamento = 'FLL';

select Nome_Instituto, Sigla_Instituto
from INSTITUTO
where id_Campus in ('C01');

select Nome_Instituto, Sigla_Instituto
from INSTITUTO
where id_Campus not in ('C01');

select id_Instituto, Nome_Instituto
from INSTITUTO
where id_Instituto between 0 and 45;

select id_Instituto, Nome_Instituto
from INSTITUTO
where id_Instituto not between 10 and 45;

select * from INSTITUTO
where Nome_Instituto like 'E%';

select * from INSTITUTO
where Nome_Instituto not like 'E%';

select * from CURSO
where Nome_Curso like '%et%';

select * from CURSO
where Nome_Curso not like '%et%';

update DEPARTAMENTO
set Nome_Departamento = 'Departamento de Letras Orientais'
where id_Departamento = 'FLO';

select * from DEPARTAMENTO;

select * from DEPARTAMENTO
where Nome_Departamento like '%Let%';

select * from DEPARTAMENTO
where Nome_Departamento not like '%Let%';

select * from DEPARTAMENTO
where Nome_Departamento like '%Lin________';

select * from DISCIPLINA
inner join INSTITUTO;

select * from DISCIPLINA
inner join INSTITUTO
on DISCIPLINA.id_Instituto = INSTITUTO.id_Instituto;

select * from CURSO
inner join CAMPUS
on CURSO.id_Campus = CAMPUS.id_Campus;

create view Disc_Inst
as select DISCIPLINA.Nome_Disciplina as Disc, INSTITUTO.Nome_Instituto as Inst
from DISCIPLINA
inner join INSTITUTO
on DISCIPLINA.id_Instituto = INSTITUTO.id_Instituto;

select Disc, Inst
from Disc_Inst;

create view Inst_Camp
as select INSTITUTO.Nome_Instituto as Inst, CAMPUS.Nome_Campus as Campus
from INSTITUTO
inner join CAMPUS
on INSTITUTO.id_Campus= CAMPUS.id_Campus;

select Inst, Campus
from Inst_Camp;

drop view Inst_Camp;