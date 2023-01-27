CREATE TABLE PLAN
            (
                id_plan NUMBER(2) PRIMARY KEY,
                nume VARCHAR(100) NOT NULL,
                pret NUMBER(3) NOT NULL,
                durata NUMBER(3) NOT NULL
            );
CREATE TABLE CLIENTI
             (
                 id_client NUMBER(5) PRIMARY KEY,
                 nume VARCHAR(50) NOT NULL,
                 prenume VARCHAR(50) NOT NULL,
                 parola VARCHAR(100) NOT NULL,
                 email VARCHAR(100) NOT NULL UNIQUE,
                 nr_card NUMBER(16) NOT NULL,
                 an_exp_card NUMBER(4) NOT NULL,
                 luna_exp_card NUMBER(2) NOT NULL,
		     id_plan NUMBER(2),
		     CONSTRAINT fk_plan FOREIGN KEY (id_plan) REFERENCES PLAN(id_plan)
			
             );

CREATE TABLE MEDIA
             (
                 id_media NUMBER(5) PRIMARY KEY,
                 nume_media VARCHAR(100) NOT NULL,
                 anul_lansarii NUMBER(4),
                 buget NUMBER(10)
             );

CREATE TABLE FILME
            (
                id_film NUMBER(5) PRIMARY KEY,
                runtime NUMBER(3),
                CONSTRAINT fk_film FOREIGN KEY(id_film) REFERENCES MEDIA(id_media)
            );
CREATE TABLE SERIALE
            (
                id_serial NUMBER(5) PRIMARY KEY,
                nr_sezoane NUMBER(3),
                nr_episoade NUMBER(4),
                in_desfasurare VARCHAR(1),
                CONSTRAINT fk_serial FOREIGN KEY(id_serial) REFERENCES MEDIA(id_media)
            );

CREATE TABLE GEN
            (
                id_gen NUMBER(3) PRIMARY KEY,
                nume_gen VARCHAR(100) NOT NULL
            );

CREATE TABLE ACTORI
            (
                id_actor NUMBER(5) PRIMARY KEY,
                nume VARCHAR(100) NOT NULL,
                prenume VARCHAR(100) NOT NULL,
                data_nasterii DATE,
                gen VARCHAR(1)
            );

CREATE TABLE DIRECTOR
            (
                id_director NUMBER(5) PRIMARY KEY,
                nume VARCHAR(100) NOT NULL,
                prenume VARCHAR(100) NOT NULL,
                data_nasterii DATE,
                gen VARCHAR(1)
            );

CREATE TABLE VIZIONEAZA
            (
                id_client NUMBER(5),
                id_media NUMBER(5),
                rating NUMBER(3, 1),
                CONSTRAINT pk_vizioneaza PRIMARY KEY (id_client, id_media),
                CONSTRAINT fk_vizioneaza_client FOREIGN KEY (id_client) REFERENCES CLIENTI(id_client),
                CONSTRAINT fk_vizioneaza_media FOREIGN KEY (id_media) REFERENCES MEDIA(id_media)
            );
CREATE TABLE JOACA
            (
                id_actor NUMBER(5),
                id_media NUMBER(5),
                CONSTRAINT pk_joaca PRIMARY KEY (id_actor, id_media),
                CONSTRAINT fk_joaca_actor FOREIGN KEY (id_actor) REFERENCES ACTORI(id_actor),
                CONSTRAINT fk_joaca_media FOREIGN KEY (id_media) REFERENCES MEDIA(id_media)
            );
CREATE TABLE REGIZEAZA
            (
                id_director NUMBER(5),
                id_media NUMBER(5),
                CONSTRAINT pk_regizeaza PRIMARY KEY (id_director, id_media),
                CONSTRAINT fk_regizeaza_director FOREIGN KEY (id_director) REFERENCES DIRECTOR(id_director),
                CONSTRAINT fk_regizeaza_media FOREIGN KEY (id_media) REFERENCES MEDIA(id_media)
            );

