-- Create tables using PL/SQL
BEGIN
    -- Create Medicine table
    EXECUTE IMMEDIATE 'CREATE TABLE Medicine (
        Code INT PRIMARY KEY,
        Name VARCHAR(8),
        Price DECIMAL(5, 2),
        Quantity INT
    )';

    -- Create Employee table
    EXECUTE IMMEDIATE 'CREATE TABLE Employee (
        Eid INT PRIMARY KEY,
        EName VARCHAR(8),
        Sex VARCHAR(5),
        EAddress VARCHAR(7),
        Salary DECIMAL(5, 2),
        History CLOB,
        ContactNo VARCHAR(3)
    )';

    -- Create Rooms table
    EXECUTE IMMEDIATE 'CREATE TABLE Rooms (
        RoomID INT PRIMARY KEY,
        RoomType VARCHAR(7),
        Period VARCHAR(7)
    )';

    -- Create Patients table
    EXECUTE IMMEDIATE 'CREATE TABLE Patients (
        Pid INT PRIMARY KEY,
        Name VARCHAR(8),
        Sex VARCHAR(5),
        Address VARCHAR(8),
        DateAdmitted DATE,
        DateDischarged DATE,
        RoomID INT,
        Eid INT,
        FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
        FOREIGN KEY (Eid) REFERENCES Employee(Eid)
    )';

    -- Create Record table
    EXECUTE IMMEDIATE 'CREATE TABLE Record (
        RecordNo INT PRIMARY KEY,
        Description CLOB,
        Pid INT,
        Appointment DATE,
        FOREIGN KEY (Pid) REFERENCES Patients(Pid)
    )';

    -- Create Bill table
    EXECUTE IMMEDIATE 'CREATE TABLE Bill (
        BillID INT PRIMARY KEY,
        Pid INT,
        Code INT,
        Quantity INT,
        BillDate DATE,
        FOREIGN KEY (Pid) REFERENCES Patients(Pid),
        FOREIGN KEY (Code) REFERENCES Medicine(Code)
    )';

    -- Create DoctorRelationship table
    EXECUTE IMMEDIATE 'CREATE TABLE DoctorRelationship (
        DoctorID INT PRIMARY KEY,
        Type VARCHAR(6),
        Eid INT,
        FOREIGN KEY (Eid) REFERENCES Employee(Eid)
    )';

    -- Create RoomGovernsNurse table
    EXECUTE IMMEDIATE 'CREATE TABLE RoomGovernsNurse (
        RoomID INT,
        NurseID INT,
        FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
        FOREIGN KEY (NurseID) REFERENCES Employee(Eid)
    )';

    -- Create Attends table
    EXECUTE IMMEDIATE 'CREATE TABLE Attends (
        AppointmentID INT PRIMARY KEY,
        Pid INT,
        DoctorID INT,
        AppointmentDate DATE,
        FOREIGN KEY (Pid) REFERENCES Patients(Pid),
        FOREIGN KEY (DoctorID) REFERENCES Employee(Eid)
    )';

    -- Create EmployeeTitle table
    EXECUTE IMMEDIATE 'CREATE TABLE EmployeeTitle (
        TitleID INT PRIMARY KEY,
        Title VARCHAR(7)
    )';

    -- Create EmployeeIsA table
    EXECUTE IMMEDIATE 'CREATE TABLE EmployeeIsA (
        Eid INT,
        TitleID INT,
        FOREIGN KEY (Eid) REFERENCES Employee(Eid),
        FOREIGN KEY (TitleID) REFERENCES EmployeeTitle(TitleID)
    )';

    -- Create ReceptionistMaintainsRecord table
    EXECUTE IMMEDIATE 'CREATE TABLE ReceptionistMaintainsRecord (
        Eid INT,
        RecordNo INT,
        FOREIGN KEY (Eid) REFERENCES Employee(Eid),
        FOREIGN KEY (RecordNo) REFERENCES Record(RecordNo)
    )';

    COMMIT;
END;
/

-- Create procedures using PL/SQL
CREATE OR REPLACE PROCEDURE InsertMedicine (
    p_Code INT,
    p_Name VARCHAR2,
    p_Price DECIMAL,
    p_Quantity INT
) AS
BEGIN
    INSERT INTO Medicine (Code, Name, Price, Quantity)
    VALUES (p_Code,p_name,p_price,p_quantity);
END;
/
-- Procedure to insert data into the Employee table
CREATE OR REPLACE PROCEDURE InsertEmployee (
    p_Eid INT,
    p_EName VARCHAR2,
    p_Sex VARCHAR2,
    p_EAddress VARCHAR2,
    p_Salary NUMBER,
    p_History CLOB,
    p_ContactNo VARCHAR2
) AS
BEGIN
    INSERT INTO Employee (Eid, EName, Sex, EAddress, Salary, History, ContactNo)
    VALUES (p_Eid, p_EName, p_Sex, p_EAddress, p_Salary, p_History, p_ContactNo);
    COMMIT;
