CREATE TABLE retail_data (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice FLOAT,
    CustomerID INT,
    Country VARCHAR(50)
);
INSERT INTO retail_data 
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country)
VALUES
('10001','85123A','WHITE HANGING HEART T-LIGHT HOLDER',6,'2023-01-05 10:15:00',2.55,17850,'United Kingdom'),
('10001','71053','WHITE METAL LANTERN',6,'2023-01-05 10:15:00',3.39,17850,'United Kingdom'),
('10002','84406B','CREAM CUPID HEARTS COAT HANGER',8,'2023-01-06 11:20:00',2.75,13047,'France'),
('10003','84029G','KNITTED UNION FLAG HOT WATER BOTTLE',6,'2023-01-07 09:12:00',3.39,12583,'Germany'),
('10004','22752','SET 7 BABUSHKA NESTING BOXES',2,'2023-01-08 14:05:00',7.65,13748,'Spain'),
('10005','21730','GLASS STAR FROSTED T-LIGHT HOLDER',12,'2023-01-09 16:45:00',4.25,15100,'United Kingdom'),
('10006','22633','HAND WARMER UNION JACK',10,'2023-02-01 12:30:00',1.85,17850,'United Kingdom'),
('10007','21232','STRAWBERRY CERAMIC TRINKET BOX',4,'2023-02-03 13:50:00',1.25,13047,'France'),
('10008','84879','ASSORTED COLOUR BIRD ORNAMENT',16,'2023-02-05 09:40:00',1.69,14688,'Netherlands'),
('10009','22423','REGENCY CAKESTAND 3 TIER',1,'2023-02-10 15:20:00',12.75,12583,'Germany'),
('10010','85099B','JUMBO BAG RED RETROSPOT',20,'2023-03-01 10:10:00',1.65,13748,'Spain'),
('10011','47566','PARTY BUNTING',5,'2023-03-05 11:45:00',4.95,15100,'United Kingdom'),
('10012','20725','LUNCH BAG RED RETROSPOT',15,'2023-03-08 17:30:00',1.65,14688,'Netherlands'),
('10013','23203','JUMBO BAG PINK POLKADOT',10,'2023-03-15 14:00:00',1.95,17850,'United Kingdom'),
('10014','22386','JUMBO BAG SPACEBOY DESIGN',8,'2023-04-01 09:25:00',1.95,13047,'France'),
('10015','22492','MINI PAINT SET VINTAGE',6,'2023-04-04 16:10:00',0.65,15100,'United Kingdom'),
('10016','22960','JAM MAKING SET WITH JARS',3,'2023-04-10 10:50:00',4.25,12583,'Germany'),
('10017','22659','LUNCH BOX I LOVE LONDON',12,'2023-04-12 12:05:00',1.95,13748,'Spain'),
('10018','22457','NATURAL SLATE HEART CHALKBOARD',5,'2023-05-02 13:35:00',2.95,17850,'United Kingdom'),
('10019','22355','CHARLOTTE BAG SUKI DESIGN',14,'2023-05-08 15:45:00',0.85,14688,'Netherlands');

-- Total Revenue


SELECT SUM(Quantity * unitprice) AS Total_revenue
FROM retail_data;

-- Monthly Revenue Trend 
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    SUM(Quantity * UnitPrice) AS Monthly_Revenue
FROM retail_data
GROUP BY Month
ORDER BY Month;

-- Top Performing Products

SELECT 
DESCRIPTION,
SUM(QUANTITY)  AS Total_Units_Sold,
SUM(QUANTITY*UNITPRICE) AS Total_revenue
FROM retail_data
GROUP BY DESCRIPTION
ORDER BY Total_revenue DESC;


-- Country Wise Sales

SELECT 
COUNTRY,
SUM(quantity *unitprice) AS Revenue
FROM retail_data
GROUP BY Country
ORDER BY Revenue DESC;

-- RFM Customer Segmentation (Very Important 🔥)
-- Create:
-- Recency → Last purchase date
-- Frequency → Number of invoices
-- Monetary → Total spending

SELECT 
CustomerId,
Max(InvoiceDate) AS LastPurchase,
Count(DISTINCT InvoiceNo) AS No_of_invoices ,
SUM( Quantity * UnitPrice) As Total_spending
FROM Retail_data
GROUP BY  CustomerID;