CREATE TABLE APARTINE
            (
                id_media NUMBER(5),
                id_gen NUMBER(3),
                CONSTRAINT pk_apartine PRIMARY KEY (id_gen, id_media),
                CONSTRAINT fk_apartine_gen FOREIGN KEY (id_gen) REFERENCES GEN(id_gen),
                CONSTRAINT fk_apartine_media FOREIGN KEY (id_media) REFERENCES MEDIA(id_media)
            );


INSERT INTO PLAN
VALUES (1, 'Bronze', 40, 30);

INSERT INTO PLAN
VALUES (2, 'Silver', 45, 30);

INSERT INTO PLAN
VALUES (3, 'Gold', 50, 30);

INSERT INTO PLAN
VALUES (4, 'Platinum', 80, 60);

INSERT INTO PLAN
VALUES (5, 'Diamond', 110, 60);


INSERT INTO CLIENTI
VALUES (1, 'Popescu', 'Ion', 'parolapop', 'pop@mail.com', 4689190009801234, 2025, 9, 1);

INSERT INTO CLIENTI
VALUES (2, 'Andrei', 'Stefan', 'pstf', 'stefan@mail.com', 4689696019901234, 2026, 1, 1);

INSERT INTO CLIENTI
VALUES (3, 'Ion', 'Andrei', 'paarolamea', 'and@mail.com', 4689190009804567, 2025, 7, 3);

INSERT INTO CLIENTI
VALUES (4, 'Radu', 'Razvan', 'razvanpar123', 'razvan@mmail.com', 4689190010924567, 2023, 2, 1);

INSERT INTO CLIENTI
VALUES (5, 'Rica', 'Vlad', 'vald45r3', 'vald@mail.com', 4689190451001234, 2024, 7, 1);

INSERT INTO CLIENTI
VALUES (6, 'Popescu', 'Vladimir', 'popvld23', 'idk@mail.com', 2934190009801234, 2023, 10, 2);

INSERT INTO CLIENTI
VALUES (7, 'Radu', 'Calin', 'radurec00', 'calin.radu@mail.com', 4689988709801234, 2027, 1, 4);

INSERT INTO CLIENTI
VALUES (8, 'Dumitrescu', 'Denisa', 'denisadu45', 'denis@mail.com', 7665190009801234, 2026, 11, 4);

INSERT INTO CLIENTI
VALUES (9, 'Dumitriu', 'Fabian', 'cabala11', 'fab@mail.com', 4987190009801234, 2024, 4, 5);

INSERT INTO CLIENTI
VALUES (10, 'Andrei', 'Calin', 'calinpidk', 'wallhacker@mail.com', 9633490009801234, 2027, 10, 3);


INSERT INTO GEN
VALUES(1, 'Actiune');

INSERT INTO GEN
VALUES(2, 'Aventure');

INSERT INTO GEN
VALUES(3, 'Comedie');

INSERT INTO GEN
VALUES(4, 'Drama');

INSERT INTO GEN
VALUES(5, 'Thriller');

INSERT INTO GEN
VALUES(6, 'Mister');

INSERT INTO ACTORI
VALUES(1, 'Pitt', 'Brad', TO_DATE('18-12-1963', 'DD-MM-YYYY'), 'M');

INSERT INTO ACTORI
VALUES(2, 'Freeman', 'Morgan', TO_DATE('01-06-1937', 'DD-MM-YYYY'), 'M');

INSERT INTO ACTORI
VALUES(3, 'DiCaprio', 'Leonardo', TO_DATE('08-11-1970', 'DD-MM-YYYY'), 'M');

INSERT INTO ACTORI
VALUES(4, 'De Niro', 'Robert', TO_DATE('17-09-1943', 'DD-MM-YYYY'), 'M');

INSERT INTO ACTORI
VALUES(5, 'Damon', 'Matt', TO_DATE('08-10-1970', 'DD-MM-YYYY'), 'M');

INSERT INTO ACTORI
VALUES(6, 'Caine', 'Michael', TO_DATE('10-10-1945', 'DD-MM-YYYY'), 'M');

