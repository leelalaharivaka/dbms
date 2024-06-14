
DECLARE
    CURSOR medicine_cursor IS
        SELECT Code, Name, Price, Quantity
        FROM Medicine;

    -- Declare variables to hold column values
    v_Code Medicine.Code%TYPE;
    v_Name Medicine.Name%TYPE;
    v_Price Medicine.Price%TYPE;
    v_Quantity Medicine.Quantity%TYPE;
BEGIN
    -- Open the cursor
    OPEN medicine_cursor;

    -- Loop through the cursor and fetch data
    LOOP
        FETCH medicine_cursor INTO v_Code, v_Name, v_Price, v_Quantity;
        EXIT WHEN medicine_cursor%NOTFOUND;
        
        -- Process or display the retrieved data as needed
        DBMS_OUTPUT.PUT_LINE('Medicine Code: ' || v_Code);
        DBMS_OUTPUT.PUT_LINE('Medicine Name: ' || v_Name);
        DBMS_OUTPUT.PUT_LINE('Price: ' || v_Price);
        DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_Quantity);
        DBMS_OUTPUT.PUT_LINE('--------------------------');
    END LOOP;

    -- Close the cursor
    CLOSE medicine_cursor;
END;
/

-- Declare a cursor for the Employee table
DECLARE
    CURSOR employee_cursor IS
        SELECT Eid, EName, Sex, EAddress, Salary, History, ContactNo
        FROM Employee;

    -- Declare variables to hold column values
    v_Eid Employee.Eid%TYPE;
    v_EName Employee.EName%TYPE;
    v_Sex Employee.Sex%TYPE;
    v_EAddress Employee.EAddress%TYPE;
    v_Salary Employee.Salary%TYPE;
    v_History Employee.History%TYPE;
    v_ContactNo Employee.ContactNo%TYPE;
BEGIN
    -- Open the cursor
    OPEN employee_cursor;

    -- Loop through the cursor and fetch data
    LOOP
        FETCH employee_cursor INTO v_Eid, v_EName, v_Sex, v_EAddress, v_Salary, v_History, v_ContactNo;
        EXIT WHEN employee_cursor%NOTFOUND;
        
        -- Process or display the retrieved data as needed
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_Eid);
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_EName);
        DBMS_OUTPUT.PUT_LINE('Sex: ' || v_Sex);
        DBMS_OUTPUT.PUT_LINE('Address: ' || v_EAddress);
        DBMS_OUTPUT.PUT_LINE('Salary: ' || v_Salary);
        DBMS_OUTPUT.PUT_LINE('History: ' || v_History);
        DBMS_OUTPUT.PUT_LINE('Contact No: ' || v_ContactNo);
        DBMS_OUTPUT.PUT_LINE('--------------------------');
    END LOOP;

    -- Close the cursor
    CLOSE employee_cursor;
END;
/

