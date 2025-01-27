DROP DATABASE IF EXISTS `PlanetaryGoods`;
CREATE DATABASE `PlanetaryGoods`; 
USE `PlanetaryGoods`;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    RegistrationDate DATE
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    SubCategory VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2),
    InStockQuantity INT,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    PaymentID INT,
    ShippingStatus VARCHAR(100),
    TotalPaid DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
Amount INT,
Tax INT,
Shipping INT,
FinalTotal INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



INSERT INTO Customers (FirstName, LastName, ContactNumber, Email, Address, City, State, Country, RegistrationDate) VALUES 
('John', 'Doe', '1234567890', 'john.doe@example.com', '123 Main Street', 'New York City', 'NY', 'USA', '2023-01-01'),
('Jane', 'Smith', '0987654321', 'jane.smith@example.com', '456 Maple Avenue', 'Los Angeles', 'CA', 'USA', '2023-01-02'),
('Michael', 'Johnson', '9876543210', 'michael.johnson@example.com', '789 Oak Road', 'Chicago', 'IL', 'USA', '2023-01-03'),
('Emily', 'Williams', '2345678901', 'emily.williams@example.com', '321 Elm Lane', 'Houston', 'TX', 'USA', '2023-01-04'),
('Robert', 'Jones', '3456789012', 'robert.jones@example.com', '654 Birch Street', 'San Francisco', 'CA', 'USA', '2023-01-05'),
('Sophia', 'Brown', '4567890123', 'sophia.brown@example.com', '987 Cedar Avenue', 'Seattle', 'WA', 'USA', '2023-01-06'),
('William', 'Miller', '5678901234', 'william.miller@example.com', '789 Pine Boulevard', 'Miami', 'FL', 'USA', '2023-01-07'),
('Olivia', 'Davis', '6789012345', 'olivia.davis@example.com', '543 Willow Street', 'Boston', 'MA', 'USA', '2023-01-08'),
('James', 'Garcia', '7890123456', 'james.garcia@example.com', '876 Oakwood Drive', 'Dallas', 'TX', 'USA', '2023-01-09'),
('Ava', 'Rodriguez', '8901234567', 'ava.rodriguez@example.com', '321 Maplewood Lane', 'Phoenix', 'AZ', 'USA', '2023-01-10'),
('Alexander', 'Martinez', '9012345678', 'alexander.martinez@example.com', '654 Elmwood Road', 'San Diego', 'CA', 'USA', '2023-01-11'),
('Isabella', 'Hernandez', '0123456789', 'isabella.hernandez@example.com', '987 Birchwood Avenue', 'Philadelphia', 'PA', 'USA', '2023-01-12'),
('Ethan', 'Lopez', '1234509876', 'ethan.lopez@example.com', '123 Cedarwood Street', 'Austin', 'TX', 'USA', '2023-01-13'),
('Mia', 'Gonzalez', '2345610987', 'mia.gonzalez@example.com', '456 Willowwood Lane', 'Denver', 'CO', 'USA', '2023-01-14'),
('Daniel', 'Wilson', '3456129087', 'daniel.wilson@example.com', '789 Elmwood Drive', 'Washington D.C.', 'DC', 'USA', '2023-01-15'),
('Abigail', 'Anderson', '4561230987', 'abigail.anderson@example.com', '543 Pine Street', 'Atlanta', 'GA', 'USA', '2023-01-16'),
('Emily', 'Taylor', '5678912034', 'emily.taylor@example.com', '876 Cedarwood Road', 'Chicago', 'IL', 'USA', '2023-01-17'),
('Harper', 'Thomas', '6789123045', 'harper.thomas@example.com', '321 Oakwood Avenue', 'San Francisco', 'CA', 'USA', '2023-01-18'),
('Madison', 'Moore', '7891234506', 'madison.moore@example.com', '654 Maplewood Lane', 'New York City', 'NY', 'USA', '2023-01-19'),
('Scarlett', 'Jackson', '8912345670', 'scarlett.jackson@example.com', '987 Pine Street', 'Los Angeles', 'CA', 'USA', '2023-01-20');

INSERT INTO Customers (FirstName, LastName, ContactNumber, Email, City, State, Country, RegistrationDate) 
VALUES 
('NullAddress', 'Customer', '1000000000', 'nulladdress.customer@example.com', 'CityName', 'StateName', 'USA', '2023-02-01');

