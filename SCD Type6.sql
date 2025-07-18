CREATE PROCEDURE SCD_Type6_Update (
    IN p_CustomerID INT,
    IN p_NewName VARCHAR(100),
    IN p_NewAddress VARCHAR(100),
    IN p_ChangeDate DATE
)
BEGIN
    DECLARE v_OldVersion INT;
    DECLARE v_OldAddress VARCHAR(100);

    SELECT Version, Address INTO v_OldVersion, v_OldAddress
    FROM DimCustomer
    WHERE CustomerID = p_CustomerID AND CurrentFlag = 'Y';

    UPDATE DimCustomer
    SET EndDate = p_ChangeDate,
        CurrentFlag = 'N'
    WHERE CustomerID = p_CustomerID AND CurrentFlag = 'Y';

    INSERT INTO DimCustomer (
        CustomerID, Name, Address, StartDate, EndDate, CurrentFlag, PreviousAddress, Version
    )
    VALUES (
        p_CustomerID, p_NewName, p_NewAddress, p_ChangeDate, NULL, 'Y', v_OldAddress, v_OldVersion + 1
    );
END;
