-- Database: stratygrafia

-- DROP DATABASE IF EXISTS stratygrafia;

CREATE DATABASE stratygrafia
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE SCHEMA tabela_stratygraficzna;

CREATE TABLE tabela_stratygraficzna.GeoEon(
	id_eon VARCHAR(10) PRIMARY KEY,
	nazwa_eon VARCHAR(40) NOT NULL
);

CREATE TABLE tabela_stratygraficzna.GeoEra(
	id_era VARCHAR(10) PRIMARY KEY,
	id_eon VARCHAR(10) NOT NULL,
	nazwa_era VARCHAR(40) NOT NULL
);

CREATE TABLE tabela_stratygraficzna.GeoOkres(
	id_okres VARCHAR(10) PRIMARY KEY,
	id_era VARCHAR(10) NOT NULL,
	nazwa_okres VARCHAR(40) NOT NULL
);

CREATE TABLE tabela_stratygraficzna.GeoEpoka(
	id_epoka VARCHAR(10) PRIMARY KEY,
	id_okres VARCHAR(10) NOT NULL,
	nazwa_epoka VARCHAR(40) NOT NULL
);

CREATE TABLE tabela_stratygraficzna.GeoPietro(
	id_pietro VARCHAR(10) PRIMARY KEY,
	id_epoka VARCHAR(10) NOT NULL,
	nazwa_pietro VARCHAR(40) NOT NULL
);

--tworzenie referencji

ALTER TABLE tabela_stratygraficzna.GeoEra
ADD FOREIGN KEY (id_eon)
REFERENCES tabela_stratygraficzna.GeoEon(id_eon);

ALTER TABLE tabela_stratygraficzna.GeoOkres
ADD FOREIGN KEY (id_era)
REFERENCES tabela_stratygraficzna.GeoEra(id_era);

ALTER TABLE tabela_stratygraficzna.GeoEpoka
ADD FOREIGN KEY (id_okres)
REFERENCES tabela_stratygraficzna.GeoOkres(id_okres);

ALTER TABLE tabela_stratygraficzna.GeoPietro
ADD FOREIGN KEY (id_epoka)
REFERENCES tabela_stratygraficzna.GeoEpoka(id_epoka);

--wprowadzanie danych

--Eon
INSERT INTO 
	tabela_stratygraficzna.GeoEon
VALUES
	('EON1', 'Fanerozoik');

--Era
INSERT INTO 
	tabela_stratygraficzna.GeoEra
VALUES
	('ERA1', 'EON1', 'Paleozoik'),
	('ERA2', 'EON1', 'Mezozoik'),
	('ERA3', 'EON1', 'Kenozoik');

--Okres
INSERT INTO 
	tabela_stratygraficzna.GeoOkres
VALUES
	('OKR1', 'ERA1', 'Kambr'),
	('OKR2', 'ERA1', 'Ordowik'),
	('OKR3', 'ERA1', 'Sylur'),
	('OKR4', 'ERA1', 'Dewon'),
	('OKR5', 'ERA1', 'Karbon'),
	('OKR6', 'ERA1', 'Perm'),
	('OKR7', 'ERA2', 'Trias'),
	('OKR8', 'ERA2', 'Jura'),
	('OKR9', 'ERA2', 'Kreda'),
	('OKR10', 'ERA3', 'Paleogen'),
	('OKR11', 'ERA3', 'Neogen'),
	('OKR12', 'ERA3', 'Czwartorzed');

--Epoka
INSERT INTO 
	tabela_stratygraficzna.GeoEpoka