INSERT INTO Customers (FirstName, LastName, ContactNumber, Email, Address, City, State, Country, RegistrationDate) 
VALUES 
('USCustomer', 'USLastName', '2000000000', 'uscustomer@example.com', 'US Address', 'US City', 'US State', 'USA', '2023-02-02'),
('CanadaCustomer', 'CanadaLastName', '3000000000', 'canadacustomer@example.com', 'Canada Address', 'Canada City', 'Canada State', 'Canada', '2023-02-03'),
('MexicoCustomer', 'MexicoLastName', '4000000000', 'mexicocustomer@example.com', 'Mexico Address', 'Mexico City', 'Mexico State', 'Mexico', '2023-02-04');





INSERT INTO Suppliers (SupplierName, ContactNumber, Email, Address) VALUES 
('Space Supplies Ltd.', '1111111111', 'supply@space.com', 'Asteroid Avenue 23'),
('Galactic Goods Inc.', '2222222222', 'goods@galactic.com', 'Comet Close 45'),
('Orion Outfitters', '3333333333', 'outfit@orion.com', 'Stellar Street 56'),
('Celestial Commodities', '4444444444', 'commodity@celestial.com', 'Pluto Place 67'),
('Martian Merchants', '5555555555', 'merchant@martian.com', 'Mercury Mews 78');



INSERT INTO Products (ProductName, Category, SubCategory, Description, Price, InStockQuantity, SupplierID) VALUES
('Galaxy Print T-Shirt', 'Apparel', 'Clothing', 'Stylish t-shirt featuring a colorful galaxy print.', 19.99, 100, 1),
('Solar System Poster', 'Art', 'Posters', 'Educational poster depicting the solar system.', 14.99, 50, 2),
('Telescope - Celestial View', 'Optics', 'Telescopes', 'High-quality telescope for observing celestial objects.', 299.99, 10, 1),
('Star Map Blanket', 'Home Decor', 'Blankets', 'Cozy blanket with a star map design.', 29.99, 75, 3),
('Astronomy for Beginners Book', 'Books', 'Educational', 'A beginner-friendly guide to astronomy.', 12.50, 30, 2),
('Constellation Wall Decal', 'Home Decor', 'Decals', 'Peel-and-stick decal featuring famous constellations.', 9.99, 100, 4),
('Moon Phase Calendar', 'Art', 'Calendars', 'Wall calendar showcasing the phases of the moon.', 7.99, 60, 1),
('Space Explorer Backpack', 'Accessories', 'Bags', 'Stylish backpack for aspiring space explorers.', 34.99, 25, 3),
('Galaxy Nebula Art Print', 'Art', 'Prints', 'Framed art print featuring a mesmerizing galaxy nebula.', 29.50, 40, 2),
('Starry Night Lamp', 'Home Decor', 'Lamps', 'Night lamp with a starry night projection.', 22.99, 80, 4),
('Planetarium Projection Globe', 'Accessories', 'Globes', 'Interactive globe with planetarium projection.', 49.99, 15, 1),
('Space Adventure Puzzle', 'Toys', 'Puzzles', '1000-piece puzzle depicting a space adventure scene.', 17.95, 20, 2),
('Astronaut Figurine', 'Toys', 'Figurines', 'Collectible astronaut figurine for space enthusiasts.', 9.50, 70, 3),
('Galactic Wall Clock', 'Home Decor', 'Clocks', 'Stylish wall clock with a galactic design.', 24.99, 50, 1),
('Celestial Playing Cards', 'Toys', 'Cards', 'Playing cards featuring celestial illustrations.', 6.99, 100, 4),
('Space Travel Poster Set', 'Art', 'Posters', 'Set of vintage-style posters showcasing space travel destinations.', 34.95, 30, 2),
('Astronomy Telescope Model', 'Toys', 'Models', 'Miniature model of a classic astronomy telescope.', 12.99, 65, 3),
('Galaxy Enamel Pin Set', 'Accessories', 'Pins', 'Set of enamel pins with galaxy and space-themed designs.', 8.50, 90, 1),
('Cosmic Mouse Pad', 'Accessories', 'Mouse Pads', 'Mouse pad featuring a cosmic artwork.', 11.25, 120, 2),
('Space Shuttle Model Kit', 'Toys', 'Models', 'Build-it-yourself model kit of a space shuttle.', 19.95, 40, 3),
('Solar System Bracelet', 'Accessories', 'Jewelry', 'Elegant bracelet featuring planets of the solar system.', 17.50, 85, 4),
('Astronomy Star Chart', 'Art', 'Charts', 'Detailed star chart for astronomy enthusiasts.', 13.99, 55, 1),
('Rocket Launch Toy', 'Toys', 'Rockets', 'Interactive rocket launch toy with sound effects.', 28.75, 30, 2),
('Space Explorer Water Bottle', 'Accessories', 'Bottles', 'Reusable water bottle for space explorers on the go.', 15.99, 100, 3),
('Galaxy Washi Tape Set', 'Art', 'Craft Supplies', 'Set of washi tapes with galaxy-themed patterns.', 6.50, 120, 4),
('Astronomy Coloring Book', 'Books', 'Activity Books', 'Coloring book featuring astronomy illustrations.', 8.95, 50, 1),
('Space Shuttle Wall Decal', 'Home Decor', 'Decals', 'Large wall decal of a space shuttle in action.', 18.99, 40, 2),
('Moon Phase Earrings', 'Accessories', 'Jewelry', 'Elegant earrings inspired by the phases of the moon.', 14.50, 80, 3),
('Space Exploration Puzzle', 'Toys', 'Puzzles', '500-piece puzzle showcasing space exploration scenes.', 13.75, 35, 4),
('Astronaut Space Pen', 'Accessories', 'Pens', 'Space pen designed for writing in zero gravity.', 9.25, 95, 1);



