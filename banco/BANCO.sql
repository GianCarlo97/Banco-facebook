-- dar drop em cod_endereco de eventos e categoria em grupo


CREATE TABLE USUARIO(
  NOME VARCHAR(20) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL,
  DATANASC DATE NOT NULL,
  GENERO CHAR(1) NOT NULL,
  NUMCELULAR NUMBER(11),
  NUMAMIGOS NUMBER(5),
  COD_ENDERECO NUMBER(8),
  
  CONSTRAINT PK_EMAIL PRIMARY KEY(EMAIL),
  CONSTRAINT AK_NUMCELULAR UNIQUE(NUMCELULAR),
  CONSTRAINT CK_GENERO CHECK (GENERO IN ('M', 'F')),
  CONSTRAINT FK_ENDERECO FOREIGN KEY (COD_ENDERECO)REFERENCES ENDERECO
);

CREATE TABLE PAGINA(
  NOME VARCHAR(40) NOT NULL,
  CATEGORIA VARCHAR(15) NOT NULL,
  DATACRIACAO DATE NOT NULL,
  QNTDCURTIDAS NUMBER(30) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL,
  COD_ENDERECO NUMBER(8),
  
  CONSTRAINT PK_NOME PRIMARY KEY (NOME),
  CONSTRAINT CK_CATEGORIA CHECK (CATEGORIA IN ('Negócios','Empresa','Marca','Artista','Entretenimento','Causa')),
  CONSTRAINT FK_ENDERECO_PAGINA FOREIGN KEY (COD_ENDERECO)REFERENCES ENDERECO
);

CREATE TABLE GRUPO(
  NOME VARCHAR(40) NOT NULL,
  STATUS VARCHAR(40) NOT NULL,
  DESCRICAO VARCHAR(200) NULL,
  NUMEROGRUPO NUMBER(38) NOT NULL,
  QNTDMEMBROS NUMBER(6) NOT NULL,
  
  CONSTRAINT PK_NUMEROGRUPO_GRUPO PRIMARY KEY (NUMEROGRUPO),
  CONSTRAINT CK_STATUS_GRUPO CHECK (STATUS IN ('Publico', 'Fechado', 'Secreto'))
);

CREATE TABLE EVENTO(
  NOME VARCHAR(40) NOT NULL,
  IDEVENTO NUMBER(38)NOT NULL,
  DATAEVENTO DATE NOT NULL,
  NUMCONFIRMADOS NUMBER(8),
  STATUS VARCHAR(20) NOT NULL,
  
  CONSTRAINT PK_EVENTO PRIMARY KEY(IDEVENTO),
  CONSTRAINT CK_STATUS_EVENTO CHECK (STATUS IN ('Publico', 'Privado'))
);

CREATE TABLE ENDERECO(
  COD_ENDERECO NUMBER(8) NOT NULL,
  ESTADO VARCHAR(40) NOT NULL,
  CIDADE VARCHAR(40) NOT NULL,
  PAIS VARCHAR(40) NOT NULL,
  CEP NUMBER(8) NOT NULL,
  NUMERORESIDENCIA NUMBER(6) NOT NULL,
  
  CONSTRAINT PK_ENDERECO PRIMARY KEY(COD_ENDERECO),
  CONSTRAINT CK_RESIDENCIA CHECK (NUMERORESIDENCIA > 0)
);

CREATE TABLE USUARIO_PAGINA(
  EMAIL VARCHAR(50) NOT NULL,
  NOME VARCHAR(40) NOT NULL,
  
  CONSTRAINT PK_USUARIO_PAGINA PRIMARY KEY(EMAIL),
  CONSTRAINT FK_USUARIO FOREIGN KEY (EMAIL) REFERENCES USUARIO,
  CONSTRAINT FK_PAGINA FOREIGN KEY (NOME) REFERENCES PAGINA
);

CREATE TABLE USUARIO_GRUPO(
  EMAIL VARCHAR(50) NOT NULL,
  NUMEROGRUPO NUMBER(38) NOT NULL,
  
  CONSTRAINT PK_USUARIO_GRUPO PRIMARY KEY (EMAIL),
  CONSTRAINT FK_USUARIO_USU_GRUP FOREIGN KEY (EMAIL) REFERENCES USUARIO,
  CONSTRAINT FK_GRUPO FOREIGN KEY (NUMEROGRUPO) REFERENCES GRUPO
);

