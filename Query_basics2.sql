# Group By Clause
/*
select column1,column2,....,agregate function(column  name)
FROM table_name
WHERE condition
GROUP BY column1,column2,....

*/

select productid,SUM(quantity) as totalquantitysold from orderdetails group by productid
order by totalquantitysold desc
;


-- Generate a report that shows the total sales of each product sold
select productid ,sum(finaltotal) as 'TOTAL-FINAL-AMOUNT' from orderdetails group by productid;

-- ------------------------------------------------------------

# Combing Aggregate functions

-- COUNT
SELECT CUSTOMERID, COUNT(ORDERID) AS 'NUMBER OF ORDERS'
FROM ORDERS
GROUP BY CUSTOMERID;

-- SUM
SELECT CUSTOMERID, SUM(TOTALPAID) AS 'TOTAL SALES'
FROM ORDERS
GROUP BY CUSTOMERID;

-- AVG
SELECT CUSTOMERID, AVG(TOTALPAID) AS 'AVERAGE SALES'
FROM ORDERS
GROUP BY CUSTOMERID;

-- MIN
SELECT CUSTOMERID, MIN(TOTALPAID) AS 'SMALLEST SALE',
		MAX(TOTALPAID) AS 'BIGGEST SALE'
FROM ORDERS
GROUP BY CUSTOMERID;

-- MAX
SELECT CUSTOMERID, MAX(TOTALPAID) AS 'BIGGEST SALE'
FROM ORDERS
GROUP BY CUSTOMERID;

-- Customer count with highest count in the city
select CITY,count(customerid) as 'Csustomer Count' from customers group by CITY;

-- Identify the top 3 products with the highest total sales volume
select productid,sum(quantity) as 'Total Qyantity',sum(finaltotal) as 'Total Volume' from orderdetails group by productid 
order by 'Total Volume' desc limit 3
;

-- -------------------------------------------------------------------------

# Grouping By Multiple Columns

/*
SELECT column1, column2,..., aggregate_function(column)
FROM table
GROUP BY column1, column2,...;
*/


SELECT COUNTRY, CITY, COUNT(CUSTOMERID) AS 'NUMBER OF CUSTOMERS'
FROM CUSTOMERS
GROUP BY COUNTRY, CITY
ORDER BY 'NUMBER OF CUSTOMERS' DESC;

-- ----------------------------------------------------------------












