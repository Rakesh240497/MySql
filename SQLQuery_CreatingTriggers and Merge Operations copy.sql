IF OBJECT_ID('quantityupdate', 'TR') IS NOT NULL
    DROP TRIGGER quantityupdate;

CREATE TABLE sales (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT,
    Recent_Update DATE
);
EXEC sp_rename 'sales.Last_Updated', 'Last_Updated', 'COLUMN';

alter table sales MODIFY Column  Recent_Update Recent_Update;

INSERT INTO sales (product_id, product_name, quantity, Recent_Update) VALUES
(1, 'Laptop', 10, '2024-12-01'),
(2, 'Smartphone', 20, '2024-12-01'),
(3, 'Tablet', 15, '2024-12-01');

MERGE into sales AS target
USING daily_sales AS source
on target.product_id = source.product_id
WHEN MATCHED THEN 
    UPDATE SET
        target.quantity = target.quantity + source.quantity,
        target.Recent_Update = GETDATE()
WHEN NOT MATCHED THEN
    INSERT (product_id, product_name, quantity, Recent_Update)
    VALUES (source.product_id, source.product_name, source.quantity, GETDATE());

-- CREATE TRIGGER quantityupdate 
-- ON daily_sales
-- AFTER INSERT, UPDATE, DELETE 
-- AS
-- BEGIN 
--     MERGE INTO sales AS target
--     USING (SELECT product_id, product_name, quantity FROM INSERTED) AS source
--     ON target.product_id = source.product_id
--     WHEN MATCHED THEN 
--         UPDATE SET
--             target.Last_Updated = target.Recent_Update,
--             target.lastvalue = target.quantity,
--             target.quantity = target.quantity + source.quantity,
--             target.Recent_Update = GETDATE()
--     WHEN NOT MATCHED THEN
--         INSERT (product_id, product_name, quantity, Recent_Update)
--         VALUES (source.product_id, source.product_name, source.quantity, GETDATE());
-- END;


CREATE TABLE daily_sales (
    product_id INT,
    product_name VARCHAR(100),
    quantity INT
);

INSERT INTO daily_sales (product_id, product_name, quantity) VALUES
(1, 'Laptop', 5),
(2, 'Smartphone', 10),
(4, 'Headphones', 8);

SELECT * from sales;
SELECT * from daily_sales;

update  daily_sales SET quantity = 2 where product_id = 2; 
insert into daily_sales values(3, 'Tablet', 15)