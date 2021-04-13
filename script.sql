CREATE TABLE pracownik (
	id bigint  primary key auto_increment,
    imie VARCHAR(30),
    nazwisko VARCHAR(50),
    wyplata DECIMAL,
    data_urodzenia VARCHAR(10),
    stanowisko VARCHAR(50)
);

INSERT INTO pracownik(imie, nazwisko, wyplata, data_urodzenia, stanowisko)
VALUES ('Jan','Kowalski',5000,'1994-02-19','Helpdesk Operator'),
('Jan','Niezbedny',2000,'1990-01-22','Helpdesk Lead'),
('Lukasz','Wozny',15000,'1988-09-18','DevOps'),
('Patryk','Welna',25000,'1980-12-07','COBOL Developer'),
('Grzegorz','Wejna',22000,'1982-09-19','JAVA Developer'),
('Kamil','Gruszka',35000,'1991-11-12','Solidity Developer');

SELECT * FROM pracownik ORDER BY(nazwisko);

SELECT * FROM pracownik WHERE stanowisko='COBOL Developer';

SELECT * FROM pracownik WHERE data_urodzenia <= 1991-01-01;

UPDATE pracownik SET wyplata= wyplata + (wyplata * 10 / 100);

DELETE FROM pracownik
WHERE pracownik.id =  (SELECT id FROM (SELECT id,min(data_urodzenia) FROM pracownik) AS id);

