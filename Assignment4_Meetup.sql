DROP TABLE a4_user CASCADE CONSTRAINTS;

DROP TABLE a4_meetup CASCADE CONSTRAINTS;

DROP TABLE a4_user CASCADE CONSTRAINTS;

DROP TABLE a4_favorite CASCADE CONSTRAINTS;

DROP TABLE a4_meetupstatus CASCADE CONSTRAINTS;

DROP TABLE a4_meetupuser CASCADE CONSTRAINTS;

DROP SEQUENCE a4_iduser_seq;
--User   

CREATE TABLE a4_user (
    iduser         NUMBER(2),
    firstname      VARCHAR2(15),
    lastname       VARCHAR2(20),
    email          VARCHAR2(25),
    username       VARCHAR2(15),
    userpassword   VARCHAR2(8),
    accountdate    DATE,
    CONSTRAINT usr_id_pk PRIMARY KEY ( iduser )
);

CREATE SEQUENCE a4_iduser_seq START WITH 15;

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
    '21-NOV-2021'
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
    '22-NOV-2021'
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
    '23-NOV-2021'
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
    '27-NOV-2021'
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
    '27-NOV-2021'
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
    '27-NOV-2021'
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
    '27-NOV-2021'
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
    '27-NOV-2021'
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
    '27-NOV-2021'
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
    '27-NOV-2021'
);

SELECT
    *
FROM
    a4_user;
    
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

SELECT
    *
FROM
    a4_meetupstatus;

--Meetup

CREATE TABLE a4_meetup (
    idmeetup         NUMBER(2),
    idcreator        NUMBER(2),
    meetupname       VARCHAR2(25),
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
    'Establishment',
    'All too will bear in mind this sacred principle',
    'shorturl.at/doqrQ',
    'Da Capital',
    '1-OCTOBER-2010',
    '2-OCTOBER-2010',
    2
);

select * from a4_meetup;

--MeetupUser

CREATE TABLE a4_meetupuser (
    idmeetupuser   NUMBER(2),
    iduser         NUMBER(2),
    idmeetup       NUMBER(2),
    CONSTRAINT mtpuser_idmeetupuser_pk PRIMARY KEY ( idmeetupuser ),
    CONSTRAINT mtpuser_iduser_fk FOREIGN KEY ( iduser )
        REFERENCES a4_user ( iduser ),
    CONSTRAINT mtpuser_idmeetup_fk FOREIGN KEY ( idmeetup )
        REFERENCES a4_meetup ( idmeetup )
);
--Favorite

CREATE TABLE a4_favorite (
    idfavorite    NUMBER(2),
    idmeetup     NUMBER(2),
    iduser       NUMBER(2),
    CONSTRAINT fav_idfavorite_pk PRIMARY KEY ( idfavorite ),
    constraint   fav_iduser_fk FOREIGN KEY ( iduser) REFERENCES a4_user(iduser), 
    constraint fav_idmeetup_fk foreign key ( idmeetup ) REFERENCES a4_meetup(idmeetup)
);