CREATE TABLE USUARIO_EVENTO(
  EMAIL VARCHAR(50) NOT NULL,
  IDEVENTO NUMBER(38)NOT NULL,
  
  CONSTRAINT PK_USUARIO_EVENTO PRIMARY KEY (EMAIL),
  CONSTRAINT FK_USUARIO_USU_EVE FOREIGN KEY (EMAIL) REFERENCES USUARIO,
  CONSTRAINT FK_EVENTO FOREIGN KEY (IDEVENTO) REFERENCES EVENTO
);

CREATE TABLE EVENTO_ENDERECO(
  IDEVENTO NUMBER(38)NOT NULL,
  COD_ENDERECO NUMBER(8) NOT NULL,
  
  CONSTRAINT PK_EVENTO_ENDERECO PRIMARY KEY (IDEVENTO),
  CONSTRAINT FK_EVENTO_EVE_END FOREIGN KEY (IDEVENTO) REFERENCES EVENTO,
  CONSTRAINT FK_ENDERECO_EVE_END FOREIGN KEY (COD_ENDERECO) REFERENCES ENDERECO
);

--inserir enderecos (COD_ENDERECO,ESTADO,CIDADE,PAIS,CEP,NUMERORESIDENCIA)
INSERT INTO ENDERECO
VALUES(1,'RS','Porto Alegre','Brasil','91450155', 165);
INSERT INTO ENDERECO
VALUES(2,'RS','Canoas','Brasil','95762485', 562);
INSERT INTO ENDERECO
VALUES(3,'RS','Alvorada','Brasil','68234876', 85);
INSERT INTO ENDERECO
VALUES(4,'RS','Viamão','Brasil','75168359', 65);
INSERT INTO ENDERECO
VALUES(5,'SP','São Paulo','Brasil','98659825', 15);
INSERT INTO ENDERECO
VALUES(6,'RJ','Rio De Janeiro','Brasil','76598652', 69);
INSERT INTO ENDERECO
VALUES(7,'RS','Porto Alegre','Brasil','53894586', 75);
INSERT INTO ENDERECO
VALUES(8,'RS','Guaiba','Brasil','85498625', 45);
INSERT INTO ENDERECO
VALUES(9,'AC','Rio Branco','Brasil','75924685', 54);
INSERT INTO ENDERECO
VALUES(10,'MT','Cuiabá','Brasil','42689758', 78);
INSERT INTO ENDERECO
VALUES(11,'PE','Recife','Brasil','46582579', 65);
INSERT INTO ENDERECO
VALUES(12,'MG','Belo Horizonte','Brasil','93515785', 25);
INSERT INTO ENDERECO
VALUES(13,'SC','Florianópolis','Brasil','86482879', 85);
INSERT INTO ENDERECO
VALUES(14,'TO','Palmas','Brasil','91548625', 75);
INSERT INTO ENDERECO
VALUES(15,'RR','Boa Vista','Brasil','78564985', 23);
INSERT INTO ENDERECO
VALUES(16,'PI','Teresina','Brasil','16875498', 98);
INSERT INTO ENDERECO
VALUES(17,'PR','Curitiba','Brasil','63982571', 21);
INSERT INTO ENDERECO
VALUES(18,'PA','Belém','Brasil','76842398', 42);
INSERT INTO ENDERECO
VALUES(19,'MS','Campo Grande','Brasil','68975485', 96);
INSERT INTO ENDERECO
VALUES(20,'RN','Natal','Brasil','13467985', 12);
--inserir usuarios(NOME, EMAIL, DATANASC, GENERO, NUMCELULAR NUMAMIGOS, COD_ENDERECO)

