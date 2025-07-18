# SCD Types Implementation in MySQL

This project contains MySQL stored procedures for implementing all major Slowly Changing Dimension (SCD) types used in data warehousing.

### `DimCustomer`
This is the main dimension table used for SCD types. It stores customer details, current and historical depending on the SCD type.

SCD Type 0 | Fixed attributes, no changes allowed once inserted 
SCD Type 1 | Overwrites old data, no history kept 
SCD Type 2 | Adds a new row to track history (versioning and current flag) 
SCD Type 3 | Stores limited history in the same row (e.g., previous address) 
SCD Type 4 | Maintains history in a separate table 
SCD Type 6 | Hybrid of Types 1, 2, and 3 (overwrites + versioning + previous value) 

