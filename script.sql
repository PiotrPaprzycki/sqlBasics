CREATE TABLE pracownik (
	id bigint  primary key auto_increment,
    imie VARCHAR(30),
    nazwisko VARCHAR(50),
    wyplata DECIMAL,
    data_urodzenia DATE,
    stanowisko VARCHAR(50)
);

INSERT INTO pracownik(imie, nazwisko, wyplata, data_urodzenia, stanowisko)
VALUES ('Jan','Kowalski',5000,'1994-02-19','Helpdesk Operator'),
('Jan','Niezbedny',2000,'1990-01-22','Helpdesk Lead'),
('Lukasz','Wozny',15000,'1988-09-18','DevOps'),
('Patryk','Welna',25000,'1980-12-07','COBOL Developer'),
('Grzegorz','Wejna',22000,'1982-09-19','JAVA Developer'),
('Kamil','Gruszka',35000,'1991-11-12','Solidity Developer');

SELECT * FROM pracownik ORDER BY nazwisko;

SELECT * FROM pracownik WHERE stanowisko='COBOL Developer';

SELECT * FROM pracownik WHERE YEAR(data_urodzenia) <=  YEAR(CURDATE() - INTERVAL 30 YEAR);

UPDATE pracownik SET wyplata = 1.1 * wyplata;

DELETE FROM pracownik WHERE  pracownik.id =  (SELECT id FROM (SELECT id, data_urodzenia
FROM pracownik
WHERE data_urodzenia = (
    SELECT MIN(data_urodzenia)
    FROM pracownik
)) AS id);

DROP TABLE pracownik;
DROP TABLE stanowisko;
DROP TABLE adres;

CREATE TABLE stanowisko (
	id bigint  primary key auto_increment,
    nazwa VARCHAR(30),
    wyplata DECIMAL
);

CREATE TABLE adres (
	id bigint primary key auto_increment,
    ulica VARCHAR(70),
    numer_domu VARCHAR(5),
    numer_mieszkania VARCHAR(5),
    miejscowosc VARCHAR(100),
    kod_pocztowy VARCHAR(6)
);

CREATE TABLE pracownik (
	id BIGINT  primary key auto_increment,
	adres_id BIGINT UNIQUE NOT NULL,
	stanowisko_id BIGINT UNIQUE NOT NULL,
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    FOREIGN KEY (adres_id) REFERENCES adres(id),
    FOREIGN KEY (stanowisko_id) REFERENCES stanowisko(id)
);

INSERT INTO adres(ulica, numer_domu, numer_mieszkania, miejscowosc, kod_pocztowy)
VALUES ('Jana Matejki',1,2,'Wroclaw','54-062'),
('Jana Paska',2,1,'Wloclawek','11-111'),
('Jana Sedzimira',2,3,'Warszawa','12-222');

INSERT INTO stanowisko(nazwa, wyplata)
VALUES ('Junior DEV',5000),
('Regular DEV',8000),
('Senior DEV',12000);

INSERT INTO pracownik(adres_id, stanowisko_id, imie, nazwisko)
VALUES (1,1,'Piotr','Skarga'),
(2,2,'Jan','Kowalski'),
(3,3,'Kamil','Gruszka');

SELECT * FROM pracownik,adres,stanowisko WHERE pracownik.stanowisko_id=stanowisko.id AND pracownik.adres_id=adres.id;

SELECT * FROM pracownik,adres WHERE adres.kod_pocztowy='11-111'; AND pracownik.adres_id=adres.id;

SELECT SUM(wyplata) FROM stanowisko,pracownik WHERE pracownik.stanowisko_id=stanowisko.id;

SELECT * FROM pracownik,adres WHERE pracownik.adres_id=adres.id AND adres.kod_pocztowy='11-111';