INSERT INTO USUARIO
VALUES ('Gian Carlo','giancluciano@gmail.com',TO_DATE('06/06/1997','dd/mm/yyyy') , 'M',5192668962,0 ,1);
INSERT INTO USUARIO
VALUES ('Ghilherme Ghidorsi','ghih@gmail.com',TO_DATE('23/04/1997','dd/mm/yyyy') , 'M',5123849769,2 ,2);
INSERT INTO USUARIO
VALUES ('Juliana','Juliana.01@gmail.com',TO_DATE('09/04/1990','dd/mm/yyyy') , 'F',5196824587,500 ,3);
INSERT INTO USUARIO
VALUES ('Pedro','Pedroh@gmail.com',TO_DATE('25/09/1995','dd/mm/yyyy') , 'M',5191468358,200 ,4);
INSERT INTO USUARIO
VALUES ('Arthur','duds@gmail.com',TO_DATE('16/06/1999','dd/mm/yyyy') , 'M',5196835247,50 ,5);
INSERT INTO USUARIO
VALUES ('Ernesto','neto@gmail.com',TO_DATE('09/03/2000','dd/mm/yyyy') , 'M',5197643415,400 ,6);
INSERT INTO USUARIO
VALUES ('Jessica','jessica@gmail.com',TO_DATE('23/04/1997','dd/mm/yyyy') , 'F',5193764825,1000 ,7);
INSERT INTO USUARIO
VALUES ('Yasmin','yasmin@gmail.com',TO_DATE('24/03/1997','dd/mm/yyyy') , 'F',5197482568,455 ,8);
INSERT INTO USUARIO
VALUES ('Marcelo','marcelo@gmail.com',TO_DATE('19/12/1997','dd/mm/yyyy') , 'M',5195135786,230 ,9);
INSERT INTO USUARIO
VALUES ('Luiza','Luiza@gmail.com',TO_DATE('01/08/1999','dd/mm/yyyy') , 'F',5192846753,90 ,10);
INSERT INTO USUARIO
VALUES ('Ana','ana@gmail.com',TO_DATE('31/08/1997','dd/mm/yyyy') , 'F',5193486715,900 ,11);
INSERT INTO USUARIO
VALUES ('Thais','thais@gmail.com',TO_DATE('03/01/1992','dd/mm/yyyy') , 'F',5191834675,201 ,12);
INSERT INTO USUARIO
VALUES ('Junior','junior@gmail.com',TO_DATE('18/04/1998','dd/mm/yyyy') , 'M',5191864825,80 ,13);
INSERT INTO USUARIO
VALUES ('Rodrigo','rodrigo@gmail.com',TO_DATE('13/06/1997','dd/mm/yyyy') , 'M',5196748153,234 ,14);
INSERT INTO USUARIO
VALUES ('Ricardo','ricardo@gmail.com',TO_DATE('22/02/1997','dd/mm/yyyy') , 'M',5196325814,780 ,15);
INSERT INTO USUARIO
VALUES ('Dilma','dilma@gmail.com',TO_DATE('06/06/1980','dd/mm/yyyy') , 'F',5196665874,0 ,16);
INSERT INTO USUARIO
VALUES ('João','joao@gmail.com',TO_DATE('11/11/1997','dd/mm/yyyy') , 'M',5192568555,300 ,17);
INSERT INTO USUARIO
VALUES ('Caroline','carol@gmail.com',TO_DATE('04/08/1998','dd/mm/yyyy') , 'F',5194385675,50 ,18);
INSERT INTO USUARIO
VALUES ('Matheus','matheus@gmail.com',TO_DATE('25/07/1991','dd/mm/yyyy') , 'M',5198675424,5 ,19);
INSERT INTO USUARIO
VALUES ('Alan','alan@gmail.com',TO_DATE('09/09/1990','dd/mm/yyyy') , 'M',5193867514,10 ,20);

