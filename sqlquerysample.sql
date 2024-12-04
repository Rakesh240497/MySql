BULK INSERT trips
FROM '/Users/rakeshnanankal/Downloads/bquxjob_3841b4b_1938d9e43dd.csv'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',   
    FIRSTROW = 2           
);