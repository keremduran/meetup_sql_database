DROP TABLE a4_user CASCADE CONSTRAINTS;

DROP TABLE a4_meetup CASCADE CONSTRAINTS;

DROP TABLE a4_user CASCADE CONSTRAINTS;

DROP TABLE a4_favorite CASCADE CONSTRAINTS;

DROP TABLE a4_meetupstatus CASCADE CONSTRAINTS;

DROP TABLE a4_meetupuser CASCADE CONSTRAINTS;

DROP SEQUENCE a4_idmeetup_seq;
DROP SEQUENCE a4_idmeetupuser_seq;
CREATE SEQUENCE a4_idmeetup_seq START WITH 25;
CREATE SEQUENCE a4_idmeetupuser_seq START WITH 25;

--User   

CREATE TABLE a4_user (
    iduser         NUMBER(7),
    firstname      VARCHAR2(15),
    lastname       VARCHAR2(20),
    email          VARCHAR2(25),
    username       VARCHAR2(15),
    userpassword   VARCHAR2(8),
    accountdate    DATE,
    CONSTRAINT usr_id_pk PRIMARY KEY ( iduser )
);


INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    1,
    'George',
    'Washington',
    'georgewashington@usa.com',
    'TheFather',
    '123456',
    '21-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    2,
    'John',
    'Adams',
    'johnadams@usa.com',
    'TheColossus',
    'p1p1p1',
    '22-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    3,
    'Thomas',
    'Jefferson',
    'thomasjefferson@usa.com',
    'TheApostle',
    '123123',
    '23-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    4,
    'James',
    'Madison',
    'j@usa.com',
    'LilJemmy',
    '123123',
    '27-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    5,
    'James',
    'Monroe',
    'jmon@usa.com',
    'BigJemmy',
    '123123',
    '27-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    6,
    'John',
    'Adams',
    'jadams@usa.com',
    'LittleJohn',
    '123123',
    '27-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    7,
    'Andrew',
    'Jackson',
    'andrew@usa.com',
    'LilAndrew',
    '123123',
    '27-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    8,
    'Martin',
    'Buren',
    'martin@usa.com',
    'LittleMartini',
    '123123',
    '27-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    9,
    'William',
    'Harrison',
    'wilharr@usa.com',
    'BigWilly',
    '123123',
    '27-NOV-2009'
);

INSERT INTO a4_user (
    iduser,
    firstname,
    lastname,
    email,
    username,
    userpassword,
    accountdate
) VALUES (
    10,
    'Donald',
    'Trump',
    'trump@usa.com',
    'TheDonald',
    '123123',
    '27-NOV-2009'
);
    
--MeetupStatus

CREATE TABLE a4_meetupstatus (
    meetupstatusid            NUMBER(2),
    meetupstatusdescription   VARCHAR(10),
    CONSTRAINT meetupstatus_id_pk PRIMARY KEY ( meetupstatusid )
);

INSERT INTO a4_meetupstatus (
    meetupstatusid,
    meetupstatusdescription
) VALUES (
    1,
    'Ongoing'
);

INSERT INTO a4_meetupstatus (
    meetupstatusid,
    meetupstatusdescription
) VALUES (
    2,
    'Passed'
);

INSERT INTO a4_meetupstatus (
    meetupstatusid,
    meetupstatusdescription
) VALUES (
    3,
    'Pending'
);

INSERT INTO a4_meetupstatus (
    meetupstatusid,
    meetupstatusdescription
) VALUES (
    4,
    'Cancelled'
);

--Meetup