--inserir paginas(NOME, CATEGORIA, DATACRIACAO, QTDCURTIDAS, EMAIL, COD_ENDERECO)
--CATEGORIA = ('Negócios','Empresa','Marca','Artista','Entretenimento','Causa')
INSERT INTO PAGINA
VALUES ('PUCRS','Empresa',TO_DATE('25/07/2009','dd/mm/yyyy'),7000,'pucrs@gmail.com',1);
INSERT INTO PAGINA
VALUES ('Facebook','Entretenimento',TO_DATE('12/05/2008','dd/mm/yyyy'),	13245325,'facebook@gmail.com',2);
INSERT INTO PAGINA
VALUES ('RBS TV','Empresa',TO_DATE('20/09/2009','dd/mm/yyyy'),856422,'rbstv@gmail.com',3);
INSERT INTO PAGINA
VALUES ('Tirinhas Engraçadas','Entretenimento',TO_DATE('05/12/2012','dd/mm/yyyy'),10,'tirinhas@gmail.com',4);
INSERT INTO PAGINA
VALUES ('Sam Totman','Artista',TO_DATE('30/03/2010','dd/mm/yyyy'),58329,'samtotman@gmail.com',5);
INSERT INTO PAGINA
VALUES ('Ciencia da Natureza','Causa',TO_DATE('01/09/2011','dd/mm/yyyy'),5468318,'ciencia@gmail.com',6);
INSERT INTO PAGINA
VALUES ('ClimaTempo','Marca',TO_DATE('23/10/2010','dd/mm/yyyy'),462486,'climatempo@gmail.com',7);
INSERT INTO PAGINA
VALUES ('Jornal Uma Hora','Marca',TO_DATE('18/03/2015','dd/mm/yyyy'),45648,'umahora@gmail.com',8);
INSERT INTO PAGINA
VALUES ('Rede Cubo','Empresa',TO_DATE('26/02/2009','dd/mm/yyyy'),86456,'cubo@gmail.com',9);
INSERT INTO PAGINA
VALUES ('Doors','Negócios',TO_DATE('06/08/2010','dd/mm/yyyy'),354538,'doors@gmail.com',10);
INSERT INTO PAGINA
VALUES ('Adidos','Marca',TO_DATE('20/10/2011','dd/mm/yyyy'),46848,'adidos@gmail.com',11);
INSERT INTO PAGINA
VALUES ('BRTT','Artista',TO_DATE('12/04/2014','dd/mm/yyyy'),364864,'brtt@gmail.com',12);
INSERT INTO PAGINA
VALUES ('Jim Carrey','Artista',TO_DATE('01/03/2010','dd/mm/yyyy'),53154588,'carrey@gmail.com',13);
INSERT INTO PAGINA
VALUES ('Oriente','Marca',TO_DATE('11/04/2013','dd/mm/yyyy'),5457,'oriente@gmail.com',14);
INSERT INTO PAGINA
VALUES ('Passe Livre','Causa',TO_DATE('24/05/2013','dd/mm/yyyy'),57484,'passelivre@gmail.com',15);
INSERT INTO PAGINA
VALUES ('Bar do 32','Negócios',TO_DATE('25/07/2013','dd/mm/yyyy'),6485,'bar32@gmail.com',16);
INSERT INTO PAGINA
VALUES ('Maza','Negócios',TO_DATE('12/12/2009','dd/mm/yyyy'),544846,'maza@gmail.com',17);
INSERT INTO PAGINA
VALUES ('Old Spice','Empresa',TO_DATE('05/03/2010','dd/mm/yyyy'),2442534,'oldspice@gmail.com',18);
INSERT INTO PAGINA
VALUES ('SanSong','Empresa',TO_DATE('29/11/2012','dd/mm/yyyy'),534515,'sansong@gmail.com',19);
INSERT INTO PAGINA
VALUES ('NASA','Empresa',TO_DATE('09/02/2008','dd/mm/yyyy'),5348484,'nasa@gmail.com',20);

