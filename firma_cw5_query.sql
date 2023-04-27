--zad1
CREATE DATABASE firma_cw5;
USE firma_cw5;
--zad2
CREATE SCHEMA ksiegowosc;
--zad3
CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika VARCHAR(4) PRIMARY KEY, 
	imie VARCHAR(25) NOT NULL,
	nazwisko VARCHAR(40) NOT NULL,
	adres VARCHAR(40) NOT NULL,
	telefon INT
);
CREATE TABLE ksiegowosc.godziny(
	id_godziny VARCHAR(4) PRIMARY KEY,
	data_ DATE NOT NULL,
	liczba_godzin INT NOT NULL,
	id_pracownika VARCHAR(4) NOT NULL
);
CREATE TABLE ksiegowosc.pensje(
	id_pensji VARCHAR(4) PRIMARY KEY,
	stanowisko VARCHAR(30),
	kwota MONEY NOT NULL
);
CREATE TABLE ksiegowosc.premie(
	id_premii VARCHAR(4) PRIMARY KEY,
	rodzaj VARCHAR(20),
	kwota MONEY
);
CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia VARCHAR(4) PRIMARY KEY,
	data_ DATE NOT NULL,
	id_pracownika VARCHAR(4) NOT NULL,
	id_godziny VARCHAR(4) NOT NULL,
	id_pensji VARCHAR(4) NOT NULL,
	id_premii VARCHAR(4) NOT NULL
);

ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_godziny)
REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji)
REFERENCES ksiegowosc.pensje(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_premii)
REFERENCES ksiegowosc.premie (id_premii);
--zad4
INSERT INTO ksiegowosc.pracownicy
VALUES('E001', 'Jan', 'Kowalski', 'ul. Fio³kowa', 515329076);
INSERT INTO ksiegowosc.pracownicy
VALUES('E002', 'Tomasz', 'Nowak', 'ul. Sezamkowa', 672453100);
INSERT INTO ksiegowosc.pracownicy
VALUES('E003', 'Alicja', 'Nie', 'ul. Rowerowa', 934722182);
INSERT INTO ksiegowosc.pracownicy
VALUES('E004', 'Szymon', 'Mam', 'ul. Lwowska', 762090563);
INSERT INTO ksiegowosc.pracownicy
VALUES('E005', 'Katarzyna', 'Pomys³u', 'ul. Krakowska', 809241618);
INSERT INTO ksiegowosc.pracownicy
VALUES('E006', 'Julia', 'Na', 'ul. Wroc³awska', 515786922);
INSERT INTO ksiegowosc.pracownicy
VALUES('E007', 'Paulina', 'Nazwiska', 'ul. Europejska', 721092312);
INSERT INTO ksiegowosc.pracownicy
VALUES('E008', 'Kamil', 'Œlimak', 'ul. Poznañska', 659288976);
INSERT INTO ksiegowosc.pracownicy
VALUES('E009', 'Jan', 'Oblak', 'ul. Madrycka', 723335961);
INSERT INTO ksiegowosc.pracownicy
VALUES('E010', 'Andrew', 'Robertson', 'ul. Liverpoolska', 724206620);

INSERT INTO ksiegowosc.godziny
VALUES('H001', '2023-04-13', 8, 'E002');
INSERT INTO ksiegowosc.godziny
VALUES('H002', '2023-04-13', 9, 'E004');
INSERT INTO ksiegowosc.godziny
VALUES('H003', '2023-04-14', 7, 'E001');
INSERT INTO ksiegowosc.godziny
VALUES('H004', '2023-04-14', 8, 'E003');
INSERT INTO ksiegowosc.godziny
VALUES('H005', '2023-04-14', 6, 'E008');
INSERT INTO ksiegowosc.godziny
VALUES('H006', '2023-04-15', 9, 'E010');
INSERT INTO ksiegowosc.godziny
VALUES('H007', '2023-04-16', 10, 'E005');
INSERT INTO ksiegowosc.godziny
VALUES('H008', '2023-04-16', 7, 'E006');
INSERT INTO ksiegowosc.godziny
VALUES('H009', '2023-04-17', 5, 'E007');
INSERT INTO ksiegowosc.godziny
VALUES('H010', '2023-04-17', 8, 'E009');

INSERT INTO ksiegowosc.pensje
VALUES('S001', NULL, 3200.00);
INSERT INTO ksiegowosc.pensje
VALUES('S002', 'Ksiêgowy', 3500.00);
INSERT INTO ksiegowosc.pensje
VALUES('S003', 'Konserwator', 3300.00);
INSERT INTO ksiegowosc.pensje
VALUES('S004', NULL, 6200.00);
INSERT INTO ksiegowosc.pensje
VALUES('S005', 'Doradca finansowy', 5800.00);
INSERT INTO ksiegowosc.pensje
VALUES('S006', 'Analityk', 5500.00);
INSERT INTO ksiegowosc.pensje
VALUES('S007', NULL, 4200.00);
INSERT INTO ksiegowosc.pensje
VALUES('S008', 'Project manager', 9000.00);
INSERT INTO ksiegowosc.pensje
VALUES('S009', NULL, 3400.00);
INSERT INTO ksiegowosc.pensje
VALUES('S010', 'CEO', 14000.00);

