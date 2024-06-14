CREATE OR REPLACE TRIGGER UpdateMedicineQuantity
AFTER INSERT ON Bill
FOR EACH ROW
BEGIN
    UPDATE Medicine
    SET Quantity = Quantity - :new.Quantity
    WHERE Code = :new.Code;
END;
/

CREATE OR REPLACE TRIGGER UpdatePatientDischargeDate
AFTER INSERT ON Record
FOR EACH ROW
BEGIN
    UPDATE Patients
    SET DateDischarged = :new.Appointment
    WHERE Pid = :new.Pid;
END;
/