--inserir grupos(NOME, STATUS, DESCRICAO, NUMEROGRUPO, QNTDMEMBROS)
-- STATUS ('Publico', 'Fechado', 'Secreto')
INSERT INTO GRUPO 
VALUES ('Familia','Secreto','Grupo da familia',1,10);
INSERT INTO GRUPO
VALUES ('Turma','Fechado','Grupo da turma',2,20);
INSERT INTO GRUPO
VALUES ('Amigos','Fechado','Grupo para amigos',3,50);
INSERT INTO GRUPO
VALUES ('Esporte','Publico','Grupo para reunir times para esportes',4,100);
INSERT INTO GRUPO
VALUES ('ES FACIN/PUCRS','Fechado','grupo para alunos do curso de ES',5,96);
INSERT INTO GRUPO
VALUES ('Trabalho','Secreto','Grupo para os funcionarios se comunicarem',6,40);
INSERT INTO GRUPO
VALUES ('Filmes','Publico','Grupo para qualquer um conversar sobre os filmes',7,200);
INSERT INTO GRUPO
VALUES ('Projeto x','Secreto','Grupo para realização do projeto x',8,5);
INSERT INTO GRUPO
VALUES ('Estudos','Fechado','Grupo para troca de materiais de estudos',9,100);
INSERT INTO GRUPO
VALUES ('Organização de eventos','Publico','Grupo para ajudar as pessoas a organizar eventos',10,300);
INSERT INTO GRUPO
VALUES ('Encontros','Publico','Grupo para pessoas se conhecerem',11,500);
INSERT INTO GRUPO
VALUES ('Doações','Publico','Grupo para doar produtos',12,100);
INSERT INTO GRUPO
VALUES ('Vendas','Publico','grupo para vender produtos para os clientes',13,0);
INSERT INTO GRUPO
VALUES ('Jogos Online','Publico','Grupo para conversar sobre jogos online',14,0);
INSERT INTO GRUPO
VALUES ('Times de Futebol','Publico','Grupo para torcedores se reunirem para torcer',15,1000);
INSERT INTO GRUPO
VALUES ('Musicas','Publico','Grupo para trocas de musicas',16,340);
INSERT INTO GRUPO
VALUES ('PUCRS','Fechado','Grupo para todos os alunos que estudam na puc',17,2000);
INSERT INTO GRUPO
VALUES ('Livros','Fechado','Grupo para troca de livros',18,60);
INSERT INTO GRUPO
VALUES ('Banco de dados PUCRS','Secreto','Grupo para a cadeira de banco da pucrs',19,20);
INSERT INTO GRUPO
VALUES ('Animais perdidos','Publico','Grupo para encontrar donos para animais abandonados',20,100);
--inserir evencos(NOME, IDEVENTO, DATAEVENTO, NUMCONFIRMADOS, STATUS)
--STATUS ('Publico', 'Privado')
INSERT INTO EVENTO
VALUES('Festa na casa do Rodrigo',1,TO_DATE('27/11/2015','dd/mm/yyyy'),2000,'Publico');
INSERT INTO EVENTO
VALUES('Protesto para liberar o Uber',2,TO_DATE('1/12/2015','dd/mm/yyyy'),3000,'Publico');
INSERT INTO EVENTO
VALUES('Festa De aniversario do Ghilherme',3,TO_DATE('29/11/2015','dd/mm/yyyy'),3,'Privado');
INSERT INTO EVENTO
VALUES('Formatura da turma',4,TO_DATE('28/12/2020','dd/mm/yyyy'),300,'Publico');
INSERT INTO EVENTO
VALUES('Passeada para o fim da fome',5,TO_DATE('12/04/2016','dd/mm/yyyy'),20,'Publico');
INSERT INTO EVENTO
VALUES('Encontro para programar',6,TO_DATE('13/12/2015','dd/mm/yyyy'),10,'Privado');
INSERT INTO EVENTO
VALUES('Festa de fim de ano',7,TO_DATE('28/12/2015','dd/mm/yyyy'),100,'Publico');
INSERT INTO EVENTO
VALUES('Estudo para prova',8,TO_DATE('19/11/2015','dd/mm/yyyy'),10,'Privado');
INSERT INTO EVENTO
VALUES('Toboagua Gigante',9,TO_DATE('30/11/2015','dd/mm/yyyy'),1000,'Publico');
INSERT INTO EVENTO
VALUES('GreNal Domingo',10,TO_DATE('22/11/2015','dd/mm/yyyy'),13000,'Publico');
INSERT INTO EVENTO
VALUES('Visita ao museu',11,TO_DATE('12/12/2015','dd/mm/yyyy'),5,'Publico');
INSERT INTO EVENTO
VALUES('Almoco comemorativo',12,TO_DATE('5/12/2015','dd/mm/yyyy'),30,'Privado');
INSERT INTO EVENTO
VALUES('Encontro para troca de materiais',13,TO_DATE('04/04/2016','dd/mm/yyyy'),100,'Publico');
INSERT INTO EVENTO
VALUES('Piquenique de amigos',14,TO_DATE('13/12/2015','dd/mm/yyyy'),40,'Privado');
INSERT INTO EVENTO
VALUES('Passeio ao museu da Puc',15,TO_DATE('17/08/2016','dd/mm/yyyy'),234,'Publico');
INSERT INTO EVENTO
VALUES('Aniversario do Max',16,TO_DATE('09/09/2015','dd/mm/yyyy'),30,'Privado');
INSERT INTO EVENTO
VALUES('Encontro na Redenção',17,TO_DATE('15/06/2016','dd/mm/yyyy'),100,'Publico');
INSERT INTO EVENTO
VALUES('Palestra de Banco',18,TO_DATE('23/03/2017','dd/mm/yyyy'),70,'Publico');
INSERT INTO EVENTO
VALUES('Inauguração de um restaurante',19,TO_DATE('23/05/2016','dd/mm/yyyy'),23,'Publico');
INSERT INTO EVENTO
VALUES('Exposição de artes',20,TO_DATE('25/01/2016','dd/mm/yyyy'),234,'Publico');