END;
/
-- Procedure to insert data into the Rooms table
CREATE OR REPLACE PROCEDURE InsertRoom (
    p_RoomID INT,
    p_RoomType VARCHAR2,
    p_Period VARCHAR2
) AS
BEGIN
    INSERT INTO Rooms (RoomID, RoomType, Period)
    VALUES (p_RoomID, p_RoomType, p_Period);
    COMMIT;
END;
/
-- Procedure to insert data into the Patients table
CREATE OR REPLACE PROCEDURE InsertPatient (
    p_Pid INT,
    p_Name VARCHAR2,
    p_Sex VARCHAR2,
    p_Address VARCHAR2,
    p_DateAdmitted DATE,
    p_DateDischarged DATE,
    p_RoomID INT,
    p_Eid INT
) AS
BEGIN
    INSERT INTO Patients (Pid, Name, Sex, Address, DateAdmitted, DateDischarged, RoomID, Eid)
    VALUES (p_Pid, p_Name, p_Sex, p_Address, p_DateAdmitted, p_DateDischarged, p_RoomID, p_Eid);
    COMMIT;
END;
/
-- Procedure to insert data into the Record table
CREATE OR REPLACE PROCEDURE InsertRecord (
    p_RecordNo INT,
    p_Description CLOB,
    p_Pid INT,
    p_Appointment DATE
) AS
BEGIN
    INSERT INTO Record (RecordNo, Description, Pid, Appointment)
    VALUES (p_RecordNo, p_Description, p_Pid, p_Appointment);
    COMMIT;
END;
/
-- Procedure to insert data into the Bill table
CREATE OR REPLACE PROCEDURE InsertBill (
    p_BillID INT,
    p_Pid INT,
    p_Code INT,
    p_Quantity INT,
    p_BillDate DATE
) AS
BEGIN
    INSERT INTO Bill (BillID, Pid, Code, Quantity, BillDate)
    VALUES (p_BillID, p_Pid, p_Code, p_Quantity, p_BillDate);
    COMMIT;
END;
/
-- Procedure to insert data into the DoctorRelationship table
CREATE OR REPLACE PROCEDURE InsertDoctorRelationship (
    p_DoctorID INT,
    p_Type VARCHAR2,
    p_Eid INT
) AS
BEGIN
    INSERT INTO DoctorRelationship (DoctorID, Type, Eid)
    VALUES (p_DoctorID, p_Type, p_Eid);
    COMMIT;
END;
/

-- Procedure to insert data into the RoomGovernsNurse table
CREATE OR REPLACE PROCEDURE InsertRoomGovernsNurse (
    p_RoomID INT,
    p_NurseID INT
) AS
BEGIN
    INSERT INTO RoomGovernsNurse (RoomID, NurseID)
    VALUES (p_RoomID, p_NurseID);
    COMMIT;
END;
/

-- Procedure to insert data into the Attends table
CREATE OR REPLACE PROCEDURE InsertAttends (
    p_AppointmentID INT,
    p_Pid INT,
    p_DoctorID INT,
    p_AppointmentDate DATE
) AS
BEGIN
    INSERT INTO Attends (AppointmentID, Pid, DoctorID, AppointmentDate)
    VALUES (p_AppointmentID, p_Pid, p_DoctorID, p_AppointmentDate);
    COMMIT;
END;
/

-- Procedure to insert data into the EmployeeTitle table
CREATE OR REPLACE PROCEDURE InsertEmployeeTitle (
    p_TitleID INT,
    p_Title VARCHAR2
) AS
BEGIN
    INSERT INTO EmployeeTitle (TitleID, Title)
    VALUES (p_TitleID, p_Title);
    COMMIT;
END;
/

-- Procedure to insert data into the DoctorRelationship table
CREATE OR REPLACE PROCEDURE InsertDoctorRelationship (
    p_DoctorID INT,
    p_Type VARCHAR2,
    p_Eid INT
) AS
BEGIN
    INSERT INTO DoctorRelationship (DoctorID, Type, Eid)
    VALUES (p_DoctorID, p_Type, p_Eid);
    COMMIT;
END;
/

-- Procedure to insert data into the RoomGovernsNurse table
CREATE OR REPLACE PROCEDURE InsertRoomGovernsNurse (
    p_RoomID INT,
    p_NurseID INT
) AS
BEGIN
    INSERT INTO RoomGovernsNurse (RoomID, NurseID)
    VALUES (p_RoomID, p_NurseID);
    COMMIT;
END;
/