VALUES
	('EPK1', 'OKR1', 'Terenew'),
	('EPK2', 'OKR1', 'Oddzial 2 (Kambr)'),
	('EPK3', 'OKR1', 'Oddzial 3 (Kambr)'),
	('EPK4', 'OKR1', 'Furong'),
	('EPK5', 'OKR2', 'Ordowik dolny'),
	('EPK6', 'OKR2', 'Ordowik srodkowy'),
	('EPK7', 'OKR2', 'Ordowik gorny'),
	('EPK8', 'OKR3', 'Landower'),
	('EPK9', 'OKR3', 'Wenlok'),
	('EPK10', 'OKR3', 'Ludlow'),
	('EPK11', 'OKR3', 'Przydol'),
	('EPK12', 'OKR4', 'Dewon dolny'),
	('EPK13', 'OKR4', 'Dewon srodkowy'),
	('EPK14', 'OKR4', 'Dewon gorny'),
	('EPK15', 'OKR5', 'Missisip'),
	('EPK16', 'OKR5', 'Pensylwan'),
	('EPK17', 'OKR6', 'Cisural'),
	('EPK18', 'OKR6', 'Gwadalup'),
	('EPK19', 'OKR6', 'Loping'),
	('EPK20', 'OKR7', 'Trias dolny'),
	('EPK21', 'OKR7', 'Trias srodkowy'),
	('EPK22', 'OKR7', 'Trias gorny'),
	('EPK23', 'OKR8', 'Jura dolna'),
	('EPK24', 'OKR8', 'Jura srodkowa'),
	('EPK25', 'OKR8', 'Jura gorna'),
	('EPK26', 'OKR9', 'Kreda dolna'),
	('EPK27', 'OKR9', 'Kreda gorna'),
	('EPK28', 'OKR10', 'Paleocen'),
	('EPK29', 'OKR10', 'Eocen'),
	('EPK30', 'OKR10', 'Oligocen'),
	('EPK31', 'OKR11', 'Miocen'),
	('EPK32', 'OKR11', 'Pliocen'),
	('EPK33', 'OKR12', 'Plejstocen'),
	('EPK34', 'OKR12', 'Holocen');

--Piêtro
INSERT INTO 
	tabela_stratygraficzna.GeoPietro