INSERT INTO ACTORI
VALUES(7, 'Portman', 'Natalie', TO_DATE('09-06-1981', 'DD-MM-YYYY'), 'F');

INSERT INTO ACTORI
VALUES(8, 'Blanchett', 'Cate', TO_DATE('14-05-1969', 'DD-MM-YYYY'), 'F');

INSERT INTO ACTORI
VALUES(9, 'Hathaway', 'Anne', TO_DATE('18-10-1985', 'DD-MM-YYYY'), 'F');

INSERT INTO ACTORI
VALUES(10, 'Shire', 'Talia', TO_DATE('10-04-1961', 'DD-MM-YYYY'), 'F');

INSERT INTO ACTORI
VALUES(11, 'PAcino', 'Al', TO_DATE('25-04-1940', 'DD-MM-YYYY'), 'M');

INSERT INTO ACTORI
VALUES(12, 'Shannon', 'Michael', TO_DATE('07-09-1974', 'DD-MM-YYYY'), 'M');

INSERT INTO DIRECTOR
VALUES(1, 'Nolan', 'Christopher', TO_DATE('04-09-1964', 'DD-MM-YYYY'), 'M');

INSERT INTO DIRECTOR
VALUES(2, 'Tarantino', 'Quentin', TO_DATE('10-12-1945', 'DD-MM-YYYY'), 'M');

INSERT INTO DIRECTOR
VALUES(3, 'Scorsese', 'Martin', TO_DATE('09-03-1949', 'DD-MM-YYYY'), 'M');

INSERT INTO DIRECTOR
VALUES(4, 'Spielberg', 'Stever', TO_DATE('06-07-1950', 'DD-MM-YYYY'), 'M');

INSERT INTO DIRECTOR
VALUES(5, 'Zhao', 'Chloe', TO_DATE('20-03-1985', 'DD-MM-YYYY'), 'F');

INSERT INTO DIRECTOR
VALUES(6, 'Ducournau', 'Julia', TO_DATE('15-11-1986', 'DD-MM-YYYY'), 'F');

INSERT INTO MEDIA
VALUES (1, 'Wednesday', 2022, 75000000);

INSERT INTO MEDIA
VALUES (2, 'Batman Begins', 2005, 120000000);

INSERT INTO MEDIA
VALUES (3, 'The Dark Knight', 2008, 180000000);

INSERT INTO MEDIA
VALUES (4, 'The Dark Knight Rises', 2012, 195000000);

INSERT INTO MEDIA
VALUES (5, 'Peaky Blinders', 2013, 60000000);

INSERT INTO MEDIA
VALUES (6, 'Arrow', 2012, 50000000);

INSERT INTO MEDIA
VALUES (7, 'The Avengers', 2012, 220000000);

INSERT INTO MEDIA
VALUES (8, 'The Flash', 2014, 70000000);

INSERT INTO MEDIA
VALUES (9, 'A New Hope', 1977, 50000000);

INSERT INTO MEDIA
VALUES (10, 'The Empire Strikes Back', 1980, 72000000);

INSERT INTO MEDIA
VALUES (11, 'Loki', 2021, 100000000);

INSERT INTO MEDIA
VALUES (12, 'Wandavision', 2020, 110000000);


INSERT INTO FILME
VALUES (2, 134);

INSERT INTO FILME
VALUES (3, 145);

INSERT INTO FILME
VALUES (4, 151);

INSERT INTO FILME
VALUES (7, 139);

INSERT INTO FILME
VALUES (9, 143);

INSERT INTO FILME
VALUES (10, 124);

INSERT INTO SERIALE
VALUES (1, 1, 10, 'Y');

INSERT INTO SERIALE
VALUES (5, 6, 36, 'N');

INSERT INTO SERIALE
VALUES (6, 8, 123, 'N');

INSERT INTO SERIALE
VALUES (8, 9, 145, 'Y');

INSERT INTO SERIALE
VALUES (11, 1, 8, 'N');

INSERT INTO SERIALE
VALUES (12, 1, 8, 'N');

INSERT INTO APARTINE
VALUES (1, 1);