CREATE TABLE a4_meetup (
    idmeetup         NUMBER(8),
    idcreator        NUMBER(7),
    meetupname       VARCHAR2(50),
    description      VARCHAR2(100),
    meetupimage      VARCHAR2(25),
    meetuplocation   VARCHAR2(50),
    meetupstart      DATE,
    meetupend        DATE,
    meetupstatusid   NUMBER(2),
    CONSTRAINT mtp_id_pk PRIMARY KEY ( idmeetup ),
    CONSTRAINT crt_id_fk FOREIGN KEY ( idcreator )
        REFERENCES a4_user ( iduser ),
    CONSTRAINT mtp_statusid_pk FOREIGN KEY ( meetupstatusid )
        REFERENCES a4_meetupstatus ( meetupstatusid )
    ON DELETE CASCADE
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    1,
    1,
    'Establishment Naming Party',
    'All too will bear in mind this sacred principle.',
    'shorturl.at/doqrQ',
    'Washington',
    '1-OCTOBER-2010',
    '2-OCTOBER-2010',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    2,
    1,
    'Second Establishment Party',
    'This one will be awesome. All invited!',
    'shorturl.at/doqrQ',
    'New York',
    '10-OCTOBER-2010',
    '11-OCTOBER-2010',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    3,
    1,
    'Third Establishment Party',
    'This third sacred principle will be the best principle.',
    'shorturl.at/doqrQ',
    'Seattle',
    '24-OCTOBER-2014',
    '30-OCTOBER-2014',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    4,
    2,
    'Meet and Greet',
    'We are doing some stuff',
    'shorturl.at/doqrQ',
    'Washington',
    '1-OCTOBER-2015',
    '2-OCTOBER-2015',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    5,
    2,
    'War and Greet',
    'Lets go to war or something idk Im bored.',
    'shorturl.at/doqrQ',
    'Da Capital',
    '1-OCTOBER-2010',
    '2-OCTOBER-2010',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    6,
    3,
    'Nice Stuff',
    'We are going around the neighbourhood join up if you are interested',
    'shorturl.at/doqrQ',
    'Da Capital',
    '1-OCTOBER-2010',
    '2-OCTOBER-2010',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    7,
    4,
    'Good Times',
    'Not sure',
    'shorturl.at/doqrQ',
    'Da Capital',
    '1-OCTOBER-2019',
    '2-OCTOBER-2019',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    8,
    5,
    'Bad Times',
    'Very bad times need company, come join.',
    'shorturl.at/doqrQ',
    'Da Capital',
    '1-OCTOBER-2010',
    '2-OCTOBER-2010',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    9,
    6,
    'Friday Breakfast',
    'lets eat and enjoy some burittos',
    'shorturl.at/doqrQ',
    'Da Capital',
    '1-OCTOBER-2010',
    '2-OCTOBER-2010',
    2
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    10,
    10,
    'Golf and Chill',
    'Let us hang and behold this golf activity. ',
    'shorturl.at/doqrQ',
    'Costa Rica',
    '14-DECEMBER-2021',
    '17-DECEMBER-2021',
    3
);

INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    11,
    1,
    'Golf Again',
    'Never stop playing.',
    'shorturl.at/doqrQ',
    'Da Capital',
    '1-OCTOBER-2010',
    '2-OCTOBER-2010',
    2
);
INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    12,
    10,
    'Golf and Chill',
    'Chill time with this golf activity. ',
    'shorturl.at/doqrQ',
    'Washington',
    '14-DECEMBER-2010',
    '2-OCTOBER-2010',
    2
);

--MeetupUser

CREATE TABLE a4_meetupuser (
    idmeetupuser   NUMBER(8),
    iduser         NUMBER(7),
    idmeetup       NUMBER(8),
    CONSTRAINT mtpuser_idmeetupuser_pk PRIMARY KEY ( idmeetupuser ),
    CONSTRAINT mtpuser_iduser_fk FOREIGN KEY ( iduser )
        
        REFERENCES a4_user ( iduser )
        ON DELETE CASCADE,
    CONSTRAINT mtpuser_idmeetup_fk FOREIGN KEY ( idmeetup )
        REFERENCES a4_meetup ( idmeetup )
            ON DELETE CASCADE
);
--Favorite
CREATE TABLE a4_favorite (
    idfavorite   NUMBER(3),
    idmeetup     NUMBER(8),
    iduser       NUMBER(7),
    CONSTRAINT fav_idfavorite_pk PRIMARY KEY ( idfavorite ),
    CONSTRAINT fav_iduser_fk FOREIGN KEY ( iduser )
        REFERENCES a4_user ( iduser ),
    CONSTRAINT fav_idmeetup_fk FOREIGN KEY ( idmeetup )
        REFERENCES a4_meetup ( idmeetup )
);

INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(1,4,7);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(2,9,5);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(3,6,4);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(4,3,4);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(5,6,8);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(6,12,9);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(7,7,5);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(8,2,10);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(9,2,7);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(10,10,9);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(11,9,3);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(12,4,2);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(13,7,6);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(14,11,7);
INSERT INTO a4_favorite(idfavorite,idmeetup,iduser) VALUES(15,5,5);

CREATE OR REPLACE FUNCTION get_meetupstatusid(
    meetupstart1 DATE,
    meetupend1 DATE
) 
RETURN a4_meetupstatus.meetupstatusid%type
IS
    meetupstatusid1 a4_meetupstatus.meetupstatusid%type;
BEGIN
        IF CURRENT_DATE > meetupend1 THEN 
        meetupstatusid1 := 2;
        ELSIF CURRENT_DATE < meetupstart1 THEN 
        meetupstatusid1 := 3;
        ELSE
        meetupstatusid1 := 1;
        END IF;
    
    -- return the total sales
    RETURN meetupstatusid1;
END;