INSERT INTO ksiegowosc.premie
VALUES('B001', 'Dodatek œwi¹teczny', 300.00);
INSERT INTO ksiegowosc.premie
VALUES('B002', NULL, 800.00);
INSERT INTO ksiegowosc.premie
VALUES('B003', 'Nadgodziny', 44.00);
INSERT INTO ksiegowosc.premie
VALUES('B004', 'Na pocieszenie', 1.00);
INSERT INTO ksiegowosc.premie
VALUES('B005', 'Dodatek motywacyjny', 600.00);
INSERT INTO ksiegowosc.premie
VALUES('B006', 'Cele rozwojowe', 1200.00 );
INSERT INTO ksiegowosc.premie
VALUES('B007', NULL, 1050.00);
INSERT INTO ksiegowosc.premie
VALUES('B008', NULL, NULL);
INSERT INTO ksiegowosc.premie
VALUES('B009', NULL, NULL);
INSERT INTO ksiegowosc.premie(id_premii, rodzaj, kwota)
VALUES('B010', NULL, NULL);

INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W001', '2023-05-10', 'E001', 'H001', 'S001', 'B001');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W002', '2023-05-10', 'E002', 'H002', 'S002', 'B002');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W003', '2023-05-10', 'E003', 'H003', 'S003', 'B003');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W004', '2023-05-10', 'E004', 'H004', 'S004', 'B004');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W005', '2023-05-10', 'E005', 'H005', 'S005', 'B005');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W006', '2023-05-10', 'E006', 'H006', 'S006', 'B006');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W007', '2023-05-10', 'E007', 'H007', 'S007', 'B007');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W008', '2023-05-10', 'E008', 'H008', 'S008', 'B008');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W009', '2023-05-10', 'E009', 'H009', 'S009', 'B009');
INSERT INTO ksiegowosc.wynagrodzenie
VALUES('W010', '2023-05-10', 'E010', 'H010', 'S010', 'B010');
--zad 5
--a
SELECT id_pracownika, nazwisko
FROM ksiegowosc.pracownicy;
--b
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota>1000;
--c
SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.premie
ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
INNER JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota>2000 AND ksiegowosc.premie.kwota IS NULL;
--d
SELECT *
FROM ksiegowosc.pracownicy
WHERE ksiegowosc.pracownicy.imie LIKE 'J%';
--e
SELECT *
FROM ksiegowosc.pracownicy
WHERE ksiegowosc.pracownicy.imie LIKE '%a' AND ksiegowosc.pracownicy.nazwisko LIKE '%n%';
--f
SELECT imie, nazwisko, ((ksiegowosc.godziny.liczba_godzin*6*4)-160) AS 'liczba_nadgodzin' INTO ksiegowosc.nadgodziny
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.godziny
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.godziny.id_pracownika;
UPDATE ksiegowosc.nadgodziny
SET ksiegowosc.nadgodziny.liczba_nadgodzin=0
WHERE ksiegowosc.nadgodziny.liczba_nadgodzin<=0;
SELECT *
FROM ksiegowosc.nadgodziny;
--g
SELECT imie, nazwisko
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota>1500 AND ksiegowosc.pensje.kwota<3000;
--h
SELECT imie, nazwisko
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.premie
ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
INNER JOIN ksiegowosc.godziny
ON ksiegowosc.wynagrodzenie.id_godziny=ksiegowosc.godziny.id_godziny
WHERE ((ksiegowosc.godziny.liczba_godzin*6*4)-160)>0 AND ksiegowosc.premie.kwota IS NULL;
--i
SELECT imie, nazwisko, kwota
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
ORDER BY ksiegowosc.pensje.kwota;
--j
SELECT imie, nazwisko, ksiegowosc.pensje.kwota, ksiegowosc.premie.kwota
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
INNER JOIN ksiegowosc.premie
ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
ORDER BY ksiegowosc.pensje.kwota DESC, ksiegowosc.premie.kwota DESC;
--k
SELECT stanowisko, COUNT(stanowisko) AS 'Liczba_pracownikow'
FROM ksiegowosc.pensje
GROUP BY stanowisko;
--l
SELECT stanowisko, AVG(kwota) AS 'Srednia', MIN(kwota) AS 'Minimalna', MAX(kwota) AS 'Maksymalna'
FROM ksiegowosc.pensje
WHERE stanowisko='CEO'
GROUP BY stanowisko;
--m
SELECT SUM(ksiegowosc.pensje.kwota)+SUM(ksiegowosc.premie.kwota) AS 'Suma_wynagrodzen'
FROM ksiegowosc.pensje
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pensje.id_pensji=ksiegowosc.wynagrodzenie.id_pensji
INNER JOIN ksiegowosc.premie
ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii;
--n
SELECT stanowisko, ISNULL(SUM(ksiegowosc.pensje.kwota), 0) + ISNULL(SUM(ksiegowosc.premie.kwota), 0) AS 'Suma_wynagrodzen'
FROM ksiegowosc.pensje
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pensje.id_pensji=ksiegowosc.wynagrodzenie.id_pensji
INNER JOIN ksiegowosc.premie
ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
GROUP BY ksiegowosc.pensje.stanowisko;
--o
SELECT stanowisko, COUNT(ksiegowosc.premie.id_premii) AS 'Ilosc_premii'
FROM ksiegowosc.pensje
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pensje.id_pensji=ksiegowosc.wynagrodzenie.id_pensji
INNER JOIN ksiegowosc.premie
ON ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premie.id_premii
GROUP BY ksiegowosc.pensje.stanowisko; 
--p
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
DELETE ksiegowosc.pracownicy
FROM ksiegowosc.pracownicy
INNER JOIN ksiegowosc.wynagrodzenie
ON ksiegowosc.pracownicy.id_pracownika=ksiegowosc.wynagrodzenie.id_pracownika
INNER JOIN ksiegowosc.pensje
ON ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
WHERE ksiegowosc.pensje.kwota<1200;
SELECT *
FROM ksiegowosc.pracownicy;