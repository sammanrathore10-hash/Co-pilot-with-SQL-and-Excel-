-- Create SalesData Table
CREATE TABLE IF NOT EXISTS SalesData (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    City VARCHAR(100) NOT NULL,
    PurchaseAmount DECIMAL(10, 2) NOT NULL,
    PurchaseDate DATE NOT NULL
);

-- Insert 10,000 rows of random data
-- Note: This script uses a procedure to generate random data efficiently

DELIMITER $$

CREATE PROCEDURE InsertRandomSalesData()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE random_name VARCHAR(100);
    DECLARE random_age INT;
    DECLARE random_city VARCHAR(100);
    DECLARE random_amount DECIMAL(10, 2);
    DECLARE random_date DATE;
    
    DECLARE cities_array JSON;
    DECLARE names_array JSON;
    DECLARE first_names JSON;
    DECLARE last_names JSON;
    
    -- Initialize arrays with sample data
    SET first_names = JSON_ARRAY('John', 'Mary', 'Robert', 'Patricia', 'Michael', 'Jennifer', 'William', 'Linda', 'David', 'Barbara', 'Richard', 'Susan', 'Joseph', 'Jessica', 'Thomas', 'Sarah', 'Charles', 'Karen', 'Christopher', 'Nancy', 'Daniel', 'Lisa', 'Matthew', 'Betty', 'Mark', 'Margaret', 'Donald', 'Sandra', 'Steven', 'Ashley', 'Paul', 'Kimberly', 'Andrew', 'Emily', 'Joshua', 'Donna', 'Kenneth', 'Michelle', 'Kevin', 'Dorothy', 'Brian', 'Carol', 'George', 'Amanda', 'Edward', 'Melissa', 'Ronald', 'Deborah', 'Anthony', 'Stephanie');
    SET last_names = JSON_ARRAY('Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Gonzalez', 'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin', 'Lee', 'Perez', 'Thompson', 'White', 'Harris', 'Sanchez', 'Clark', 'Ramirez', 'Lewis', 'Robinson', 'Young', 'Allen', 'King', 'Wright', 'Scott', 'Torres', 'Peterson', 'Phillips', 'Campbell', 'Parker', 'Evans', 'Edwards', 'Collins', 'Reeves', 'Morris', 'Murphy', 'Rogers', 'Cook', 'Morgan', 'Peterson', 'Cooper');
    SET cities_array = JSON_ARRAY('New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio', 'San Diego', 'Dallas', 'San Jose', 'Austin', 'Jacksonville', 'Fort Worth', 'Columbus', 'Charlotte', 'San Francisco', 'Indianapolis', 'Seattle', 'Denver', 'Boston', 'Miami', 'Atlanta', 'New Orleans', 'Portland', 'Las Vegas', 'Memphis', 'Baltimore', 'Louisville', 'Milwaukee', 'Albuquerque', 'Tucson', 'Fresno', 'Sacramento', 'Long Beach', 'Kansas City', 'Mesa', 'Virginia Beach', 'Atlanta', 'New Orleans', 'Bakersfield', 'Tampa', 'Aurora', 'Anaheim', 'Santa Ana', 'St. Louis', 'Riverside', 'Corpus Christi');
    
    -- Loop to insert 10,000 rows
    WHILE i <= 10000 DO
        -- Generate random first and last name
        SET random_name = CONCAT(
            JSON_UNQUOTE(JSON_EXTRACT(first_names, CONCAT('$[', FLOOR(RAND() * 50), ']'))),
            ' ',
            JSON_UNQUOTE(JSON_EXTRACT(last_names, CONCAT('$[', FLOOR(RAND() * 50), ']')))
        );
        
        -- Generate random age between 18 and 80
        SET random_age = FLOOR(RAND() * 63) + 18;
        
        -- Generate random city
        SET random_city = JSON_UNQUOTE(JSON_EXTRACT(cities_array, CONCAT('$[', FLOOR(RAND() * 45), ']')));
        
        -- Generate random purchase amount between 10 and 9999.99
        SET random_amount = ROUND(RAND() * 9989.99 + 10, 2);
        
        -- Generate random date between 2020-01-01 and 2024-12-31
        SET random_date = DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 1826) DAY);
        
        -- Insert the random data
        INSERT INTO SalesData (Name, Age, City, PurchaseAmount, PurchaseDate)
        VALUES (random_name, random_age, random_city, random_amount, random_date);
        
        -- Increment counter
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- Call the procedure to insert 10,000 rows
CALL InsertRandomSalesData();

-- Optional: Drop the procedure after use (uncomment if desired)
-- DROP PROCEDURE InsertRandomSalesData;

-- Verify the data was inserted
SELECT COUNT(*) as TotalRows FROM SalesData;
SELECT * FROM SalesData LIMIT 10;