INSERT INTO APARTINE
VALUES (2, 3);

INSERT INTO APARTINE
VALUES (2, 4);

INSERT INTO APARTINE
VALUES (3, 5);

INSERT INTO APARTINE
VALUES (3, 1);

INSERT INTO APARTINE
VALUES (4, 2);

INSERT INTO APARTINE
VALUES (5, 6);

INSERT INTO APARTINE
VALUES (6, 5);

INSERT INTO APARTINE
VALUES (7, 1);

INSERT INTO APARTINE
VALUES (8, 3);

INSERT INTO APARTINE
VALUES (9, 1);

INSERT INTO APARTINE
VALUES (9, 2);

INSERT INTO APARTINE
VALUES (10, 3);

INSERT INTO APARTINE
VALUES (10, 4);

INSERT INTO APARTINE
VALUES (10, 5);

INSERT INTO APARTINE
VALUES (11, 1);

INSERT INTO APARTINE
VALUES (11, 4);


INSERT INTO JOACA
VALUES (1, 2);

INSERT INTO JOACA
VALUES (1, 4);

INSERT INTO JOACA
VALUES (2, 4);

INSERT INTO JOACA
VALUES (1, 6);

INSERT INTO JOACA
VALUES (3, 7);

INSERT INTO JOACA
VALUES (4, 1);

INSERT INTO JOACA
VALUES (4, 6);

INSERT INTO JOACA
VALUES (5, 6);

INSERT INTO JOACA
VALUES (5, 2);

INSERT INTO JOACA
VALUES (5, 3);

INSERT INTO JOACA
VALUES (5, 4);

INSERT INTO JOACA
VALUES (6, 1);

INSERT INTO JOACA
VALUES (6, 2);

INSERT INTO JOACA
VALUES (7, 4);

INSERT INTO JOACA
VALUES (7, 8);

INSERT INTO JOACA
VALUES (8, 8);

INSERT INTO JOACA
VALUES (8, 1);

INSERT INTO JOACA
VALUES (8, 2);

INSERT INTO JOACA
VALUES (9, 4);

INSERT INTO JOACA
VALUES (9, 8);

INSERT INTO JOACA
VALUES (9, 9);

INSERT INTO JOACA
VALUES (10, 2);

INSERT INTO JOACA
VALUES (10, 6);

INSERT INTO JOACA
VALUES (10, 9);

INSERT INTO JOACA
VALUES (10, 10);

INSERT INTO REGIZEAZA
VALUES (1, 2);

INSERT INTO REGIZEAZA
VALUES (1, 4);

INSERT INTO REGIZEAZA
VALUES (2, 4);

INSERT INTO REGIZEAZA
VALUES (1, 6);

INSERT INTO REGIZEAZA
VALUES (3, 7);

INSERT INTO REGIZEAZA
VALUES (4, 1);

INSERT INTO REGIZEAZA
VALUES (4, 6);

INSERT INTO REGIZEAZA
VALUES (5, 6);

INSERT INTO REGIZEAZA
VALUES (5, 2);

INSERT INTO REGIZEAZA
VALUES (5, 3);

INSERT INTO REGIZEAZA
VALUES (5, 4);

INSERT INTO REGIZEAZA
VALUES (6, 1);

INSERT INTO REGIZEAZA
VALUES (6, 2);


INSERT INTO VIZIONEAZA
VALUES (1, 2, 9.5);

INSERT INTO VIZIONEAZA
VALUES (1, 4, 4);

INSERT INTO VIZIONEAZA
VALUES (2, 6, 10);

INSERT INTO VIZIONEAZA
VALUES (3, 9, null);

INSERT INTO VIZIONEAZA
VALUES (3, 12, 6);

INSERT INTO VIZIONEAZA
VALUES (4, 11, null);

INSERT INTO VIZIONEAZA
VALUES (4, 10, 9);

INSERT INTO VIZIONEAZA
VALUES (4, 5, 5.5);

INSERT INTO VIZIONEAZA
VALUES (7, 8, null);

INSERT INTO VIZIONEAZA
VALUES (7, 4, 5.5);