--inserir usuario-pagica(EMAIL , NOME PAGINA)
INSERT INTO USUARIO_PAGINA
VALUES ('giancluciano@gmail.com','Facebook');
INSERT INTO USUARIO_PAGINA
VALUES ('ghih@gmail.com','Tirinhas Engraçadas');
INSERT INTO USUARIO_PAGINA
VALUES ('Juliana.01@gmail.com','RBS TV');
INSERT INTO USUARIO_PAGINA
VALUES ('Pedroh@gmail.com','Ciencia da Natureza');
INSERT INTO USUARIO_PAGINA
VALUES ('duds@gmail.com','ClimaTempo');
INSERT INTO USUARIO_PAGINA
VALUES ('neto@gmail.com','Jornal Uma Hora');
INSERT INTO USUARIO_PAGINA
VALUES ('jessica@gmail.com','Jornal Uma Hora');
INSERT INTO USUARIO_PAGINA
VALUES ('yasmin@gmail.com','Jim Carrey');
INSERT INTO USUARIO_PAGINA
VALUES ('marcelo@gmail.com','Oriente');
INSERT INTO USUARIO_PAGINA
VALUES ('Luiza@gmail.com','Passe Livre');
INSERT INTO USUARIO_PAGINA
VALUES ('ana@gmail.com','Bar do 32');
INSERT INTO USUARIO_PAGINA
VALUES ('thais@gmail.com','BRTT');
INSERT INTO USUARIO_PAGINA
VALUES ('junior@gmail.com','Adidos');
INSERT INTO USUARIO_PAGINA
VALUES ('rodrigo@gmail.com','Maza');
INSERT INTO USUARIO_PAGINA
VALUES ('ricardo@gmail.com','Old Spice');
INSERT INTO USUARIO_PAGINA
VALUES ('dilma@gmail.com','Old Spice');
INSERT INTO USUARIO_PAGINA
VALUES ('joao@gmail.com','NASA');
INSERT INTO USUARIO_PAGINA
VALUES ('carol@gmail.com','Rede Cubo');
INSERT INTO USUARIO_PAGINA
VALUES ('matheus@gmail.com','Sam Totman');
INSERT INTO USUARIO_PAGINA
VALUES ('alan@gmail.com','Sam Totman');
--usuario_grupo
INSERT INTO USUARIO_GRUPO
VALUES ('giancluciano@gmail.com',1);
INSERT INTO USUARIO_GRUPO
VALUES ('ghih@gmail.com',2);
INSERT INTO USUARIO_GRUPO
VALUES ('Juliana.01@gmail.com',3);
INSERT INTO USUARIO_GRUPO
VALUES ('Pedroh@gmail.com',4);
INSERT INTO USUARIO_GRUPO
VALUES ('duds@gmail.com',6);
INSERT INTO USUARIO_GRUPO
VALUES ('neto@gmail.com',5);
INSERT INTO USUARIO_GRUPO
VALUES ('jessica@gmail.com',5);
INSERT INTO USUARIO_GRUPO
VALUES ('yasmin@gmail.com',7);
INSERT INTO USUARIO_GRUPO
VALUES ('marcelo@gmail.com',8);
INSERT INTO USUARIO_GRUPO
VALUES ('Luiza@gmail.com',9);
INSERT INTO USUARIO_GRUPO
VALUES ('ana@gmail.com',10);
INSERT INTO USUARIO_GRUPO
VALUES ('thais@gmail.com',11);
INSERT INTO USUARIO_GRUPO
VALUES ('junior@gmail.com',13);
INSERT INTO USUARIO_GRUPO
VALUES ('rodrigo@gmail.com',12);
INSERT INTO USUARIO_GRUPO
VALUES ('ricardo@gmail.com',12);
INSERT INTO USUARIO_GRUPO
VALUES ('dilma@gmail.com',19);
INSERT INTO USUARIO_GRUPO
VALUES ('joao@gmail.com',18);
INSERT INTO USUARIO_GRUPO
VALUES ('carol@gmail.com',17);
INSERT INTO USUARIO_GRUPO
VALUES ('matheus@gmail.com',16);
INSERT INTO USUARIO_GRUPO
VALUES ('alan@gmail.com',15);
--usuario_evento
INSERT INTO USUARIO_EVENTO
VALUES ('giancluciano@gmail.com',1);
INSERT INTO USUARIO_EVENTO
VALUES ('ghih@gmail.com',2);
INSERT INTO USUARIO_EVENTO
VALUES ('Juliana.01@gmail.com',3);
INSERT INTO USUARIO_EVENTO
VALUES ('Pedroh@gmail.com',4);
INSERT INTO USUARIO_EVENTO
VALUES ('duds@gmail.com',6);
INSERT INTO USUARIO_EVENTO
VALUES ('neto@gmail.com',5);
INSERT INTO USUARIO_EVENTO
VALUES ('jessica@gmail.com',5);
INSERT INTO USUARIO_EVENTO
VALUES ('yasmin@gmail.com',7);
INSERT INTO USUARIO_EVENTO
VALUES ('marcelo@gmail.com',8);
INSERT INTO USUARIO_EVENTO
VALUES ('Luiza@gmail.com',9);
INSERT INTO USUARIO_EVENTO
VALUES ('ana@gmail.com',10);
INSERT INTO USUARIO_EVENTO
VALUES ('thais@gmail.com',11);
INSERT INTO USUARIO_EVENTO
VALUES ('junior@gmail.com',13);
INSERT INTO USUARIO_EVENTO
VALUES ('rodrigo@gmail.com',12);
INSERT INTO USUARIO_EVENTO
VALUES ('ricardo@gmail.com',12);
INSERT INTO USUARIO_EVENTO
VALUES ('dilma@gmail.com',19);
INSERT INTO USUARIO_EVENTO
VALUES ('joao@gmail.com',18);
INSERT INTO USUARIO_EVENTO
VALUES ('carol@gmail.com',17);
INSERT INTO USUARIO_EVENTO
VALUES ('matheus@gmail.com',16);
INSERT INTO USUARIO_EVENTO
VALUES ('alan@gmail.com',15);
--evento_endereco
INSERT INTO EVENTO_ENDERECO
VALUES (1,1);
INSERT INTO EVENTO_ENDERECO
VALUES (2,2);
INSERT INTO EVENTO_ENDERECO
VALUES (3,3);
INSERT INTO EVENTO_ENDERECO
VALUES (4,4);
INSERT INTO EVENTO_ENDERECO
VALUES (5,5);
INSERT INTO EVENTO_ENDERECO
VALUES (6,6);
INSERT INTO EVENTO_ENDERECO
VALUES (7,7);
INSERT INTO EVENTO_ENDERECO
VALUES (8,7);
INSERT INTO EVENTO_ENDERECO
VALUES (20,8);
INSERT INTO EVENTO_ENDERECO
VALUES (9,9);
INSERT INTO EVENTO_ENDERECO
VALUES (10,10);
INSERT INTO EVENTO_ENDERECO
VALUES (11,11);
INSERT INTO EVENTO_ENDERECO
VALUES (12,12);
INSERT INTO EVENTO_ENDERECO
VALUES (13,13);
INSERT INTO EVENTO_ENDERECO
VALUES (14,14);
INSERT INTO EVENTO_ENDERECO
VALUES (15,15);
INSERT INTO EVENTO_ENDERECO
VALUES (16,16);
INSERT INTO EVENTO_ENDERECO
VALUES (17,17);
INSERT INTO EVENTO_ENDERECO
VALUES (18,18);
INSERT INTO EVENTO_ENDERECO
VALUES (19,20);
--5 consultas basicas
SELECT NOME FROM USUARIO ORDER BY NOME ASC;

