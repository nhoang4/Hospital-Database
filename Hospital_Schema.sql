use Hospital_Schema;

create database Hospital_Schema;
show databases;
show full tables;

create table Test
(
    test_ID varchar(20) not null,
    testDate VARCHAR(20),
    test_Name VARCHAR(20),
    prescription varchar(50),
    Dr_ID VARCHAR(20),
    prescr_price Int,
    primary key (test_ID),
    foreign key (Dr_ID)references Doctor(Dr_ID)
);

create table Nurse
(
    Nur_ID VARCHAR(20) not null,
    N_nurse VARCHAR (20),
    Nur_Special VARCHAR(50),
    Dr_ID varchar(20),
    P_ID varchar(20),
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
    In_Date VARCHAR(20),
    Out_Date VARCHAR(20),
    Insurance VARCHAR(50),
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


insert into Patient values ('P100', 'Jeff', '10/20/2022','10/27/2022', 'Blue Cross Blue Shield of California', 'D903');
insert into Patient values ('P101', 'Money', '4/1/2022','5/22/2022', 'United Health', 'D906');
insert into Patient values ('P102', 'Charles', '3/4/2022','4/5/2022', 'Kaiser Foundation', 'D907');
insert into Patient values ('P103', 'Jack', '5/11/2022','5/14/2022', 'Anthem Inc.', 'D910');
insert into Patient values ('P104', 'Tony', '3/1/2022','3/23/2022', 'Centene Corporation', 'D900');
insert into Patient values ('P105', 'Francisco', '10/3/2021','3/27/2022', 'Humana', 'D901');
insert into Patient values ('P106', 'Quincy', '12/24/2021','6/27/2022', 'CVS Health', 'D902');
insert into Patient values ('P107', 'Richard', '1/2/2022','2/25/2022', 'Blue Cross of Michigan', 'D907');
insert into Patient values ('P108', 'Eugene', '2/20/2021','12/1/2022', 'CIGNA', 'D908');
insert into Patient values ('P109', 'Cesear', '3/20/2022','10/30/2022', 'Molina Health', 'D909');
insert into Patient values ('P110', 'Jane', '5/20/2022','9/22/2022', 'Independence Health Group', 'D909');
insert into Patient values ('P111', 'Anne', '7/20/2022','8/19/2022', 'Guidewell Mutual Holding', 'D910');
insert into Patient values ('P112', 'Maya', '5/4/2022','7/3/2022', 'California Physicians Service', 'D911');
insert into Patient values ('P113', 'Elizabeth', '2/3/2022','3/4/2022', 'Highmark Group', 'D912');
insert into Patient values ('P114', 'Malala', '1/2/2022','4/6/2022', 'Blue Cross Blue Shield of New Jersey', 'D913');
insert into Patient values ('P115', 'Bob', '1/20/2022','1/27/2022', 'Blue Cross Blue Shield of California', 'D914');
insert into Patient values ('P116', 'Mike', '4/3/2022','5/23/2022', 'United Health', 'D915');
insert into Patient values ('P117', 'Steven', '3/5/2022','4/6/2022', 'Kaiser Foundation', 'D916');
insert into Patient values ('P118', 'Jake', '5/14/2022','5/17/2022', 'Anthem Inc.', 'D917');
insert into Patient values ('P119', 'Herbet', '3/5/2022','3/24/2022', 'Centene Corporation', 'D918');
insert into Patient values ('P120', 'Frank', '10/2/2021','3/29/2022', 'Humana', 'D919');
insert into Patient values ('P121', 'Lmao', '12/25/2021','6/26/2022', 'CVS Health', 'D920');
insert into Patient values ('P122', 'Nhan', '1/4/2022','2/27/2022', 'Blue Cross of Michigan', 'D923');
insert into Patient values ('P123', 'Jacob', '2/21/2021','12/1/2022', 'CIGNA', 'D924');
insert into Patient values ('P124', 'Mashell', '3/21/2022','10/31/2022', 'Molina Health', 'D921');

insert into Administrative values ('A900', '0', 1111, 'Katniss' , 'D901');
insert into Administrative values ('A901', '1', 1112, 'Peeta' , 'D903');
insert into Administrative values ('A902', '2', 1113,  'Gale' , 'D921');
insert into Administrative values ('A903', '3', 1114, 'Haymitch', 'D922' );
insert into Administrative values ('A904', '4', 1115,  'Effie' , 'D924');
insert into Administrative values ('A905', '5', 1116,  'Primrose', 'D902');
insert into Administrative values ('A906', '6', 1117,  'Coriolanus' , 'D904');
insert into Administrative values ('A907', '7', 1118,  'Finnick', 'D905' );
insert into Administrative values ('A908', '8', 1119, 'Annie' , 'D906');
insert into Administrative values ('A909', '9', 1120, 'Rue' , 'D903');
insert into Administrative values ('A910', '10', 1121, 'Madge', 'D904' );
insert into Administrative values ('A911', '11', 1122, 'Johanna', 'D910' );
insert into Administrative values ('A912', '12', 1123,  'Cinna' , 'D911');
insert into Administrative values ('A913', '13', 1124,  'Portia' , 'D912');
insert into Administrative values ('A914', '14', 1125,  'Octavia' , 'D913');
insert into Administrative values ('A915', '15', 1126, 'Falvius' , 'D914');
insert into Administrative values ('A916', '16', 1127,  'Seneca' , 'D915');
insert into Administrative values ('A917', '17', 1128,  'Caesar' , 'D915');
insert into Administrative values ('A918', '18', 1129,  'Cashmere' , 'D916');
insert into Administrative values ('A919', '19', 1130, 'Clove' , 'D917');
insert into Administrative values ('A920', '20', 1131, 'BeeTee' , 'D918');
insert into Administrative values ('A921', '21', 1132, 'Mags' , 'D918');
insert into Administrative values ('A922', '22', 1133,  'Wiress' , 'D919');
insert into Administrative values ('A923', '23', 1134, 'Thresh', 'D920');
insert into Administrative values ('A924', '24', 1135, 'Gloss', 'D922');

insert into Test values ( 'T101', '04/19/22', 'bloodwork', 'morphine', 'D900', '100' );
insert into Test values ( 'T325', '03/25/22', 'allergy', 'benadryl', 'D901', '150');
insert into Test values ( 'T419', '05/26/22', 'bacteria culture', 'metformin', 'D902', '177' );
insert into Test values ( 'T526', '01/01/23', 'covid', 'omeprazole', 'D903', '125' );
insert into Test values ( 'T818', '06/18/23', 'concussion', 'simvastatin', 'D904', '120' );
insert into Test values ( 'T108', '07/03/22', 'colonoscopy', 'lisinopril', 'D905', '177' );
insert into Test values ( 'T765', '08/11/23', 'drug test', 'morphine', 'D906', '199' );
insert into Test values ( 'T876', '09/09/22', 'iron test', 'tylenol', 'D907', '188' );
insert into Test values ( 'T435', '10/05/22', 'bloodwork', 'benadryl', 'D908', '100' );
insert into Test values ( 'T666', '11/25/22', 'obesity test ', 'metformin', 'D909', '100');
insert into Test values ( 'T232', '12/25/22', 'pap smear', 'omeprazole', 'D910', '100' );
insert into Test values ( 'T904', '01/02/22', 'pregnancy test', 'simvastatin', 'D911', '100');
insert into Test values ( 'T764', '02/22/22', 'allergy', 'lisinopril', 'D912', '100' );
insert into Test values ( 'T336', '03/26/22', 'flu', 'morphine', 'D913', '100' );
insert into Test values ( 'T267', '04/28/22', 'concussion', 'tylenol', 'D914', '100' );
insert into Test values ( 'T990', '05/30/22', 'strep test', 'benadryl', 'D915', '100' );
insert into Test values ( 'T234', '06/01/22', 'iron test', 'miralax', 'D916', '100');
insert into Test values ( 'T777', '07/02/23', 'colonoscopy', 'metformin', 'D917', '100');
insert into Test values ( 'T821', '08/03/22', 'drug test', 'tylenol', 'D918', '100' );
insert into Test values ( 'T321', '09/04/22', 'flu', 'omeprazole', 'D919', '100');
insert into Test values ( 'T953', '10/05/23', 'pap smear', 'simvastatin', 'D920', '100' );
insert into Test values ( 'T999', '11/06/22', 'allergy ', 'lisinopril', 'D921', '100');
insert into Test values ( 'T433', '12/07/22', 'strep test', 'morphine', 'D922', '100' );
insert into Test values ( 'T299', '01/08/22', 'bloodwork', 'miralax','D923', '100' );
insert into Test values ( 'T656', '02/09/22', 'concussion', 'tylenol', 'D924', '100' );

insert into Nurse values ('N900', 'Neurology', 'Percy', 'D924','P124');
insert into Nurse values ('N901', 'Immunology', 'Annabeth','D900','P100'  );
insert into Nurse values ('N902', 'Anesthesiology', 'Grover','D923','P123' );
insert into Nurse values ('N903', 'Dermatology', 'Chiron','D901','P101' );
insert into Nurse values ('N904', 'Radiology', 'Nico','D922','P122' );
insert into Nurse values ('N905', 'Emergency Medicine', 'Nico','D902','P102');
insert into Nurse values ('N906', 'Family Medicine', 'Clarisse','D921','P121' );
insert into Nurse values ('N907', 'Gynecology', 'Silena','D903','P103' );
insert into Nurse values ('N908', 'Ophthalmology', 'Cressida','D920','P120' );
insert into Nurse values ('N909', 'Cardiology', 'Tyson','D904','P104' );
insert into Nurse values ('N910', 'Orthopedics', 'Aphrodite','D919','P119' );
insert into Nurse values ('N911', 'Oncology', 'Athena','D905','P105' );
insert into Nurse values ('N912', 'Pediatrics', 'Ares' ,'D918','P118');
insert into Nurse values ('N913', 'Psychiatry', 'Charles','D906','P106' );
insert into Nurse values ('N914', 'Urology', 'Bianca','D917','P107');
insert into Nurse values ('N915', 'Neurology', 'Ethan','D907','P107' );
insert into Nurse values ('N916', 'Dermatology', 'Juniper','D916','P106' );
insert into Nurse values ('N917', 'Gynecology', 'Calypso','D908','P108' );
insert into Nurse values ('N918', 'Anesthesiology', 'Piper','D915','P115' );
insert into Nurse values ('N919', 'Family Medicine', 'Jason','D909','P109' );
insert into Nurse values ('N920', 'Cardiology', 'Leo','D914' ,'P114');
insert into Nurse values ('N921', 'Orthopedics', 'Apollo','D910' ,'P110');
insert into Nurse values ('N922', 'Neurology', 'Hermes' ,'D913','P113');
insert into Nurse values ('N923', 'Family Medicine', 'Hades','D911','P111');
insert into Nurse values ('N924', 'Urology', 'Persephone','D912','P112');





