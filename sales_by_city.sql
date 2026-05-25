-- Query to find total sales per city
SELECT 
    City,
    SUM(PurchaseAmount) as TotalSales,
    COUNT(*) as TransactionCount,
    AVG(PurchaseAmount) as AverageSaleAmount
FROM SalesData
GROUP BY City
ORDER BY TotalSales DESC;