INSERT INTO VIZIONEAZA
VALUES (8, 1, 9.5);

INSERT INTO VIZIONEAZA
VALUES (10, 2, 10);

INSERT INTO VIZIONEAZA
VALUES (9, 6, null);

INSERT INTO VIZIONEAZA
VALUES (9, 7, 7);

INSERT INTO VIZIONEAZA
VALUES (9, 11, 9.5);

INSERT INTO VIZIONEAZA
VALUES (10, 12, 9);

INSERT INTO VIZIONEAZA
VALUES (10, 1, null);

INSERT INTO VIZIONEAZA
VALUES (6, 10, null);

INSERT INTO VIZIONEAZA
VALUES (6, 7, null);


SELECT * FROM VIZIONEAZA;



--6
--O procedura ce nu primeste parametri si va afisa pentru fiecare film
--fiecare recenzie primita si suma totala a acestora din punctajul maxim posibil
CREATE OR REPLACE PROCEDURE procedura6 IS
    TYPE tip_pentru_tablou_indexat IS RECORD
    (
        nume VARCHAR(200),
        rating NUMBER(3,1)
    );

    TYPE tip_pentru_tablou_imbricat IS RECORD
    (
       
        id_film NUMBER(5),
        nume VARCHAR(200)
    );

    TYPE tablou_indexat IS TABLE OF tip_pentru_tablou_indexat INDEX BY PLS_INTEGER;
    TYPE tablou_imbricat IS TABLE OF tip_pentru_tablou_imbricat;

    t_filme tablou_imbricat;
    t_recenzii tablou_indexat;
    numar NUMBER(4);
    suma NUMBER(4);

BEGIN

    SELECT id_film, nume_media
    BULK COLLECT INTO t_filme
    FROM FILME JOIN MEDIA ON (FILME.id_film = MEDIA.id_media);

    FOR i in t_filme.FIRST..t_filme.LAST LOOP
        DBMS_OUTPUT.PUT('FILM: ' || t_filme(i).nume || ' ');

        numar := 0;
        suma := 0;
        --t_recenzii.DELETE(1);

        SELECT C.nume, V.rating
        BULK COLLECT INTO t_recenzii
        FROM VIZIONEAZA V JOIN CLIENTI C ON (C.id_client = V.id_client)
        WHERE V.id_media = t_filme(i).id_film AND V.rating IS NOT NULL;

        SELECT COUNT(rating) * 10, SUM(rating)
        INTO numar, suma
        FROM VIZIONEAZA
        WHERE id_media = t_filme(i).id_film;

        IF numar > 0 THEN
            DBMS_OUTPUT.PUT_LINE(suma || '/' || numar);
            FOR j in t_recenzii.FIRST..t_recenzii.LAST LOOP
                DBMS_OUTPUT.PUT_LINE(t_recenzii(j).nume || ' ' || t_recenzii(j).rating);
            END LOOP;
        ELSE
            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('Acest film nu are nicio recenzie inca');
        END IF;
    END LOOP;
END;
/
EXECUTE procedura6;
/

--7
--O procedura ce primeste drept parametru numele unui gen de media
--Si determina pentru toate filmele si serialele ce apartin genului respectiv
--Numele fiecarui client ce l-a vizionat impreuna cu denumirea abonamentului sau

