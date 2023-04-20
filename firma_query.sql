-- zad 1
CREATE DATABASE firma;
-- zad 2
CREATE SCHEMA rozliczenia;

-- zad 3
CREATE TABLE rozliczenia.pracownicy(
	id_pracownika INT PRIMARY KEY, 
	imie VARCHAR(20) NOT NULL,
	nazwisko VARCHAR(20) NOT NULL,
	adres VARCHAR(40) NOT NULL,
	telefon INT
);
CREATE TABLE rozliczenia.godziny(
	id_godziny INT PRIMARY KEY,
	data_ DATE NOT NULL,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL
);
CREATE TABLE rozliczenia.pensje(
	id_pensji INT PRIMARY KEY,
	stanowisko VARCHAR(30),
	kwota MONEY NOT NULL,
	id_premii INT
);
CREATE TABLE rozliczenia.premie(
	id_premii INT PRIMARY KEY,
	rodzaj VARCHAR(20),
	kwota MONEY
);

ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie(id_premii);

-- zad 4
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(001, 'Jan', 'Kowalski', 'ul. Fio³kowa', 515329076);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(002, 'Tomasz', 'Nowak', 'ul. Sezamkowa', 672453100);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(003, 'Alicja', 'Nie', 'ul. Rowerowa', 934722182);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(004, 'Szymon', 'Mam', 'ul. Lwowska', 762090563);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(005, 'Katarzyna', 'Pomys³u', 'ul. Krakowska', 809241618);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(006, 'Julia', 'Na', 'ul. Wroc³awska', 515786922);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(007, 'Paulina', 'Nazwiska', 'ul. Europejska', 721092312);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(008, 'Kamil', 'Œlimak', 'ul. Poznañska', 659288976);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(009, 'Jan', 'Oblak', 'ul. Madrycka', 723335961);
INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(010, 'Andrew', 'Robertson', 'ul. Liverpoolska', 724206620);

INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(01, '2023-04-13', 8, 002);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(02, '2023-04-13', 6, 004);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(03, '2023-04-14', 8, 001);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(04, '2023-04-14', 8, 002);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(05, '2023-04-14', 7, 008);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(06, '2023-04-15', 3, 010);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(07, '2023-04-16', 6, 005);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(08, '2023-04-16', 8, 006);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(09, '2023-04-17', 9, 004);
INSERT INTO rozliczenia.godziny(id_godziny, data_, liczba_godzin, id_pracownika)
VALUES(10, '2023-04-17', 9, 009);

INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00001, 'Dodatek œwi¹teczny', 300.00);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00002, NULL, 800.00);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00003, 'Nadgodziny', 44.00);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00004, 'Na pocieszenie', 1.00);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00005, 'Dodatek motywacyjny', 600.00);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00006, 'Cele rozwojowe', 1200.00 );
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00007, NULL, NULL);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00008, NULL, NULL);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00009, NULL, NULL);
INSERT INTO rozliczenia.premie(id_premii, rodzaj, kwota)
VALUES(00010, NULL, NULL);

INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0001, NULL, 3200.00, NULL);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0002, 'Ksiêgowy', 3500.00, 00001);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0003, 'Konserwator', 3300.00, NULL);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0004, NULL, 6200.00, 00002);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0005, 'Doradca finansowy', 5800.00, NULL);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0006, 'Analityk', 5500.00, 00003);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0007, NULL, 4200.00, 00004);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0008, 'Project manager', 9000.00, 00005);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0009, NULL, 3400.00, NULL);
INSERT INTO rozliczenia.pensje(id_pensji, stanowisko, kwota, id_premii)
VALUES(0010, 'CEO', 14000.00, 00006);

-- zad 5
SELECT nazwisko, adres
FROM rozliczenia.pracownicy;

-- zad 6
SELECT DATEPART(weekday, data_) AS 'Dzieñ tygodnia',
DATEPART(month, data_) AS 'Miesi¹c'
FROM rozliczenia.godziny;

-- zad 7
sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
ALTER TABLE rozliczenia.pensje
ADD kwota_netto MONEY NOT NULL DEFAULT '0';
UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto * 0.81;
SELECT * FROM rozliczenia.pensje;