INSERT INTO `Orders` (`OrderID`, `CustomerID`, `OrderDate`, `PaymentID`, `ShippingStatus`, `TotalPaid`) 
VALUES (1,1,'2023-02-01',3851,'Shipped',719.00),
(2,1,'2023-03-05',8305,'Pending',1086.00),(3,2,'2023-02-02',472,'Pending',334.00),(4,2,'2023-04-15',3463,'Pending',202.00),(5,3,'2023-02-03',4270,'Shipped',958.00),(6,3,'2023-03-20',8109,'Pending',1056.00),(7,4,'2023-02-04',3472,'Shipped',396.00),(8,4,'2023-05-02',8811,'Shipped',1031.00),(9,5,'2023-02-05',1129,'Shipped',609.00),(10,5,'2023-03-10',2387,'Shipped',707.00),(11,6,'2023-02-06',432,'Pending',937.00),(12,6,'2023-04-01',84,'Shipped',717.00),(13,7,'2023-02-07',5025,'Shipped',890.00),(14,7,'2023-03-25',9752,'Shipped',692.00),(15,8,'2023-02-08',4525,'Pending',163.00),(16,8,'2023-05-10',8662,'Pending',201.00),(17,9,'2023-02-09',859,'Pending',470.00),(18,9,'2023-04-05',4753,'Pending',1000.00),(19,10,'2023-02-10',7046,'Shipped',101.00),(20,10,'2023-03-15',5402,'Shipped',955.00),(21,11,'2023-02-11',1904,'Pending',461.00),(22,11,'2023-04-18',6467,'Pending',908.00),(23,12,'2023-02-12',5947,'Shipped',1051.00),(24,12,'2023-03-22',1178,'Shipped',412.00),(25,13,'2023-02-13',3644,'Shipped',425.00),(26,13,'2023-04-02',9746,'Shipped',665.00),(27,14,'2023-02-14',1327,'Shipped',539.00),(28,14,'2023-05-05',2944,'Pending',985.00),(29,15,'2023-02-15',9667,'Pending',1084.00),(30,15,'2023-04-10',3928,'Pending',969.00),(31,16,'2023-02-16',3205,'Shipped',101.00),(32,16,'2023-03-18',314,'Pending',762.00),(33,17,'2023-02-17',8588,'Pending',1056.00),(34,17,'2023-04-20',8613,'Pending',705.00),(35,18,'2023-02-18',7139,'Shipped',724.00),(36,18,'2023-03-24',8614,'Pending',688.00),(37,19,'2023-02-19',6386,'Pending',322.00),(38,19,'2023-04-05',8301,'Pending',1023.00),(39,20,'2023-02-20',1672,'Pending',931.00),(40,20,'2023-03-12',9567,'Pending',679.00),(41,1,'2023-02-21',287,'Pending',1034.00),(42,2,'2023-02-22',4600,'Pending',202.00),(43,3,'2023-02-23',251,'Shipped',107.00),(44,4,'2023-02-24',5884,'Shipped',929.00),(45,5,'2023-02-25',3923,'Pending',282.00),(46,6,'2023-02-26',4987,'Shipped',328.00),(47,7,'2023-02-27',3061,'Shipped',411.00),(48,8,'2023-02-28',197,'Pending',860.00),(49,9,'2023-03-01',3106,'Pending',526.00),(50,10,'2023-03-02',3161,'Pending',660.00);
INSERT INTO `OrderDetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `Amount`, `Tax`, `Shipping`, `FinalTotal`) VALUES (1,1,3,2,100,10,10,120),(2,1,8,1,50,5,10,65),(3,2,12,3,150,15,10,175),(4,2,16,1,50,5,10,65),(5,3,1,1,50,5,10,65),(6,3,4,2,100,10,10,120),(7,4,7,1,50,5,10,65),(8,4,11,1,50,5,10,65),(9,5,5,3,150,15,10,175),(10,5,13,1,50,5,10,65),(11,6,9,2,100,10,10,120),(12,6,10,1,50,5,10,65),(13,7,2,1,50,5,10,65),(14,7,6,2,100,10,10,120),(15,8,14,1,50,5,10,65),(16,8,15,1,50,5,10,65),(17,9,17,2,100,10,10,120),(18,9,18,1,50,5,10,65),(19,10,19,3,150,15,10,175),(20,10,20,1,50,5,10,65),(21,11,3,1,50,5,10,65),(22,11,9,2,100,10,10,120),(23,12,1,1,50,5,10,65),(24,12,14,1,50,5,10,65),(25,13,8,1,50,5,10,65),(26,13,10,1,50,5,10,65),(27,14,6,2,100,10,10,120),(28,14,11,1,50,5,10,65),(29,15,12,1,50,5,10,65),(30,15,13,1,50,5,10,65),(31,16,2,1,50,5,10,65),(32,16,5,2,100,10,10,120),(33,17,7,1,50,5,10,65),(34,17,9,1,50,5,10,65),(35,18,16,3,150,15,10,175),(36,18,18,1,50,5,10,65),(37,19,4,1,50,5,10,65),(38,19,10,1,50,5,10,65),(39,20,1,2,100,10,10,120),(40,20,17,1,50,5,10,65),(41,21,3,1,50,5,10,65),(42,21,8,1,50,5,10,65),(43,22,12,2,100,10,10,120),(44,22,15,1,50,5,10,65),(45,23,5,1,50,5,10,65),(46,23,6,2,100,10,10,120),(47,24,14,1,50,5,10,65),(48,24,19,1,50,5,10,65),(49,25,7,2,100,10,10,120),(50,25,13,1,50,5,10,65),(51,26,9,1,50,5,10,65),(52,26,20,1,50,5,10,65),(53,27,2,1,50,5,10,65),(54,27,18,2,100,10,10,120),(55,28,11,1,50,5,10,65),(56,28,16,1,50,5,10,65),(57,29,1,2,100,10,10,120),(58,29,12,1,50,5,10,65),(59,30,8,1,50,5,10,65),(60,30,14,2,100,10,10,120),(61,31,5,1,50,5,10,65),(62,31,17,1,50,5,10,65),(63,32,3,1,50,5,10,65),(64,32,9,1,50,5,10,65),(65,33,4,1,50,5,10,65),(66,33,15,1,50,5,10,65),(67,34,7,2,100,10,10,120),(68,34,19,1,50,5,10,65),(69,35,16,1,50,5,10,65),(70,35,18,1,50,5,10,65),(71,36,1,2,100,10,10,120),(72,36,6,1,50,5,10,65),(73,37,14,1,50,5,10,65),(74,37,13,1,50,5,10,65),(75,38,2,1,50,5,10,65),(76,38,10,2,100,10,10,120),(77,39,11,1,50,5,10,65),(78,39,20,1,50,5,10,65),(79,40,12,1,50,5,10,65),(80,40,17,1,50,5,10,65),(81,41,3,1,50,5,10,65),(82,41,15,1,50,5,10,65),(83,42,5,1,50,5,10,65),(84,42,9,1,50,5,10,65),(85,43,8,1,50,5,10,65),(86,43,14,1,50,5,10,65),(87,44,7,1,50,5,10,65),(88,44,18,1,50,5,10,65),(89,45,16,2,100,10,10,120),(90,45,19,1,50,5,10,65),(91,46,1,1,50,5,10,65),(92,46,6,1,50,5,10,65),(93,47,2,1,50,5,10,65),(94,47,10,1,50,5,10,65),(95,48,11,1,50,5,10,65),(96,48,13,1,50,5,10,65),(97,49,12,1,50,5,10,65),(98,49,20,1,50,5,10,65),(99,50,3,1,50,5,10,65),(100,50,15,1,50,5,10,65);



