CREATE DATABASE e_commerce;
USE e_commerce;

CREATE TABLE supplier (
  supp_id int,
  supp_name varchar(50) NOT NULL,
  supp_city varchar(50) NOT NULL,
  supp_phone varchar(50) NOT NULL,
  PRIMARY KEY (supp_id)
);

INSERT INTO supplier VALUES (1, 'Rajesh Retails', 'Delhi', 1234567890);
INSERT INTO supplier VALUES (2, 'Appario Ltd.', 'Mumbai', 2589631470);
INSERT INTO supplier VALUES (3, 'Kniome Products', 'Bangalore', 9785462315);
INSERT INTO supplier VALUES (4, 'Bansal Retails', 'Kochi', 8975463285);
INSERT INTO supplier VALUES (5, 'Mittal Ltd.', 'Lucknow', 7898456532);

CREATE TABLE customer (
  cus_id int,
  cus_name varchar(20) NOT NULL,
  cus_phone varchar(10) NOT NULL,
  cus_city varchar(30) NOT NULL,
  cus_gender CHAR,
  PRIMARY KEY (cus_id)
);

INSERT INTO customer VALUES(1, 'AAKASH', 9999999999, 'DELHI', 'M');
INSERT INTO customer VALUES(2, 'AMAN', 9785463215, 'NOIDA', 'M');
INSERT INTO customer VALUES(3, 'NEHA', 9999999999, 'MUMBAI', 'F');
INSERT INTO customer VALUES(4, 'MEGHA', 9994568399, 'KOLKATA', 'F');
INSERT INTO customer VALUES(5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');

CREATE TABLE category (
  cat_id int,
  cat_name varchar(20) NOT NULL,
  PRIMARY KEY (cat_id)
);

INSERT INTO category VALUES (1, 'BOOKS');
INSERT INTO category VALUES (2, 'GAMES');
INSERT INTO category VALUES (3, 'GROCERIES');
INSERT INTO category VALUES (4, 'ELECTRONICS');
INSERT INTO category VALUES (5, 'CLOTHES');

CREATE TABLE product (
  pro_id int,
  pro_name varchar(20) NOT NULL DEFAULT "Dummy",
  pro_desc varchar(60),
  cat_id int,
  PRIMARY KEY (pro_id),
  FOREIGN KEY (cat_id) REFERENCES category (cat_id)
);

INSERT INTO product VALUES (1, 'GTA', 'Windows 7 and above with i5
processor and 8GB RAM', 2);
INSERT INTO product VALUES (2, 'TSHIRT', 'SIZE-L with Black, 
Blue and White variations', 5);
INSERT INTO product VALUES (3, 'ROG LAPTOP', 'Windows 10 with 15inch 
screen, i7 processor, 1TB SSD', 4);
INSERT INTO product VALUES (4, 'OATS', 'Highly Nutritious from 
Nestle', 3);
INSERT INTO product VALUES (5, 'HARRY POTTER', 'Best Collection of
 all time by J.K Rowling', 1);
INSERT INTO product VALUES (6, 'MILK', '1L Toned MIlk', 3);
INSERT INTO product VALUES (7, 'Boat Earphones', '1.5Meter long Dolby
 Atmos', 4);
INSERT INTO product VALUES (8, 'Jeans', 'Stretchable Denim Jeans
 with various sizes and color', 5);
 INSERT INTO product VALUES (9, 'Project IGI', 'compatible with 
 windows 7 and above', 2);
 INSERT INTO product VALUES (10, 'Hoodie', 'Black GUCCI for 13 yrs
 and above', 5);
  INSERT INTO product VALUES (11, 'Rich Dad Poor Dad', 'Written by 
  RObert Kiyosaki', 1);
  INSERT INTO product VALUES (12, 'Train Your Brain', 'By Shireen 
  Stephen', 1);
  
  CREATE TABLE supplier_pricing (
  pricing_id int,
  pro_id int,
  supp_id int,
  supp_price int DEFAULT 0,
  PRIMARY KEY (pricing_id),
  FOREIGN KEY (pro_id) REFERENCES product (pro_id),
  FOREIGN KEY (supp_id) REFERENCES supplier (supp_id)
);

INSERT INTO supplier_pricing VALUES (1, 1, 2, 1500);
INSERT INTO supplier_pricing VALUES (2, 3, 5, 30000);
INSERT INTO supplier_pricing VALUES (3, 5, 1, 3000);
INSERT INTO supplier_pricing VALUES (4, 2, 3, 2500);
INSERT INTO supplier_pricing VALUES (5, 4, 1, 1000);
INSERT INTO supplier_pricing VALUES (6, 12, 2, 780);
INSERT INTO supplier_pricing VALUES (7, 12, 4, 789);
INSERT INTO supplier_pricing VALUES (8, 3, 1, 31000);
INSERT INTO supplier_pricing VALUES (9, 1, 5, 1450);
INSERT INTO supplier_pricing VALUES (10, 4, 2, 999);
INSERT INTO supplier_pricing VALUES (11, 7, 3, 549);
INSERT INTO supplier_pricing VALUES (12, 7, 4, 529);
INSERT INTO supplier_pricing VALUES (13, 6, 2, 105);
INSERT INTO supplier_pricing VALUES (14, 6, 1, 99);
INSERT INTO supplier_pricing VALUES (15, 2, 5, 2999);
INSERT INTO supplier_pricing VALUES (16, 5, 2, 2999);

  CREATE TABLE orders (
  ord_id int,
  ord_amount int NOT NULL,
  ord_date DATE NOT NULL,
  cus_id int,
  pricing_id int,
  PRIMARY KEY (ord_id),
  FOREIGN KEY (cus_id) REFERENCES customer (cus_id),
  FOREIGN KEY (pricing_id) REFERENCES supplier_pricing (pricing_id)
);

INSERT INTO orders VALUES (101, 1500, '2021-10-06', 2, 1);
INSERT INTO orders VALUES (102, 1000, '2021-10-12', 3, 5);
INSERT INTO orders VALUES (103, 30000, '2021-09-16', 5, 2);
INSERT INTO orders VALUES (104, 1500, '2021-10-05', 1, 1);
INSERT INTO orders VALUES (105, 3000, '2021-08-16', 4, 3);
INSERT INTO orders VALUES (106, 1450, '2021-08-18', 1, 9);
INSERT INTO orders VALUES (107, 789, '2021-09-01', 3, 7);
INSERT INTO orders VALUES (108, 780, '2021-09-07', 5, 6);
INSERT INTO orders VALUES (109, 3000, '2021-00-10', 5, 3);
INSERT INTO orders VALUES (110, 2500, '2021-09-10', 2, 4);
INSERT INTO orders VALUES (111, 1000, '2021-09-15', 4, 5);
INSERT INTO orders VALUES (112, 789, '2021-09-16', 4, 7);
INSERT INTO orders VALUES (113, 31000, '2021-09-16', 1, 8);
INSERT INTO orders VALUES (114, 1000, '2021-09-16', 3, 5);
INSERT INTO orders VALUES (115, 3000, '2021-09-16', 5, 3);
INSERT INTO orders VALUES (116, 99, '2021-09-17', 2, 14);

  CREATE TABLE rating (
  rat_id int,
  ord_id int,
  rat_ratstars int NOT NULL,
  PRIMARY KEY (rat_id),
  FOREIGN KEY (ord_id) REFERENCES orders (ord_id)
);

INSERT INTO rating VALUES (1, 101, 4);
INSERT INTO rating VALUES (2, 102, 3);
INSERT INTO rating VALUES (3, 103, 1);
INSERT INTO rating VALUES (4, 104, 2);
INSERT INTO rating VALUES (5, 105, 4);
INSERT INTO rating VALUES (6, 106, 3);
INSERT INTO rating VALUES (7, 107, 4);
INSERT INTO rating VALUES (8, 108, 4);
INSERT INTO rating VALUES (9, 109, 3);
INSERT INTO rating VALUES (10, 110, 5);
INSERT INTO rating VALUES (11, 111, 3);
INSERT INTO rating VALUES (12, 112, 4);
INSERT INTO rating VALUES (13, 113, 2);
INSERT INTO rating VALUES (14, 114, 1);
INSERT INTO rating VALUES (15, 115, 1);
INSERT INTO rating VALUES (16, 116, 0);

-- QUERY 1

SELECT count(customer.cus_gender) 
FROM customer
JOIN orders on customer.cus_id = orders.cus_id
AND ord_amount >= 3000
GROUP BY customer.cus_gender;

-- QUERY 2

SELECT o.cus_id, pro.pro_name, o.ord_amount, o.ord_date
FROM orders o
JOIN supplier_pricing sp
ON o.pricing_id = sp.pricing_id
JOIN product pro
ON sp.pro_id = pro.pro_id
WHERE o.cus_id = 2;

-- QUERY 3

SELECT *
FROM supplier WHERE supp_id
IN (SELECT supp_id
FROM supplier_pricing
GROUP BY (supp_id)
HAVING count(supp_id)>1);

-- QUERY 4

SELECT ca.cat_id, MIN(t2.supp_price)
AS price
FROM category ca
JOIN (SELECT * FROM product pr
JOIN (SELECT pro_id AS id,
supp_price FROM supplier_pricing
GROUP BY id
HAVING MIN(supp_price)) AS t1
ON t1.id = pr.pro_id)
AS t2 ON
t2.cat_id = ca.cat_id
GROUP BY ca.cat_id;

-- QUERY 5

SELECT *
FROM orders AS o
JOIN supplier_pricing AS sp
ON sp.pricing_id = o.pricing_id
AND ord_date >= '2021-10-05';

-- QUERY 6

SELECT cus_name, cus_gender
FROM customer
WHERE cus_name LIKE 'a%'
OR cus_name LIKE '%a';

-- QUERY 7

DELIMITER &&
CREATE PROCEDURE proc()
BEGIN
SELECT report.supp_id, report.supp_name, report.average,
CASE
WHEN report.average = 5 THEN 'Excellent Service'
WHEN report.average > 4 THEN 'Good Service'
WHEN report.average > 2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service 
FROM (SELECT final.supp_id, supplier.supp_name, final.average 
FROM (SELECT test2.supp_id, SUM(test2.rat_ratstars)/COUNT(test2.rat_ratstars) AS average 
FROM (SELECT supplier_pricing.supp_id, test.ord_id, test.rat_ratstars
FROM supplier_pricing JOIN (SELECT orders.pricing_id, rating.ord_id, rating.rat_ratstars
FROM orders JOIN rating ON rating.ord_id = orders.ord_id)
AS test on test.pricing_id = supplier_pricing.pricing_id)
AS test2 GROUP BY supplier_pricing.supp_id)
AS final JOIN supplier
WHERE final.supp_id = supplier.supp_id)
AS report;
END &&
DELIMITER ;

call proc();