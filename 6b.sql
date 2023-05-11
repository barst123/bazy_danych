USE firma_cw5;
--a
ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon varchar(20);

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

--1 sposob
SELECT TOP 1 UPPER(id_pracownika) AS id_pracownika, UPPER(imie) AS imie, UPPER(nazwisko) AS nazwisko, UPPER(adres) AS adres, UPPER(telefon) AS telefon
FROM ksiegowosc.pracownicy
ORDER BY LEN(nazwisko) DESC;

--2 sposob
SELECT TOP 1 UPPER(CONCAT(id_pracownika, ', ', nazwisko, ' ', imie, ', ', adres, ', ', telefon)) AS Dane
FROM ksiegowosc.pracownicy
ORDER BY LEN(nazwisko) DESC

--d

-- 1 sposob
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

-- 2 sposob (CTE)
WITH md_5
AS
(
	SELECT p.id_pracownika, p.imie, p.nazwisko, p.adres, p.telefon, pe.kwota
	FROM ksiegowosc.pracownicy p
	INNER JOIN ksiegowosc.wynagrodzenie w
	ON p.id_pracownika=w.id_pracownika
	INNER JOIN ksiegowosc.pensje pe
	ON w.id_pensji=pe.id_pensji
)
SELECT 
HASHBYTES('md5', m.id_pracownika) AS id_pracownika,
HASHBYTES('md5', m.imie) AS imie,
HASHBYTES('md5', m.nazwisko) AS nazwisko,
HASHBYTES('md5', m.adres) AS adres,
HASHBYTES('md5', m.telefon) AS telefon,
HASHBYTES('md5', CAST(m.kwota AS varchar)) AS kwota
FROM md_5 m;

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

--1 sposob
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

SELECT 
	'Pracownik '+
	r.imie+' '+
	r.nazwisko+
	', w dniu '+
	SUBSTRING(CAST(r.data_ AS varchar), 9, 2)+'.'+SUBSTRING(CAST(r.data_ AS varchar), 6, 2)+'.'+SUBSTRING(CAST(r.data_ AS varchar), 1, 4)+
	' otrzymał pensję całkowita na kwotę '+
	CAST(r.pensja_calkowita AS varchar)+
	', gdzie wynagrodzenie zasadnicze wynosiło: '+
	CAST(r.pensja AS varchar)+
	' zł, premia: '+
	CAST(r.premia AS varchar)+
	' zł, nadgodziny: '+
	CAST(r.nadgodziny AS varchar)+
	' zł.' 
	AS Raport
FROM ksiegowosc.raport r;


--2 sposob (CTE)
WITH raporcik
AS
(
	SELECT 
		p.imie AS imie, 
		p.nazwisko AS nazwisko, 
		pe.kwota AS pensja, 
		ISNULL(pr.kwota, 0) AS premia, 
		g.liczba_godzin AS liczba_godzin, 
		n.liczba_nadgodzin AS liczba_nadgodzi, 
		w.data_ AS data_,
		(pe.kwota/(6*4*liczba_godzin))*n.liczba_nadgodzin AS nadgodziny,
		pe.kwota+ISNULL(pr.kwota, 0)+(pe.kwota/(6*4*liczba_godzin))*n.liczba_nadgodzin AS pensja_calkowita
	FROM ksiegowosc.pracownicy p
	INNER JOIN ksiegowosc.wynagrodzenie w
	ON p.id_pracownika=w.id_pracownika
	INNER JOIN ksiegowosc.pensje pe
	ON w.id_pensji=pe.id_pensji
	INNER JOIN ksiegowosc.premie pr
	ON w.id_premii=pr.id_premii
	INNER JOIN ksiegowosc.nadgodziny2 n
	ON w.id_pracownika=n.id_pracownika
	INNER JOIN ksiegowosc.godziny g
	ON w.id_pracownika=g.id_pracownika
)
SELECT 
	'Pracownik '+
	r.imie+
	' '+
	r.nazwisko+
	', w dniu '+
	SUBSTRING(CAST(r.data_ AS varchar), 9, 2)+'.'+SUBSTRING(CAST(r.data_ AS varchar), 6, 2)+'.'+SUBSTRING(CAST(r.data_ AS varchar), 1, 4)+
	' otrzymał pensję całkowita na kwotę '+
	CAST(r.pensja_calkowita AS varchar)+
	', gdzie wynagrodzenie zasadnicze wynosiło: '+
	CAST(r.pensja AS varchar)+' zł, premia: '+
	CAST(r.premia AS varchar)+' zł, nadgodziny: '+
	CAST(r.nadgodziny AS varchar)+
	' zł.' 
	AS Raport
FROM raporcik r;
