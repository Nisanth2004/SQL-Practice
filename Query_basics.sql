USE PlanetaryGoods;
select database();

select * from customers;

select FirstName,LastName from customers;


select FirstName,LastName,Country from customers where country='USA';

-- ---------------------------------------------------

# DISTINCT CLAUSE:
select lastname,firstname from customers;

-- filter the duplicate values
select distinct city from customers;

select distinct country,state from customers; -- combination of unique data two column


# Retrieve all unique  product categories and sub categoires from the products table
select * from products;

select distinct Category,subCategory from products;

-- ---------------------------------------------------

# ALIAS CLAUSE

select firstname as name from customers;

select concat(firstname,' ',lastname) as "FULL NAME" from customers;


# Write a query retrieve the customers's names,their email and theie demographic information
select * from customers;
select EMAIl as EMAIL_ADDRESS,concat(firstname,' ',lastname) as "Full Name",concat(address,',',city,',',state,',',country) as "FULL_ADDRESS" from customers;



-- ---------------------------------------------------

# Mathematical Expressions

select * from products;

select ProductID,PRICE*INSTOCKQUANTITY AS TOTAL_WORTH from products;



-- ---------------------------------------------------

# Null Values
select Firstname,lastname,ifnull(address,'ADDRESS NOT PROVIDED') as ADDRESS from customers;

# same as ifnull()
select Firstname,lastname,COALESCE(address,'ADDRESS NOT PROVIDED') as ADDRESS from customers;

select EMAIl as EMAIL_ADDRESS,concat(firstname,' ',lastname) as "Full Name",concat(COALESCE(address,''),',',city,',',state,',',country) as "FULL_ADDRESS" from customers;


-- -------------------------------------------------

# Storing results with ORDER_BY Clause
select * from orders;
select * from orders order by OrderDate;

select * from orders order by TOTALPA DESC;


# Multiple colums sorrting
-- string can be sorted using alphabetcially
select * from orders order by shippingstatus,orderdate;

select * from products where supplierid=1 order by category,productname;

-- ---------------------------------------------

# LIMIT CLAUSE

# Recent 10 orders
select * from orders order by orderdate desc limit 10;

# Recent 10 orders
# offset - skip the first 5 results
select * from orders order by orderdate desc limit 10 offset 5;



# Top 5 expesnive item in the store
select * from products order by price desc limit 5;

-- ------------------------------------------------------


# WHERE Clause
select database();
# Arithmetic Operators
# products with 10% discount
select productname, price, price * 0.1 as discount from products;


select * from products where price+10 >10;


select * from products where price-10 >10;

# The products which had future revenue had if all the poducts sold out more than 1000
select * from products where price * InStockQuantity >1000;

select * from products where price/4 >10;



# Problem statement: Determine the orders where the tax amount is more than 5%  of the final total
select * from OrderDetails;

select orderid,tax,finaltotal from orderdetails where tax > finaltotal*0.08 ;
-- -------------------------------------------------------------

# Comparison Operators

-- Equal To()
select  * from products where price=19.99;

-- Not equal to(<> or !=)
select  * from products where price<>19.99;

-- less than (<)
select  * from products where price<50;

-- greater than (<)
select  * from products where price>50;

-- less than or equal to(<=)
select  * from products where price<=9.99;

-- greater than or equal to(<=)
select  * from products where price>=49.99;

-- ----------------------------------------------

# AND Operator
-- condition1 AND condition2
select * from customers where (country='USA') AND (CITY='New York City') AND (firstname='john');

# how many products in the 'Accessories' category are priced under $30?
select * from products;

select * from products where category='Accessories' AND price<30;

-- ----------------------------------------------

# OR Operator
-- condition1 OR condition2

 # USA OR CANADA
 select * from customers where (city='Chicago') OR (country='USA');

# any proucts in the accessories or optics categories where the quantity on hand  is less than 20

select * from products where ((category='Accessories') OR (category='Optics')) AND (Instockquantity<20);
-- ----------------------------------------------

# NOT Operator
select * from customers  where NOT country='USA';
-- ----------------------------------------------

# Alternative to Multiple OR's

select * from 
customers 
where country='USA'
      OR country='UK'
      OR country='CANADA';


select * from customers where country IN ('USA','CANADA','UK');
-- ----------------------------------------------

# Between Operators

select * from products where price between 5 AND 19.99; # including these values also

select * from orders where orderdate between '2023-01-01' AND '2023-03-31';

# ALl products in 'Home Decor' priced between $20 and $100 need to be updated
select * from products;

select * from products where (category='Home Decor') AND Price between 20 AND 100;
-- ----------------------------------------------

# LIKE operator
-- searching for a pattern

-- % (Percent Sign): Represents zero,one or multiple characters
select * from products where productname like 'Star%';


-- _ (underscore): Represents a single character
select * from customers where firstname like '_o%'; -- second letter 'O'


select * from products where productname like '%PRO';

-- exact 5 letters
select * from customers where firstname like '_____';

# start with A and endwith O
select * from customers where firstname like 'J%E';

# prodcut name contains '5%'
select * from products where productname like '%5!%%' escape '!';

-- ------------------------------------------------------------

# WHERE Clause with NULL values
select * from customers where address is null;


select COUNT(*) from customers where address is not null;


select COUNT(*) from products where description is not null;

-- -------------------------------------------------------

# Nested Where Clause

-- AND OR

select * from products where  category='OPTICS' and price>10 OR subcategory='POSTERS';

select * from products where  (category='OPTICS' and price>10) OR subcategory='POSTERS';


select * from products where  category='OPTICS' and  (price>10 OR subcategory='POSTERS');










