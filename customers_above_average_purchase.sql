-- Query to find customers with purchases above average
SELECT 
    CustomerID,
    Name,
    City,
    Age,
    PurchaseAmount,
    PurchaseDate,
    ROUND(PurchaseAmount - (SELECT AVG(PurchaseAmount) FROM SalesData), 2) as AmountAboveAverage
FROM SalesData
WHERE PurchaseAmount > (SELECT AVG(PurchaseAmount) FROM SalesData)
ORDER BY PurchaseAmount DESC;
