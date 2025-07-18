CREATE PROCEDURE SCD_Type3_Update (
    IN p_CustomerID INT,
    IN p_NewAddress VARCHAR(100)
)
BEGIN
    UPDATE DimCustomer
    SET PreviousAddress = Address,
        Address = p_NewAddress
    WHERE CustomerID = p_CustomerID AND CurrentFlag = 'Y';
END;