VALUES
	('PIE1', 'EPK1', 'Fortun'),
	('PIE2', 'EPK1', 'Pietro 2 (Kambr)'),
	('PIE3', 'EPK2', 'Pietro 3 (Kambr)'),
	('PIE4', 'EPK2', 'Pietro 4 (Kambr)'),
	('PIE5', 'EPK3', 'Pietro 5 (Kambr)'),
	('PIE6', 'EPK3', 'Drum'),
	('PIE7', 'EPK3', 'Guzang'),
	('PIE8', 'EPK4', 'Paib'),
	('PIE9', 'EPK4', 'Jiangshan'),
	('PIE10', 'EPK4', 'Pietro 10 (Kambr)'),
	('PIE11', 'EPK5', 'Tremadok'),
	('PIE12', 'EPK5', 'Flo'),
	('PIE13', 'EPK6', 'Daping'),
	('PIE14', 'EPK6', 'Darriwil'),
	('PIE15', 'EPK7', 'Sandb'),
	('PIE16', 'EPK7', 'Kat'),
	('PIE17', 'EPK7', 'Hirnant'),
	('PIE18', 'EPK8', 'Rhuddan'),
	('PIE19', 'EPK8', 'Aeron'),
	('PIE20', 'EPK8', 'Telych'),
	('PIE21', 'EPK9', 'Sheinwood'),
	('PIE22', 'EPK9', 'Homer'),
	('PIE23', 'EPK10', 'Gorst'),
	('PIE24', 'EPK10', 'Ludford'),
	('PIE25', 'EPK11', ''),
	('PIE26', 'EPK12', 'Lochkow'),
	('PIE27', 'EPK12', 'Prag'),
	('PIE28', 'EPK12', 'Ems'),
	('PIE29', 'EPK13', 'Eifel'),
	('PIE30', 'EPK13', 'Zywet'),
	('PIE31', 'EPK14', 'Fran'),
	('PIE32', 'EPK14', 'Famen'),
	('PIE33', 'EPK15', ''),
	('PIE34', 'EPK16', ''),
	('PIE35', 'EPK17', 'Aselsk'),
	('PIE36', 'EPK17', 'Sakmar'),
	('PIE37', 'EPK17', 'Artynsk'),
	('PIE38', 'EPK17', 'Kungur'),
	('PIE39', 'EPK18', 'Road'),
	('PIE40', 'EPK18', 'Word'),
	('PIE41', 'EPK18', 'Kapitan'),
	('PIE42', 'EPK19', 'Wucziaping'),
	('PIE43', 'EPK19', 'Czangszing'),
	('PIE44', 'EPK20', 'Ind'),
	('PIE45', 'EPK20', 'Olenek'),
	('PIE46', 'EPK21', 'Anizyk'),
	('PIE47', 'EPK21', 'Ladyn'),
	('PIE48', 'EPK22', 'Karnik'),
	('PIE49', 'EPK22', 'Noryk'),
	('PIE50', 'EPK22', 'Retyk'),
	('PIE51', 'EPK23', 'Hetang'),
	('PIE52', 'EPK23', 'Synemur'),
	('PIE53', 'EPK23', 'Pliensbach'),
	('PIE54', 'EPK23', 'Toark'),
	('PIE55', 'EPK24', 'Aalen'),
	('PIE56', 'EPK24', 'Bajos'),
	('PIE57', 'EPK24', 'Baton'),
	('PIE58', 'EPK24', 'Kelowej'),
	('PIE59', 'EPK25', 'Oksford'),
	('PIE60', 'EPK25', 'Kimeryd'),
	('PIE61', 'EPK25', 'Tyton'),
	('PIE62', 'EPK26', 'Berias'),
	('PIE63', 'EPK26', 'Walanzyn'),
	('PIE64', 'EPK26', 'Hoteryw'),
	('PIE65', 'EPK26', 'Barrem'),
	('PIE66', 'EPK26', 'Apt'),
	('PIE67', 'EPK26', 'Alb'),
	('PIE68', 'EPK27', 'Cenoman'),
	('PIE69', 'EPK27', 'Turon'),
	('PIE70', 'EPK27', 'Koniak'),
	('PIE71', 'EPK27', 'Santon'),
	('PIE72', 'EPK27', 'Kampan'),
	('PIE73', 'EPK27', 'Mastrycht'),
	('PIE74', 'EPK28', 'Dan'),
	('PIE75', 'EPK28', 'Zeland'),
	('PIE76', 'EPK28', 'Tanet'),
	('PIE77', 'EPK29', 'Iprez'),
	('PIE78', 'EPK29', 'Lutet'),
	('PIE79', 'EPK29', 'Barton'),
	('PIE80', 'EPK29', 'Priabon'),
	('PIE81', 'EPK30', 'Rupel'),
	('PIE82', 'EPK30', 'Szat'),
	('PIE83', 'EPK31', 'Akwitan'),
	('PIE84', 'EPK31', 'Burdygal'),
	('PIE85', 'EPK31', 'Lang'),
	('PIE86', 'EPK31', 'Serrawal'),
	('PIE87', 'EPK31', 'Torton'),
	('PIE88', 'EPK31', 'Messyn'),
	('PIE89', 'EPK32', 'Zankl'),
	('PIE90', 'EPK32', 'Piacent'),
	('PIE91', 'EPK33', 'Gelas'),
	('PIE92', 'EPK33', 'Kalabr'),
	('PIE93', 'EPK33', 'Jon'),
	('PIE94', 'EPK33', 'Plejstocen gorny'),
	('PIE95', 'EPK34', '');

--3. Konstrukcja wymiary geochronologicznego
DROP TABLE tabela_stratygraficzna.TabelaStr
SELECT
	geo_p.id_pietro AS ID_pietra,
	geo_p.nazwa_pietro AS Pietro,
	geo_ep.id_epoka AS ID_epoki,
	geo_ep.nazwa_epoka AS Epoka,
	geo_o.id_okres AS ID_okresu,
	geo_o.nazwa_okres AS Okres,
	geo_er.id_era AS ID_ery,
	geo_er.nazwa_era AS Era,
	geo_eo.id_eon AS ID_eonu,
	geo_eo.nazwa_eon AS Eon
