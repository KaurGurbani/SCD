CREATE PROCEDURE SCD_Type0_Update (
    IN p_CustomerID INT,
    IN p_NewName VARCHAR(100),
    IN p_NewAddress VARCHAR(100)
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM DimCustomer 
        WHERE CustomerID = p_CustomerID 
        AND (Name != p_NewName OR Address != p_NewAddress)
    ) THEN
        SELECT 'No update allowed for fixed attributes (SCD Type 0).' AS Message;
    END IF;
END;
