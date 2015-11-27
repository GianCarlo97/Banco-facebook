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
  CATEGORIA VARCHAR(20) NULL,
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
  COD_ENDERECO NUMBER(8),
  
  CONSTRAINT PK_EVENTO PRIMARY KEY(IDEVENTO),
  CONSTRAINT CK_STATUS_EVENTO CHECK (STATUS IN ('Publico', 'Privado')),
  CONSTRAINT FK_ENDERECO_EVENTO FOREIGN KEY (COD_ENDERECO)REFERENCES ENDERECO
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

--inserir grupos

--inserir evencos

--inserir usuario-pagica

--usuario_grupo

--usuario_evento

--evento_endereco

--5 consutas basicas
SELECT NOME 
FROM USUARIO
ORDER BY NOME ASC;

SELECT COUNT(*)
FROM USUARIO
WHERE EXTRACT (YEAR FROM DATANASC) > 1990;

SELECT CIDADE
FROM ENDERECO
WHERE ESTADO LIKE 'RS';

SELECT NOME
FROM USUARIO
WHERE GENERO IN 'M';

SELECT COUNT(DISTINCT CIDADE)
FROM ENDERECO;

--5 consutas com juncoes entre tabelas

--5 consutas com group by e having

--5 consutas com sub-consutas