INTO
	tabela_stratygraficzna.TabelaStr
FROM
	tabela_stratygraficzna.GeoPietro geo_p
NATURAL JOIN 
	tabela_stratygraficzna.GeoEpoka geo_ep
NATURAL JOIN
	tabela_stratygraficzna.GeoOkres geo_o
NATURAL JOIN
	tabela_stratygraficzna.GeoEra geo_er
NATURAL JOIN
	tabela_stratygraficzna.GeoEon geo_eo;

ALTER TABLE tabela_stratygraficzna.TabelaStr
ADD PRIMARY KEY(ID_pietra);

SELECT 
	*
FROM 
	tabela_stratygraficzna.TabelaStr
ORDER BY
	CAST(RIGHT(ID_pietra, LENGTH(ID_pietra)-3) AS INT);

--Utworzenie tabel "Dziesiec" i "Milion"
CREATE SCHEMA liczby;

CREATE TABLE liczby.dziesiec(
	wartosc INT NOT NULL
);

INSERT INTO liczby.dziesiec
VALUES(0);

INSERT INTO liczby.dziesiec
VALUES(1);

INSERT INTO liczby.dziesiec
VALUES(2);

INSERT INTO liczby.dziesiec
VALUES(3);

INSERT INTO liczby.dziesiec
VALUES(4);

INSERT INTO liczby.dziesiec
VALUES(5);

INSERT INTO liczby.dziesiec
VALUES(6);

INSERT INTO liczby.dziesiec
VALUES(7);

INSERT INTO liczby.dziesiec
VALUES(8);

INSERT INTO liczby.dziesiec
VALUES(9);

SELECT
	d1.wartosc+10*d2.wartosc+100*d3.wartosc+1000*d4.wartosc+10000*d5.wartosc+100000*d6.wartosc AS liczba
INTO
	liczby.milion
FROM
	liczby.dziesiec d1,
	liczby.dziesiec d2,
	liczby.dziesiec d3,
	liczby.dziesiec d4,
	liczby.dziesiec d5,
	liczby.dziesiec d6;

SELECT * FROM liczby.milion
ORDER BY liczby.milion.liczba;

--Testy
--1
SELECT 
	COUNT(*)
FROM
	liczby.milion m
INNER JOIN
	tabela_stratygraficzna.TabelaStr t
ON
	m.liczba%95=CAST(RIGHT(t.ID_pietra, LENGTH(t.ID_pietra)-3) AS INT);

--2
SELECT
	COUNT(*)
FROM
	liczby.milion m
INNER JOIN
	tabela_stratygraficzna.GeoPietro geo_p
ON
	m.liczba%95=CAST(RIGHT(geo_p.id_pietro, LENGTH(geo_p.id_pietro)-3) AS INT)
NATURAL JOIN 
	tabela_stratygraficzna.GeoEpoka geo_ep
NATURAL JOIN
	tabela_stratygraficzna.GeoOkres geo_o
NATURAL JOIN
	tabela_stratygraficzna.GeoEra geo_er
NATURAL JOIN
	tabela_stratygraficzna.GeoEon geo_eo;

--3
SELECT
	COUNT(*)
FROM
	liczby.milion m
WHERE
	m.liczba%95=
	(SELECT 
		CAST(RIGHT(t.ID_pietra, LENGTH(t.ID_pietra)-3) AS INT) 
	FROM 
		tabela_stratygraficzna.TabelaStr t
	WHERE
		m.liczba%95=CAST(RIGHT(t.ID_pietra, LENGTH(t.ID_pietra)-3) AS INT));

--4
SELECT
	COUNT(*)