CREATE OR REPLACE PROCEDURE procedura7 (p_proc GEN.nume_gen%TYPE) IS
    CURSOR c IS
    SELECT M.id_media id_media, M.nume_media nume
    FROM MEDIA M JOIN APARTINE A ON (A.id_media = M.id_media)
    JOIN GEN G ON (G.id_gen = A.id_gen)
    WHERE G.nume_gen = p_proc;

    CURSOR d(p_curs VIZIONEAZA.id_media%TYPE) IS
    SELECT C.nume nume, C.prenume prenume, P.nume nume_abonament
    FROM VIZIONEAZA V JOIN CLIENTI C ON (C.id_client = V.id_client)
    JOIN PLAN P ON (P.id_plan = C.id_plan)
    WHERE V.id_media = p_curs;

    id_pentru_cursor MEDIA.id_media%TYPE;
    nume_media MEDIA.nume_media%TYPE;
    numar_media NUMBER :=0;
    numar_clienti NUMBER :=0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pentru genul ' || p_proc || ' : ');
    OPEN c;
    LOOP
        FETCH c into id_pentru_cursor, nume_media;
        EXIT WHEN c%NOTFOUND;

        numar_media := numar_media + 1; 
        DBMS_OUTPUT.PUT_LINE(nume_media || ': ');
        numar_clienti :=0;
        FOR i in d(id_pentru_cursor) LOOP
            numar_clienti := numar_clienti + 1;
            DBMS_OUTPUT.PUT_LINE(numar_clienti || '. ' || i.prenume || ' ' || i.nume || ' cu abonament de tipul ' || i.nume_abonament );
        END LOOP;

        IF numar_clienti = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Nimeni nu a vizionat acest film/serial.');
        END IF;
    END LOOP;
    CLOSE c;
    IF numar_media = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista filme/seriale ce apartin acestui gen.');
    END IF;
END;
/

EXECUTE procedura7('Actiune');
/


--8
--Functie ce va primi numele de familie al unui client
--Si va intoarce bugetul total al tuturor filmelor si serialelor vizionate de acesta
CREATE OR REPLACE FUNCTION functie8 (nume_client CLIENTI.nume%TYPE)
RETURN NUMBER IS
    numar_clienti NUMBER;
    numar_media NUMBER;
    buget_total NUMBER;
    buget_film NUMBER;
    NO_CUSTOMERS EXCEPTION;
    NO_MEDIA EXCEPTION;
    TOO_MANY_CUSTOMERS EXCEPTION;
    id_cl CLIENTI.id_client%TYPE;

    TYPE tablou_imbricat IS TABLE OF VIZIONEAZA.id_media%TYPE;
    t tablou_imbricat := tablou_imbricat();

BEGIN
    SELECT COUNT(*)
    INTO numar_clienti
    FROM CLIENTI
    WHERE CLIENTI.nume = nume_client;

    IF numar_clienti <= 0 THEN
        RAISE NO_CUSTOMERS;
    END IF;

    IF numar_clienti > 1 THEN
        RAISE TOO_MANY_CUSTOMERS;
    END IF;

    SELECT id_client
    INTO id_cl
    FROM CLIENTI
    WHERE CLIENTI.nume = nume_client;

    SELECT id_media
    BULK COLLECT INTO t
    FROM VIZIONEAZA
    WHERE id_client = id_cl;

    IF t.COUNT() = 0 THEN
        RAISE NO_MEDIA;
    END IF;

    
    buget_total :=0;

    FOR i in t.FIRST()..t.LAST() LOOP
        buget_film :=0;
        SELECT buget
        INTO buget_film
        FROM MEDIA
        WHERE id_media = t(i);

        buget_total := buget_total + buget_film;
    END LOOP;
    RETURN buget_total;
EXCEPTION

WHEN NO_CUSTOMERS THEN
DBMS_OUTPUT.PUT_LINE('Nu exista client cu acest prenume');
RETURN -1;

WHEN NO_MEDIA THEN
DBMS_OUTPUT.PUT_LINE('Clientul acesta nu a vizionat inca niciun film/serial');
RETURN -1;

WHEN TOO_MANY_CUSTOMERS THEN
DBMS_OUTPUT.PUT_LINE('Exista mai multi clienti cu acest prenume!');
RETURN -1;

WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLCODE);
DBMS_OUTPUT.PUT_LINE(SQLERRM);
RETURN -1;
END;
/
SELECT functie8('Radu') FROM DUAL;
SELECT functie8('Dumitrescu') FROM DUAL;
SELECT functie8('Rica') FROM DUAL;
SELECT functie8('Mihai') FROM DUAL;
/


--9
--O procedura ce primeste drept parametru prenumele unui actor si afiseaza numele sau complet
--numarul de filme si seriale in care a jucat
--rating-ul mediu si total al filmelor si serialelor in care a jucat
--precum si numarul de spectatori al filmelor si serialelor in care a jucat

