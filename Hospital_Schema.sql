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
    N_nurse Int (20),
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
    N_Dr Int (20),
    primary key (Dr_ID)
);

create table Patient(
#     Patient (P_ID, N_patient, In_Date, Out_Date, Insurance, Dr_ID);
    P_ID VARCHAR(20) not null,
    N_patient int (20),
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