CREATE OR REPLACE PROCEDURE insertmeetup (
    idcreator1        IN   a4_meetup.idcreator%TYPE,
    meetupname1       IN   a4_meetup.meetupname%TYPE,
    description1      IN   a4_meetup.description%TYPE,
    meetupimage1      IN   a4_meetup.meetupimage%TYPE,
    meetuplocation1   IN   a4_meetup.meetuplocation%TYPE,
    meetupstart1      IN   a4_meetup.meetupstart%TYPE,
    meetupend1        IN   a4_meetup.meetupend%TYPE
) AS
    idmeetup1 NUMBER := a4_idmeetup_seq.nextval;
    meetupstatusid1 a4_meetup.meetupstatusid%TYPE;
BEGIN

    meetupstatusid1 := get_meetupstatusid(meetupstart1, meetupend1);
    INSERT INTO a4_meetup (
        idmeetup,
        idcreator,
        meetupname,
        description,
        meetupimage,
        meetuplocation,
        meetupstart,
        meetupend,
        meetupstatusid
    ) VALUES (
        idmeetup1,
        idcreator1,
        meetupname1,
        description1,
        meetupimage1,
        meetuplocation1,
        meetupstart1,
        meetupend1,
        meetupstatusid1
    );
    insertmeetupuser(idcreator1, idmeetup1);
END insertmeetup;   

CREATE OR REPLACE PROCEDURE insertmeetupuser (
    iduser1        IN   a4_meetupuser.iduser%TYPE,
    idmeetup1       IN   a4_meetupuser.idmeetup%TYPE
) AS
    idmeetupuser1 NUMBER := a4_idmeetupuser_seq.nextval;
BEGIN
    INSERT INTO a4_meetupuser (
        idmeetupuser,
        iduser,
        idmeetup
    ) VALUES (
        idmeetupuser1,
        iduser1,
        idmeetup1
    );
END insertmeetupuser;

-- Signing up every user into available meetups for test purposes
DECLARE
    counter INT := 0;
    CURSOR test_user_cursor IS
    SELECT
        iduser
    FROM
        a4_user;

    CURSOR test_meetup_cursor IS
    SELECT
        idmeetup,
        idcreator
    FROM
        a4_meetup;

BEGIN
    FOR a4_u IN test_user_cursor LOOP
        FOR a4_m IN test_meetup_cursor LOOP
            IF a4_u.iduser != a4_m.idcreator THEN
                insertmeetupuser(a4_u.iduser, a4_m.idmeetup);
                counter := counter +1;
                dbms_output.put_line('counter: '
                                     || counter
                                     || ' | a4_u.iduser: '
                                     || a4_u.iduser
                                     || ' | a4_m.idmeetup: '
                                     || a4_m.idmeetup);
            END IF;
        END LOOP;
    END LOOP;
END;

CREATE TABLE a4_deleted_user AS (select * from a4_user WHERE 1=2);

CREATE OR REPLACE TRIGGER a4_delete_user_trigger BEFORE
    DELETE ON a4_user
    FOR EACH ROW
BEGIN
    INSERT INTO a4_deleted_user (
        iduser,
        firstname,
        lastname,
        email,
        username,
        userpassword,
        accountdate
    ) VALUES (
        :old.iduser,
        :old.firstname,
        :old.lastname,
        :old.email,
        :old.username,
        :old.userpassword,
        :old.accountdate
    );

END;

CREATE OR REPLACE TRIGGER a4_meetup_trigger
BEFORE INSERT OR UPDATE ON a4_meetup
FOR EACH ROW
DECLARE
    meetupstart1 DATE := :NEW.meetupstart;
    meetupend1 DATE := :NEW.meetupend;
BEGIN
        IF CURRENT_DATE > meetupend1 THEN 
        :NEW.meetupstatusid := 2;
        ELSIF CURRENT_DATE < meetupstart1 THEN 
        :NEW.meetupstatusid := 3;
        ELSE
        :NEW.meetupstatusid := 1;
        END IF;
END;

--wrong entry fixed by the trigger
INSERT INTO a4_meetup (
    idmeetup,
    idcreator,
    meetupname,
    description,
    meetupimage,
    meetuplocation,
    meetupstart,
    meetupend,
    meetupstatusid
) VALUES (
    25,
    6,
    'New Years Party',
    'let us get drunk',
    'shorturl.at/doqrQ',
    'Philly',
    '31-DECEMBER-2022',
    '1-JANUARY-2022',
    2
);

select * from a4_meetup;
select * from a4_user;
select * from a4_favorite join a4_user on a4_favorite.iduser = a4_user.iduser  join a4_meetup on a4_meetup.idmeetup = a4_favorite.idmeetup;

DELETE
FROM
    a4_user
WHERE
    iduser = 3;
    
select * from a4_meetupuser join a4_meetup on a4_meetup.idmeetup = a4_meetupuser.idmeetup join a4_user on a4_meetupuser.iduser = a4_user.iduser;