CREATE OR REPLACE PROCEDURE procedura9 (prenume_actor ACTORI.prenume%TYPE) IS
    nume ACTORI.nume%TYPE;
    nr_media NUMBER;
    buget_media NUMBER;
    numar_rating NUMBER;
    suma_rating NUMBER;
    avg_rating NUMBER;
    numar_clienti NUMBER;
BEGIN
    SELECT A.nume, COUNT(J.id_media), SUM(M.buget), COUNT(V.rating)*10, SUM(V.rating), ROUND(AVG(V.rating), 2), COUNT(C.id_client)
    INTO nume, nr_media, buget_media, numar_rating, suma_rating, avg_rating, numar_clienti
    FROM ACTORI A LEFT JOIN JOACA J ON (J.id_actor = A.id_actor)
    LEFT JOIN MEDIA M ON (M.id_media = J.id_media)
    LEFT JOIN VIZIONEAZA V ON (V.id_media = M.id_media)
    LEFT JOIN CLIENTI C ON (C.id_client = V.id_client)
    WHERE A.prenume = prenume_actor
    GROUP BY A.nume;

    DBMS_OUTPUT.PUT_LINE('Actorul ' || prenume_actor || ' ' || nume || ': ');
    DBMS_OUTPUT.PUT_LINE('Numar filme/seriale in care a jucat:' || nr_media);
    DBMS_OUTPUT.PUT_LINE('Rating mediu: '|| avg_rating || '/ 10');
    DBMS_OUTPUT.PUT_LINE('Rating total: ' || suma_rating || '/' || numar_rating);
    DBMS_OUTPUT.PUT_LINE('Numar spectatori:' || numar_clienti);

EXCEPTION
    WHEN TOO_MANY_ROWS
    THEN RAISE_APPLICATION_ERROR(-20007, 'Exista mai multi actori cu acest prenume');
    WHEN NO_DATA_FOUND
    THEN RAISE_APPLICATION_ERROR(-20006, 'Nu exista actori cu acest prenume');
END;
/
EXECUTE procedura9('Matt');
EXECUTE procedura9('Michael');
EXECUTE procedura9('John');
/


--10
--Trigger te tip LMD la nivel de comanda
--ce impiedica stergerea filmelor si serialelor din lista de vizionate.
CREATE OR REPLACE TRIGGER trigger10
    BEFORE DELETE ON VIZIONEAZA 
BEGIN
    RAISE_APPLICATION_ERROR(-20011, 'Nu puteti elimina un film/serial din lista de vizionate!');
END;
/
DELETE FROM VIZIONEAZA
WHERE id_client = 4;
/

--11
--Trigger de tip LMD la nivel de linie
--ce impiedica crearea sau modificarea unui rating oferit de un utilizator astfel incat acesta sa fie mai mare de 10
CREATE OR REPLACE TRIGGER trigger_11
    BEFORE INSERT OR UPDATE ON VIZIONEAZA
    FOR EACH ROW
BEGIN
    IF(:NEW.rating > 10) THEN
        RAISE_APPLICATION_ERROR(-20010, 'Nota accordata unui film/serial nu poate fi mai mare de 10!');
    END IF;
END;
/
INSERT INTO VIZIONEAZA
VALUES(1, 12, 11.5);

UPDATE VIZIONEAZA
SET rating = 15
WHERE id_client = 1 AND id_media = 2;
/


--12
--Trigger de tip LDD ce afiseaza faptul ca a fost executata o comanda LDD de fiecare data cand este cazul

CREATE OR REPLACE TRIGGER trigger12
    AFTER CREATE OR ALTER OR DROP ON SCHEMA
BEGIN
    DBMS_OUTPUT.PUT_LINE('A fost efectuata o comanda LDD');
END;
/

ALTER TABLE CLIENTI
ADD data_nasterii DATE;

ALTER TABLE CLIENTI
DROP COLUMN data_nasterii;
/





