-- Exam 3
-- Task 34.2.1 - ArtistPopularityRank

USE vrg;

DROP VIEW IF EXISTS ArtistPopularityRank;
CREATE OR REPLACE VIEW ArtistPopularityRank AS
	SELECT a.FirstName, a.LastName, a.Nationality,
	DENSE_RANK() OVER (ORDER BY c.CustomerID DESC) AS fan_count
	FROM customer_artist_int c JOIN artist a ON c.ArtistID = a.ArtistID
;

-- Task 34.2.1 - TEST
SELECT * FROM ArtistPopularityRank
ORDER BY fan_count DESC;


-- Task 34.2.2 - set_customer_country

USE vrg;

DROP TRIGGER IF EXISTS  set_customer_country;
--
delimiter //
--
CREATE TRIGGER set_customer_country
BEFORE INSERT ON vrg.CUSTOMER
FOR EACH ROW
BEGIN
	SET @country = IF(NEW.country IS NOT NULL, NEW.country, 'USA');
    SET NEW.country = @country;
END //
--
delimiter ;

-- TEST 1 INSERT INTO WITHOUT COUNTRY VALUE

DELETE FROM customer WHERE customerid=1052;
-- insert no country value
INSERT INTO customer
  (CustomerID, lastname, firstname) 
VALUES
  (1052,'yourlastname','yourfirstname')
;
--
SELECT * FROM customer WHERE customerid=1052;

-- TEST 2 `INSERT INTO` WITH COUNTRY VALUE
--
DELETE FROM customer WHERE customerid=1052;
-- insert with sex value
INSERT INTO customer 
  (CustomerID, lastname, firstname, country) 
VALUES
  (1052,'yourlastname','yourfirstname', 'Canada')
;
--
SELECT * FROM customer WHERE customerid=1052;


-- Task 34.2.3 - set_order_total

USE test_db;

-- pipeline 
-- 1 
-- drop the trigger
drop trigger if exists set_order_total;
-- 2 
-- define the trigger
-- redefine statement delimiter so that 
-- we can use the ; statement delimiter within the trigger body 

-- delimiter
delimiter //
-- define trigger
CREATE TRIGGER set_order_total
  BEFORE INSERT ON sales_order
    FOR EACH ROW
    BEGIN
      -- 1st-IF-ELSE
      IF (NEW.promotion_code = '0') THEN
              SET NEW.total = NEW.subtotal;
          ELSE
              -- look up discount value into a variable
              select discount_value into @amount
              from promotion
              where promotion_code = NEW.promotion_code;
              -- 2nd-IF amount not 0
              IF (@amount != 0) THEN 
                  -- calculate the total
                  SET @total = IF(
                      @amount > 0, 
                      NEW.subtotal + NEW.subtotal*NEW.tax_rate/100 + NEW.shipping - NEW.subtotal * @amount/100, 
                      NEW.subtotal + NEW.subtotal*NEW.tax_rate/100 + NEW.shipping + @amount);
                  SET NEW.total = @total;
              END IF; -- end-of-2nd-if
      END IF; -- end-of-1st-IF-ELSE
    END // -- end-of-trigger
delimiter ;


-- Test the trigger 
-- set autocommit = 0;
-- LOCK TABLES test_db.sales_order WRITE;
-- 3
INSERT INTO test_db.sales_order 
  (order_date, promotion_code, subtotal, tax_rate, shipping)
VALUES
  (NOW(), 'SQL0', 100, 10, 6),
  (NOW(), 'CHI9', 200, 10, 6),
  (NOW(), '0', 300, 10, 5)
;
-- UNLOCK tables;
-- commit;
-- 4
SELECT * FROM test_db.sales_order;