SELECT COUNT(*) FROM USUARIO WHERE EXTRACT (YEAR FROM DATANASC) > 1990;

SELECT CIDADE FROM ENDERECO WHERE ESTADO LIKE 'RS';

SELECT NOME FROM USUARIO WHERE GENERO IN 'M';

SELECT COUNT(DISTINCT CIDADE) FROM ENDERECO;

--5 consultas com juncoes entre tabelas
SELECT EVE.NOME FROM EVENTO EVE INNER JOIN EVENTO_ENDERECO EVEND ON EVE.IDEVENTO = EVEND.IDEVENTO INNER JOIN ENDERECO ENDE ON EVEND.COD_ENDERECO = ENDE.COD_ENDERECO WHERE CIDADE LIKE 'Porto Alegre';

SELECT PG.NOME FROM PAGINA PG INNER JOIN USUARIO_PAGINA USUP ON PG.NOME = USUP.NOME INNER JOIN USUARIO USU ON USUP.EMAIL = USU.EMAIL WHERE EXTRACT (MONTH FROM DATANASC) = 09;

SELECT USU.NOME FROM USUARIO USU INNER JOIN USUARIO_PAGINA USUP ON USU.EMAIL = USUP.EMAIL INNER JOIN PAGINA PG ON USUP.NOME = PG.NOME WHERE EXTRACT (YEAR FROM DATACRIACAO) > 2005;

