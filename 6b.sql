USE firma_cw5;
--a
ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon varchar(20);

SELECT *
FROM ksiegowosc.pracownicy;

UPDATE ksiegowosc.pracownicy
SET ksiegowosc.pracownicy.telefon='(+48)'+ksiegowosc.pracownicy.telefon
WHERE ksiegowosc.pracownicy.telefon NOT LIKE '(+48)%';

SELECT *
FROM ksiegowosc.pracownicy;

--b
UPDATE ksiegowosc.pracownicy
SET ksiegowosc.pracownicy.telefon=SUBSTRING(ksiegowosc.pracownicy.telefon, 1, 8)+'-'+SUBSTRING(ksiegowosc.pracownicy.telefon, 9, 3)+'-'+SUBSTRING(ksiegowosc.pracownicy.telefon, 12, 3);

SELECT *
FROM ksiegowosc.pracownicy;

--c
SELECT TOP 1 UPPER(id_pracownika) AS id_pracownika, UPPER(imie) AS imie, UPPER(nazwisko) AS nazwisko, UPPER(adres) AS adres, UPPER(telefon) AS telefon
FROM ksiegowosc.pracownicy
ORDER BY LEN(nazwisko) DESC;

--d
SELECT p.id_pracownika, p.imie, p.nazwisko, p.adres, p.telefon, pe.kwota INTO ksiegowosc.dane_md5
FROM ksiegowosc.pracownicy p
INNER JOIN ksiegowosc.wynagrodzenie w
ON p.id_pracownika=w.id_pracownika
INNER JOIN ksiegowosc.pensje pe
ON w.id_pensji=pe.id_pensji;

SELECT *
FROM ksiegowosc.dane_md5;

SELECT 
HASHBYTES('md5', m.id_pracownika) AS id_pracownika,
HASHBYTES('md5', m.imie) AS imie,
HASHBYTES('md5', m.nazwisko) AS nazwisko,
HASHBYTES('md5', m.adres) AS adres,
HASHBYTES('md5', m.telefon) AS telefon,
HASHBYTES('md5', CAST(m.kwota AS varchar)) AS kwota
FROM ksiegowosc.dane_md5 m;

--e
SELECT p.id_pracownika, p.imie, p.nazwisko, p.adres, p.telefon, pe.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w
ON p.id_pracownika=w.id_pracownika
LEFT JOIN ksiegowosc.pensje pe
ON w.id_pensji=pe.id_pensji
LEFT JOIN ksiegowosc.premie pr
ON w.id_premii=pr.id_premii;

--f
SELECT p.imie, p.nazwisko, pe.kwota AS pensja, ISNULL(pr.kwota, 0) AS premia, g.liczba_godzin, n.liczba_nadgodzin, w.data_ AS data_ INTO ksiegowosc.zapytanie
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w
ON p.id_pracownika=w.id_pracownika
LEFT JOIN ksiegowosc.pensje pe
ON w.id_pensji=pe.id_pensji
LEFT JOIN ksiegowosc.premie pr
ON w.id_premii=pr.id_premii
LEFT JOIN ksiegowosc.nadgodziny2 n
ON p.id_pracownika=n.id_pracownika
LEFT JOIN ksiegowosc.godziny g
ON w.id_godziny=g.id_godziny;

SELECT *
FROM ksiegowosc.zapytanie;

ALTER TABLE ksiegowosc.zapytanie
ADD kwota_godzinowa money;

UPDATE ksiegowosc.zapytanie
SET kwota_godzinowa=(pensja/(6*4*liczba_godzin));

SELECT z.imie, z.nazwisko, z.data_,
(z.pensja+z.premia+(z.liczba_nadgodzin*z.kwota_godzinowa)) AS pensja_calkowita,
z.pensja, z.premia,
z.liczba_nadgodzin*z.kwota_godzinowa AS nadgodziny
INTO ksiegowosc.raport
FROM ksiegowosc.zapytanie z;

SELECT *
FROM ksiegowosc.raport;

SELECT 'Pracownik '+r.imie+' '+r.nazwisko+', w dniu '+CAST(r.data_ AS varchar)+' otrzyma³ pensjê ca³kowita na kwotê '+CAST(r.pensja_calkowita AS varchar)+', gdzie wynagrodzenie zasadnicze wynosi³o: '+CAST(r.pensja AS varchar)+' z³, premia: '+CAST(r.premia AS varchar)+' z³, nadgodziny: '+CAST(r.nadgodziny AS varchar)+' z³.' AS Raport
FROM ksiegowosc.raport r;