-- Procedure to insert data into the Attends table
CREATE OR REPLACE PROCEDURE InsertAttends (
    p_AppointmentID INT,
    p_Pid INT,
    p_DoctorID INT,
    p_AppointmentDate DATE
) AS
BEGIN
    INSERT INTO Attends (AppointmentID, Pid, DoctorID, AppointmentDate)
    VALUES (p_AppointmentID, p_Pid, p_DoctorID, p_AppointmentDate);
    COMMIT;
END;
/

-- Procedure to insert data into the EmployeeTitle table
CREATE OR REPLACE PROCEDURE InsertEmployeeTitle (
    p_TitleID INT,
    p_Title VARCHAR2
) AS
BEGIN
    INSERT INTO EmployeeTitle (TitleID, Title)
    VALUES (p_TitleID, p_Title);
    COMMIT;
END;
/

-- Procedure to insert data into the EmployeeIsA table
CREATE OR REPLACE PROCEDURE InsertEmployeeIsA (
    p_Eid INT,
    p_TitleID INT
) AS
BEGIN
    INSERT INTO EmployeeIsA (Eid, TitleID)
    VALUES (p_Eid, p_TitleID);
    COMMIT;
END;
/

-- Procedure to insert data into the ReceptionistMaintainsRecord table
CREATE OR REPLACE PROCEDURE InsertRMR (
    p_Eid INT,
    p_RecordNo INT
) AS
BEGIN
    INSERT INTO  ReceptionistMaintainsRecord(Eid, RecordNo)
    VALUES (p_Eid, p_RecordNo);
    COMMIT;
END;
/



-- Insert data into the Medicine table
BEGIN
    InsertMedicine(1, 'M1', 10.99, 100);
    InsertMedicine(2, 'M2', 15.99, 50);
    InsertMedicine(3, 'M3', 8.99, 75);
END;
/

-- Insert data into the Employee table
BEGIN
	 InsertEmployee(1, 'John', 'M', 'Main', 50.0, 'y', '123');
    InsertEmployee(2, 'Jane', 'F', 'Elm', 87.0, 'r', '987');
    InsertEmployee(3, 'lah', 'M', 'Oak', 48.9, 'm', '555');
END;
/

-- Insert data into the Rooms table
BEGIN
    InsertRoom(1, 'Single', '24 Hr');
    InsertRoom(2, 'Double', '48 Hr');
    InsertRoom(3, 'Suite', '72 Hr');
END;
/

-- Insert data into the Patients table with the "23 Jun 21" date format
BEGIN
	InsertPatient(1, 'hars', 'Male', 'YUI','02-JAN-23','02-JAN-23', 1, 1);
   
    InsertPatient(2, 'op', 'F', 'Oak St','17-FEB-23','17-JUN-24', 2, 2);
    InsertPatient(3, 'sai', 'M', 'Elm St', '12-MAR-23','15-JUL-23', 3, 3);
END;
/

-- Insert data into the Record table with the "23 Jun 21" date format
BEGIN
    InsertRecord(1, 'r1', 1, '02-JAN-23');
    InsertRecord(2, 'r2', 2, '17-FEB-23');
    InsertRecord(3, 'r3', 3, '12-MAR-23');
END;
/

-- Insert data into the Bill table
BEGIN
    InsertBill(1, 1, 1, 2,'02-JAN-23');
    InsertBill(2, 2, 2, 3,'17-JUN-24');
    InsertBill(3, 3, 3, 1, '23-JUL-23');
END;
/

-- Insert data into the EmployeeTitle table using the InsertEmployeeTitle procedure
BEGIN
    InsertEmployeeTitle(1, 'Title1');
    InsertEmployeeTitle(2, 'Title2');
    InsertEmployeeTitle(3, 'Title3');
END;
/


BEGIN
    -- Modify the values to match your data
    InsertDoctorRelationship(1, 'Visit', 1);
    InsertDoctorRelationship(2, 'Traine', 2);
    InsertDoctorRelationship(3, 'PMT', 3);
END;
/

-- Insert data into the RoomGovernsNurse table
BEGIN
    -- Modify the values to match your data
    InsertRoomGovernsNurse(1, 1);
    InsertRoomGovernsNurse(2, 2);
    InsertRoomGovernsNurse(3, 3);
END;
/

-- Insert data into the Attends table
BEGIN
    -- Modify the values to match your data
    InsertAttends(1, 1, 1,'01-JAN-23');
    InsertAttends(2, 2, 2,'09-JUN-23');
    InsertAttends(3, 3, 3, '22-JUN-22');
END;
/

-- Insert data into the EmployeeIsA table
BEGIN
    -- Modify the values to match your data
    InsertEmployeeIsA(1, 1);
    InsertEmployeeIsA(2, 2);
    InsertEmployeeIsA(3, 3);
END;
/

-- Insert data into the ReceptionistMaintainsRecord table
BEGIN
    -- Modify the values to match your data
    InsertRMR(1, 1);
    InsertRMR(2, 2);
    InsertRMR(3, 3);
END;
/