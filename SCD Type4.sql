CREATE PROCEDURE SCD_Type4_Update (
    IN p_CustomerID INT,
    IN p_NewName VARCHAR(100),
    IN p_NewAddress VARCHAR(100),
    IN p_ChangeDate DATE
)
BEGIN
    INSERT INTO DimCustomer_History
    SELECT CustomerID, Name, Address, p_ChangeDate
    FROM DimCustomer
    WHERE CustomerID = p_CustomerID AND CurrentFlag = 'Y';

    UPDATE DimCustomer
    SET Name = p_NewName,
        Address = p_NewAddress
    WHERE CustomerID = p_CustomerID AND CurrentFlag = 'Y';
END;
