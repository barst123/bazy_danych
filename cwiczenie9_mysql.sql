CREATE DATABASE stratygrafia_4;
USE stratygrafia_4;

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

#tworzenie referencji - mysql tworzy indeksy dla kluczy obcych!!!

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

#wprowadzanie danych

#Eon
INSERT INTO tabela_stratygraficzna.GeoEon
VALUES('EON1', 'Fanerozoik');

#Era
INSERT INTO tabela_stratygraficzna.GeoEra
VALUES('ERA1', 'EON1', 'Paleozoik');

INSERT INTO tabela_stratygraficzna.GeoEra
VALUES('ERA2', 'EON1', 'Mezozoik');

INSERT INTO tabela_stratygraficzna.GeoEra
VALUES('ERA3', 'EON1', 'Kenozoik');

#Okres
INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR1', 'ERA1', 'Kambr');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR2', 'ERA1', 'Ordowik');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR3', 'ERA1', 'Sylur');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR4', 'ERA1', 'Dewon');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR5', 'ERA1', 'Karbon');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR6', 'ERA1', 'Perm');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR7', 'ERA2', 'Trias');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR8', 'ERA2', 'Jura');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR9', 'ERA2', 'Kreda');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR10', 'ERA3', 'Paleogen');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR11', 'ERA3', 'Neogen');

INSERT INTO tabela_stratygraficzna.GeoOkres
VALUES('OKR12', 'ERA3', 'Czwartorzed');

#Epoka
INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK1', 'OKR1', 'Terenew');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK2', 'OKR1', 'Oddzial 2 (Kambr)');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK3', 'OKR1', 'Oddzial 3 (Kambr)');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK4', 'OKR1', 'Furong');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK5', 'OKR2', 'Ordowik dolny');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK6', 'OKR2', 'Ordowik œrodkowy');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK7', 'OKR2', 'Ordowik górny');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK8', 'OKR3', 'Landower');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK9', 'OKR3', 'Wenlok');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK10', 'OKR3', 'Ludlow');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK11', 'OKR3', 'Przydol');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK12', 'OKR4', 'Dewon dolny');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK13', 'OKR4', 'Dewon srodkowy');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK14', 'OKR4', 'Dewon gorny');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK15', 'OKR5', 'Missisip');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK16', 'OKR5', 'Pensylwan');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK17', 'OKR6', 'Cisural');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK18', 'OKR6', 'Gwadalup');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK19', 'OKR6', 'Loping');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK20', 'OKR7', 'Trias dolny');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK21', 'OKR7', 'Trias srodkowy');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK22', 'OKR7', 'Trias gorny');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK23', 'OKR8', 'Jura dolna');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK24', 'OKR8', 'Jura srodkowa');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK25', 'OKR8', 'Jura gorna');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK26', 'OKR9', 'Kreda dolna');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK27', 'OKR9', 'Kreda gorna');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK28', 'OKR10', 'Paleocen');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK29', 'OKR10', 'Eocen');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK30', 'OKR10', 'Oligocen');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK31', 'OKR11', 'Miocen');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK32', 'OKR11', 'Pliocen');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK33', 'OKR12', 'Plejstocen');

INSERT INTO tabela_stratygraficzna.GeoEpoka
VALUES('EPK34', 'OKR12', 'Holocen');

#Piêtro
INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE1', 'EPK1', 'Fortun');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE2', 'EPK1', 'Pietro 2 (Kambr)');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE3', 'EPK2', 'Pietro 3 (Kambr)');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE4', 'EPK2', 'Pietro 4 (Kambr)');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE5', 'EPK3', 'Pietro 5 (Kambr)');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE6', 'EPK3', 'Drum');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE7', 'EPK3', 'Guzang');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE8', 'EPK4', 'Paib');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE9', 'EPK4', 'Jiangshan');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE10', 'EPK4', 'Pietro 10 (Kambr)');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE11', 'EPK5', 'Tremadok');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE12', 'EPK5', 'Flo');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE13', 'EPK6', 'Daping');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE14', 'EPK6', 'Darriwil');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE15', 'EPK7', 'Sandb');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE16', 'EPK7', 'Kat');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE17', 'EPK7', 'Hirnant');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE18', 'EPK8', 'Rhuddan');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE19', 'EPK8', 'Aeron');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE20', 'EPK8', 'Telych');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE21', 'EPK9', 'Sheinwood');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE22', 'EPK9', 'Homer');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE23', 'EPK10', 'Gorst');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE24', 'EPK10', 'Ludford');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE25', 'EPK11', '');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE26', 'EPK12', 'Lochkow');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE27', 'EPK12', 'Prag');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE28', 'EPK12', 'Ems');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE29', 'EPK13', 'Eifel');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE30', 'EPK13', 'Zywet');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE31', 'EPK14', 'Fran');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE32', 'EPK14', 'Famen');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE33', 'EPK15', '');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE34', 'EPK16', '');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE35', 'EPK17', 'Aselsk');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE36', 'EPK17', 'Sakmar');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE37', 'EPK17', 'Artynsk');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE38', 'EPK17', 'Kungur');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE39', 'EPK18', 'Road');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE40', 'EPK18', 'Word');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE41', 'EPK18', 'Kapitan');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE42', 'EPK19', 'Wucziaping');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE43', 'EPK19', 'Czangszing');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE44', 'EPK20', 'Ind');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE45', 'EPK20', 'Olenek');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE46', 'EPK21', 'Anizyk');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE47', 'EPK21', 'Ladyn');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE48', 'EPK22', 'Karnik');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE49', 'EPK22', 'Noryk');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE50', 'EPK22', 'Retyk');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE51', 'EPK23', 'Hetang');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE52', 'EPK23', 'Synemur');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE53', 'EPK23', 'Pliensbach');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE54', 'EPK23', 'Toark');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE55', 'EPK24', 'Aalen');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE56', 'EPK24', 'Bajos');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE57', 'EPK24', 'Baton');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE58', 'EPK24', 'Kelowej');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE59', 'EPK25', 'Oksford');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE60', 'EPK25', 'Kimeryd');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE61', 'EPK25', 'Tyton');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE62', 'EPK26', 'Berias');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE63', 'EPK26', 'Walanzyn');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE64', 'EPK26', 'Hoteryw');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE65', 'EPK26', 'Barrem');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE66', 'EPK26', 'Apt');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE67', 'EPK26', 'Alb');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE68', 'EPK27', 'Cenoman');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE69', 'EPK27', 'Turon');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE70', 'EPK27', 'Koniak');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE71', 'EPK27', 'Santon');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE72', 'EPK27', 'Kampan');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE73', 'EPK27', 'Mastrycht');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE74', 'EPK28', 'Dan');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE75', 'EPK28', 'Zeland');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE76', 'EPK28', 'Tanet');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE77', 'EPK29', 'Iprez');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE78', 'EPK29', 'Lutet');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE79', 'EPK29', 'Barton');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE80', 'EPK29', 'Priabon');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE81', 'EPK30', 'Rupel');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE82', 'EPK30', 'Szat');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE83', 'EPK31', 'Akwitan');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE84', 'EPK31', 'Burdygal');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE85', 'EPK31', 'Lang');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE86', 'EPK31', 'Serrawal');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE87', 'EPK31', 'Torton');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE88', 'EPK31', 'Messyn');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE89', 'EPK32', 'Zankl');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE90', 'EPK32', 'Piacent');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE91', 'EPK33', 'Gelas');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE92', 'EPK33', 'Kalabr');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE93', 'EPK33', 'Jon');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE94', 'EPK33', 'Plejstocen gorny');

