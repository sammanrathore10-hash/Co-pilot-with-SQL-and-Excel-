-- Query to find top 5 cities by revenue
SELECT 
    City,
    SUM(PurchaseAmount) as TotalRevenue,
    COUNT(*) as TransactionCount,
    AVG(PurchaseAmount) as AverageSaleAmount,
    MAX(PurchaseAmount) as MaxSaleAmount,
    MIN(PurchaseAmount) as MinSaleAmount
FROM SalesData
GROUP BY City
ORDER BY TotalRevenue DESC
LIMIT 5;
