CREATE PROCEDURE SCD_Type2_Update (
    IN p_CustomerID INT,
    IN p_NewName VARCHAR(100),
    IN p_NewAddress VARCHAR(100),
    IN p_ChangeDate DATE
)
BEGIN
    DECLARE v_OldVersion INT;

    SELECT Version INTO v_OldVersion FROM DimCustomer
    WHERE CustomerID = p_CustomerID AND CurrentFlag = 'Y';

    UPDATE DimCustomer
    SET EndDate = p_ChangeDate,
        CurrentFlag = 'N'
    WHERE CustomerID = p_CustomerID AND CurrentFlag = 'Y';

    INSERT INTO DimCustomer (CustomerID, Name, Address, StartDate, EndDate, CurrentFlag, Version)
    VALUES (p_CustomerID, p_NewName, p_NewAddress, p_ChangeDate, NULL, 'Y', v_OldVersion + 1);
END;