FROM
	liczby.milion m
WHERE
	m.liczba%95 IN
	(SELECT
		CAST(RIGHT(geo_p.id_pietro, LENGTH(geo_p.id_pietro)-3) AS INT)
	FROM
		tabela_stratygraficzna.GeoPietro geo_p
	NATURAL JOIN 
		tabela_stratygraficzna.GeoEpoka geo_ep
	NATURAL JOIN
		tabela_stratygraficzna.GeoOkres geo_o
	NATURAL JOIN
		tabela_stratygraficzna.GeoEra geo_er
	NATURAL JOIN
		tabela_stratygraficzna.GeoEon geo_eo);
		
--Dodawanie indexow
CREATE INDEX ix_geoeon_eon
ON tabela_stratygraficzna.GeoEon(id_eon);

CREATE INDEX ix_geoera_era
ON tabela_stratygraficzna.GeoEra(id_era);

CREATE INDEX ix_geoera_eon
ON tabela_stratygraficzna.GeoEra(id_eon);

CREATE INDEX ix_geookres_okres
ON tabela_stratygraficzna.GeoOkres(id_okres);

CREATE INDEX ix_geookres_era
ON tabela_stratygraficzna.GeoOkres(id_era);

CREATE INDEX ix_geoepoka_epoka
ON tabela_stratygraficzna.GeoEpoka(id_epoka);

CREATE INDEX ix_geoepoka_okres
ON tabela_stratygraficzna.GeoEpoka(id_okres);

CREATE INDEX ix_geopietro_pietro
ON tabela_stratygraficzna.GeoPietro(id_pietro);

CREATE INDEX ix_geopietro_epoka
ON tabela_stratygraficzna.GeoPietro(id_epoka);

CREATE INDEX ix_tabelastr_pietro
ON tabela_stratygraficzna.TabelaStr(ID_pietra);

CREATE INDEX ix_tabelastr_epoka
ON tabela_stratygraficzna.TabelaStr(ID_epoki);

CREATE INDEX ix_tabelastr_okres
ON tabela_stratygraficzna.TabelaStr(ID_okresu);

CREATE INDEX ix_tabelastr_era
ON tabela_stratygraficzna.TabelaStr(ID_ery);

CREATE INDEX ix_tabelastr_eon
ON tabela_stratygraficzna.TabelaStr(ID_eonu);

CREATE INDEX ix_milion_liczba
ON liczby.milion(liczba);
--usuwanie indexow
DROP INDEX ix_geoeon_eon
ON tabela_stratygraficzna.GeoEon;

DROP INDEX ix_geoera_era
ON tabela_stratygraficzna.GeoEra;

DROP INDEX ix_geoera_eon
ON tabela_stratygraficzna.GeoEra;

DROP INDEX ix_geookres_okres
ON tabela_stratygraficzna.GeoOkres;

DROP INDEX ix_geookres_era
ON tabela_stratygraficzna.GeoOkres;

DROP INDEX ix_geoepoka_epoka
ON tabela_stratygraficzna.GeoEpoka;

DROP INDEX ix_geoepoka_okres
ON tabela_stratygraficzna.GeoEpoka;

DROP INDEX ix_geopietro_pietro
ON tabela_stratygraficzna.GeoPietro;

DROP INDEX ix_geopietro_epoka
ON tabela_stratygraficzna.GeoPietro;

DROP INDEX ix_tabelastr_pietro
ON tabela_stratygraficzna.TabelaStr;

DROP INDEX ix_tabelastr_epoka
ON tabela_stratygraficzna.TabelaStr;

DROP INDEX ix_tabelastr_okres
ON tabela_stratygraficzna.TabelaStr;

DROP INDEX ix_tabelastr_era
ON tabela_stratygraficzna.TabelaStr;

DROP INDEX ix_tabelastr_eon
ON tabela_stratygraficzna.TabelaStr;

DROP INDEX ix_milion_liczba
ON liczby.milion;