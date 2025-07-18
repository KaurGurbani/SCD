CREATE PROCEDURE SCD_Type1_Update (
    IN p_CustomerID INT,
    IN p_NewName VARCHAR(100),
    IN p_NewAddress VARCHAR(100)
)
BEGIN
    UPDATE DimCustomer
    SET Name = p_NewName,
        Address = p_NewAddress
    WHERE CustomerID = p_CustomerID
    AND CurrentFlag = 'Y';
END;