SELECT USU.NOME FROM USUARIO USU INNER JOIN ENDERECO ENDE ON USU.COD_ENDERECO = ENDE.COD_ENDERECO WHERE ESTADO LIKE 'RS';

SELECT COUNT(PG.NOME) FROM PAGINA PG INNER JOIN ENDERECO ENDE ON PG.COD_ENDERECO = ENDE.COD_ENDERECO WHERE CIDADE LIKE 'São Paulo';

--5 consultas com group by e having

SELECT CATEGORIA, COUNT(*) FROM PAGINA GROUP BY CATEGORIA HAVING COUNT(*) > 2;

SELECT ENDE.ESTADO, COUNT(USU.NOME) FROM USUARIO USU INNER JOIN ENDERECO ENDE ON USU.COD_ENDERECO = ENDE.COD_ENDERECO GROUP BY ENDE.ESTADO HAVING COUNT(*) > 5;

SELECT AVG(QNTDCURTIDAS), NOME FROM PAGINA GROUP BY NOME HAVING AVG(QNTDCURTIDAS) >= 50000;

SELECT STATUS, COUNT(NOME) FROM GRUPO GROUP BY STATUS HAVING COUNT(NOME) > 10;

SELECT CIDADE, ESTADO FROM ENDERECO GROUP BY CIDADE, ESTADO HAVING CIDADE LIKE 'P%';

--5 consultas com sub-consultas

SELECT NOME, DATANASC FROM USUARIO WHERE COD_ENDERECO IN (SELECT COD_ENDERECO FROM ENDERECO WHERE CIDADE LIKE 'Palmas');

SELECT EMAIL FROM USUARIO WHERE COD_ENDERECO IN (SELECT COD_ENDERECO FROM ENDERECO WHERE ESTADO LIKE 'SP');

SELECT NUMCELULAR FROM USUARIO WHERE COD_ENDERECO IN (SELECT COD_ENDERECO FROM ENDERECO WHERE ESTADO LIKE 'RS');

SELECT NOME, NUMAMIGOS FROM USUARIO WHERE COD_ENDERECO NOT IN (SELECT COD_ENDERECO FROM ENDERECO WHERE CIDADE LIKE 'Porto Alegre');

SELECT NOME FROM PAGINA WHERE COD_ENDERECO IN (SELECT COD_ENDERECO FROM ENDERECO WHERE ESTADO LIKE 'SP');
