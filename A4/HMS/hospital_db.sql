DROP DATABASE IF EXISTS hospital_db;

CREATE DATABASE hospital_db;
USE hospital_db;

-- tables --
CREATE TABLE Patient(
    Patient_ID      int NOT NULL AUTO_INCREMENT,
    Name            TEXT,
    Address         TEXT,
    Age             INT NOT NULL,
    Gender          TEXT,
    Personal_Contact TEXT,
    Emergency_Contact TEXT,
    PRIMARY KEY(Patient_ID)
);

CREATE TABLE Patient_longTermAilments(
    longTermAilment     VARCHAR(200),
    Patient_ID          int NOT NULL,
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
    PRIMARY KEY(longTermAilment, Patient_ID)
);

CREATE TABLE Room(
    Room_Num        INT NOT NULL,
    Floor           INT NOT NULL,
    PRIMARY KEY(Room_Num)
);

CREATE TABLE Administrator(
    Admin_ID        int NOT NULL AUTO_INCREMENT,
    Username        TEXT,
    Password        TEXT,
    Name            TEXT,
    Address         TEXT,
    Age             INT ,
    Gender          TEXT,
    Personal_Contact    TEXT,
    PRIMARY KEY(Admin_ID)
);

CREATE TABLE DE_Operator(
    DE_Operator_ID         int NOT NULL AUTO_INCREMENT,
    Username        TEXT,
    Password        TEXT,
    Name            TEXT,
    Address         TEXT,
    Age             INT ,
    Gender          TEXT,
    Personal_Contact    TEXT,
    PRIMARY KEY(DE_Operator_ID)
);

CREATE TABLE FD_Operator(
    FD_Operator_ID         int NOT NULL AUTO_INCREMENT,
    Username        TEXT,
    Password        TEXT,
    Name            TEXT,
    Address         TEXT,
    Age             INT ,
    Gender          TEXT,
    Personal_Contact    TEXT,
    PRIMARY KEY(FD_Operator_ID)
);

CREATE TABLE Doctor(
    Doctor_ID       int NOT NULL AUTO_INCREMENT,
    Username        TEXT,
    Password        TEXT,
    Name            TEXT,
    Address         TEXT,
    Age             INT ,
    Gender          TEXT,
    Personal_Contact    TEXT,
    PRIMARY KEY(Doctor_ID)
);

CREATE TABLE Test(
    Test_ID         int NOT NULL AUTO_INCREMENT,
    Category        TEXT,
    BodyPart        TEXT,
    Result          TEXT,
    Patient_ID      int NOT NULL,
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
    PRIMARY KEY(Test_ID)
);

CREATE TABLE Admitted(
    Date_Admitted   DATE,
    Patient_ID      int NOT NULL,
    Room_Num        INT NOT NULL,
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY(Room_Num) REFERENCES Room(Room_Num),
    PRIMARY KEY(Date_Admitted, Patient_ID, Room_Num)
);

CREATE TABLE Discharged(
    Date_Discharged   DATE,
    Patient_ID      int NOT NULL,
    Room_Num        INT NOT NULL,
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY(Room_Num) REFERENCES Room(Room_Num),
    PRIMARY KEY(Date_Discharged, Patient_ID, Room_Num)
);

CREATE TABLE Treatment(
    Treatment_ID        int NOT NULL AUTO_INCREMENT,
    Category            TEXT,
    Details             TEXT,
    Doctor_ID           int NOT NULL,
    Patient_ID          int NOT NULL,
    FOREIGN KEY(Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
    PRIMARY KEY(Treatment_ID)
);

CREATE TABLE Appointment(
    Appointment_ID      int NOT NULL AUTO_INCREMENT,
    Doctor_ID           int NOT NULL,
    Patient_ID          int NOT NULL,
    Appointment_Date    DATE,
    Appointment_Time    TIME,
    FOREIGN KEY(Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
    PRIMARY KEY(Appointment_ID)
);

CREATE TABLE Drugs_Prescribed(
    Name                VARCHAR(200),
    Treatment_ID        int NOT NULL,
    FOREIGN KEY(Treatment_ID) REFERENCES Treatment(Treatment_ID),
    PRIMARY KEY(Name, Treatment_ID)
);