INSERT INTO tabela_stratygraficzna.GeoPietro
VALUES('PIE95', 'EPK34', '');

#3. Konstrukcja wymiary geochronologicznego
CREATE TABLE
	tabela_stratygraficzna.TabelaStr
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
FROM
	tabela_stratygraficzna.GeoPietro geo_p
INNER JOIN 
	tabela_stratygraficzna.GeoEpoka geo_ep
ON
	geo_p.id_epoka=geo_ep.id_epoka
INNER JOIN
	tabela_stratygraficzna.GeoOkres geo_o
ON
	geo_ep.id_okres=geo_o.id_okres
INNER JOIN
	tabela_stratygraficzna.GeoEra geo_er
ON
	geo_o.id_era=geo_er.id_era
INNER JOIN
	tabela_stratygraficzna.GeoEon geo_eo
ON
	geo_er.id_eon=geo_eo.id_eon;

ALTER TABLE tabela_stratygraficzna.TabelaStr
ADD PRIMARY KEY(ID_pietra);

SELECT 
	*
FROM 
	tabela_stratygraficzna.TabelaStr
ORDER BY
	CAST(RIGHT(ID_pietra, LENGTH(ID_pietra)-3) AS UNSIGNED);

#Utworzenie tabel "Dziesiec" i "Milion"
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

CREATE TABLE
	liczby.milion
SELECT
	d1.wartosc+10*d2.wartosc+100*d3.wartosc+1000*d4.wartosc+10000*d5.wartosc+100000*d6.wartosc AS liczba
FROM
	liczby.dziesiec d1,
	liczby.dziesiec d2,
	liczby.dziesiec d3,
	liczby.dziesiec d4,
	liczby.dziesiec d5,
	liczby.dziesiec d6;

SELECT * FROM liczby.milion
ORDER BY liczby.milion.liczba;

#Testy
#1
SELECT 
	COUNT(*)
FROM
	liczby.milion m
INNER JOIN
	tabela_stratygraficzna.TabelaStr t
ON
	m.liczba%95=CAST(RIGHT(t.ID_pietra, LENGTH(t.ID_pietra)-3) AS UNSIGNED);

#2
SELECT
	COUNT(*)
FROM
	liczby.milion m
INNER JOIN
	tabela_stratygraficzna.GeoPietro geo_p
ON
	m.liczba%95=CAST(RIGHT(geo_p.id_pietro, LENGTH(geo_p.id_pietro)-3) AS UNSIGNED)
NATURAL JOIN 
	tabela_stratygraficzna.GeoEpoka geo_ep
NATURAL JOIN
	tabela_stratygraficzna.GeoOkres geo_o
NATURAL JOIN
	tabela_stratygraficzna.GeoEra geo_er
NATURAL JOIN
	tabela_stratygraficzna.GeoEon geo_eo;

#3
SELECT
	COUNT(*)
FROM
	liczby.milion m
WHERE
	m.liczba%95=
	(SELECT 
		CAST(RIGHT(t.ID_pietra, LENGTH(t.ID_pietra)-3) AS UNSIGNED) 
	FROM 
		tabela_stratygraficzna.TabelaStr t
	WHERE
		m.liczba%95=CAST(RIGHT(t.ID_pietra, LENGTH(t.ID_pietra)-3) AS UNSIGNED));

#4
SELECT
	COUNT(*)
FROM
	liczby.milion m
WHERE
	m.liczba%95 IN
	(SELECT
		CAST(RIGHT(geo_p.id_pietro, LENGTH(geo_p.id_pietro)-3) AS UNSIGNED)
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
		
#Dodawanie indexow - mysql tworzy automatycznie na kluczu obcym indexy
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
#usuwanie indexow
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