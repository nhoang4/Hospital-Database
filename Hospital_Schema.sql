use Hospital_Schema;

create database Hospital_Schema;
show databases;
show full tables;

create table Test
(
    test_ID varchar(20) not null,
    testDate Date,
    test_Name VARCHAR(20),
    prescription varchar(50),
    Dr_ID VARCHAR(20),
    prescr_price Int,
    primary key (test_ID)
);

create table Nurse
(
    /*Nurse (Nur_ID, N_nurse, Nur_Special, P_ID, Dr_ID);*/
    Nur_ID VARCHAR(20) not null,
    N_nurse VARCHAR (20),
    Nur_Special VARCHAR(50),
    P_ID varchar(20),
    Dr_ID varchar(20),
    primary key (Nur_ID),
    foreign key (Dr_ID)references Doctor(Dr_ID),
    foreign key (P_ID) references Patient(P_ID)
);

create table Doctor (
    /*Doctor (Dr_ID,Dr_Special, N_Dr);*/

    Dr_ID VARCHAR(20) not null,
    Dr_Special VARCHAR(50),
    N_Dr VARCHAR (20),
    primary key (Dr_ID)
);

create table Patient(
#     Patient (P_ID, N_patient, In_Date, Out_Date, Insurance, Dr_ID);
    P_ID VARCHAR(20) not null,
    N_patient VARCHAR (20),
    In_Date date,
    Out_Date date,
    Insurance VARCHAR(20),
    Dr_ID varchar(20),
    primary key (P_ID),
    foreign key (Dr_ID) references Doctor(Dr_ID)
    );

create table Administrative(
    Admin_ID VARCHAR (10) not null,
    Note_taking varchar(10),
    Ad_Ph_Num VARCHAR (10),
    N_admin varchar(20),
    Dr_ID VARCHAR (10) not null,
    PRIMARY KEY(Admin_ID),
    foreign key (Dr_ID) references Doctor(Dr_ID)
);


insert into Doctor values ('D900', 'Neurology', 'John' );
insert into Doctor values ('D901', 'Immunology', 'Henry' );
insert into Doctor values ('D902', 'Anesthesiology', 'Bruce' );
insert into Doctor values ('D903', 'Dermatology', 'Thor' );
insert into Doctor values ('D904', 'Radiology', 'Steven' );
insert into Doctor values ('D905', 'Emergency Medicine', 'Clinton' );
insert into Doctor values ('D906', 'Family Medicine', 'Pietro' );
insert into Doctor values ('D907', 'Gynecology', 'Wanda' );
insert into Doctor values ('D908', 'Ophthalmology', 'Cressida' );
insert into Doctor values ('D909', 'Cardiology', 'Jacques' );
insert into Doctor values ('D910', 'Orthopedics', 'Heracles' );
insert into Doctor values ('D911', 'Oncology', 'TChalla' );
insert into Doctor values ('D912', 'Pediatrics', 'Victor' );
insert into Doctor values ('D913', 'Psychiatry', 'Dane' );
insert into Doctor values ('D914', 'Urology', 'Natalia' );
insert into Doctor values ('D915', 'Neurology', 'Brandt' );
insert into Doctor values ('D916', 'Dermatology', 'Henry' );
insert into Doctor values ('D917', 'Gynecology', 'Heather' );
insert into Doctor values ('D918', 'Anesthesiology', 'Patsy' );
insert into Doctor values ('D919', 'Family Medicine', 'Matthew' );
insert into Doctor values ('D920', 'Cardiology', 'Robert' );
insert into Doctor values ('D921', 'Orthopedics', 'Simon' );
insert into Doctor values ('D922', 'Neurology', 'Aleta' );
insert into Doctor values ('D923', 'Family Medicine', 'Martinex');
insert into Doctor values ('D924', 'Urology', 'Carol');








