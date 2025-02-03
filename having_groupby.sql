

# HAVING CLAUSE

/*
select column1,column2,aggregate_function(column2)
FROM table
Group By column1
HAVING condition

*/
SELECT COUNTRY, CITY, COUNT(CUSTOMERID) AS 'NUMBER OF CUSTOMERS'
FROM CUSTOMERS
GROUP BY COUNTRY, CITY
HAVING COUNT(customerid)>1;


-- Premium Customers: Identify all the customers who hace placed orders with total values over $1000.
# OUTPUT: CUSTOMERID,TOTAL ORDER VALUE
SELECT CUSTOMERID,SUM(TOTALPAID) AS TOTALORDERVALUE
FROM ORDERS
GROUP BY CUSTOMERID
HAVING TOTALORDERVALUE  > 1000;

-- Frequent Shoppers: Identify total number of customers who have placed more than 5 orders
# OUTPUT: CUSTOMERID,TOTALORDERS

SELECT CUSTOMERID,COUNT(ORDERID) AS TOTALORDERS
 FROM ORDERS
 GROUP BY CUSTOMERID
 HAVING TOTALORDERS > 2;
 
 
 -- Customer Spending Habits: Find the average total order cost for each customer
 # OUTPUT : CUSTOMERID,AVERAGEAMOUNT
 
 SELECT * FROM ORDERS;
 
 SELECT CUSTOMERID,AVG(TOTALPAID)
 FROM ORDERS
 GROUP BY CUSTOMERID;

-- --------------------------------------------------------
# NESTED AGGREGATION IN GROUPING:

/*
SELECT column1, aggregate_function(column2)
FROM table1
GROUP BY column1
HAVING aggregate_function(column2) > 
	(SELECT aggregate_function(column3) 
	FROM table_2);
*/

SELECT AVG(QUANTITY)
FROM ORDERDETAILS;

SELECT PRODUCTID, SUM(QUANTITY) AS TOTALQUANTITY
FROM ORDERDETAILS
GROUP BY PRODUCTID
HAVING TOTALQUANTITY > (
	SELECT AVG(QUANTITY)
	FROM ORDERDETAILS
    );






