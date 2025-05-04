CREATE DATABASE inventory_db;
USE inventory_db;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2));

INSERT INTO products VALUES
(1, 'Product 1', 'Category 1', 11.5),
(2, 'Product 2', 'Category 2', 13.0),
(3, 'Product 3', 'Category 3', 14.5),
(4, 'Product 4', 'Category 4', 16.0),
(5, 'Product 5', 'Category 0', 17.5),
(6, 'Product 6', 'Category 1', 19.0),
(7, 'Product 7', 'Category 2', 20.5),
(8, 'Product 8', 'Category 3', 22.0),
(9, 'Product 9', 'Category 4', 23.5),
(10, 'Product 10', 'Category 0', 25.0),
(11, 'Product 11', 'Category 1', 26.5),
(12, 'Product 12', 'Category 2', 28.0),
(13, 'Product 13', 'Category 3', 29.5),
(14, 'Product 14', 'Category 4', 31.0),
(15, 'Product 15', 'Category 0', 32.5),
(16, 'Product 16', 'Category 1', 34.0),
(17, 'Product 17', 'Category 2', 35.5),
(18, 'Product 18', 'Category 3', 37.0),
(19, 'Product 19', 'Category 4', 38.5),
(20, 'Product 20', 'Category 0', 40.0);

select * from products;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_info VARCHAR(150));

INSERT INTO suppliers VALUES
(101, 'Supplier 1', 'contact1@supplier.com'),
(102, 'Supplier 2', 'contact2@supplier.com'),
(103, 'Supplier 3', 'contact3@supplier.com'),
(104, 'Supplier 4', 'contact4@supplier.com'),
(105, 'Supplier 5', 'contact5@supplier.com'); 
select * from suppliers;

CREATE TABLE stock_levels (
    product_id INT,
    quantity INT,
    last_updated DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id));

INSERT INTO stock_levels VALUES
(1, 11, '2025-04-11'),
(2, 12, '2025-04-12'),
(3, 13, '2025-04-13'),
(4, 14, '2025-04-14'),
(5, 15, '2025-04-15'),
(6, 16, '2025-04-16'),
(7, 10, '2025-04-17'),
(8, 11, '2025-04-18'),
(9, 12, '2025-04-19'),
(10, 13, '2025-04-20'),
(11, 14, '2025-04-21'),
(12, 15, '2025-04-22'),
(13, 16, '2025-04-23'),
(14, 10, '2025-04-24'),
(15, 11, '2025-04-25'),
(16, 12, '2025-04-26'),
(17, 13, '2025-04-27'),
(18, 14, '2025-04-28'),
(19, 15, '2025-04-29'),
(20, 16, '2025-04-10');

select * from stock_levels;
CREATE TABLE purchase_orders (
    order_id INT PRIMARY KEY,
    supplier_id INT,
    product_id INT,
    order_date DATE,
    quantity_ordered INT,
    status VARCHAR(50),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id));

INSERT INTO purchase_orders VALUES
(2001, 101, 2, '2025-04-02', 6, 'Pending'),
(2002, 102, 3, '2025-04-03', 7, 'Pending'),
(2003, 103, 4, '2025-04-04', 8, 'Delivered'),
(2004, 104, 5, '2025-04-05', 9, 'Pending'),
(2005, 105, 6, '2025-04-06', 10, 'Pending'),
(2006, 101, 7, '2025-04-07', 11, 'Delivered'),
(2007, 102, 8, '2025-04-08', 12, 'Pending'),
(2008, 103, 9, '2025-04-09', 13, 'Pending'),
(2009, 104, 10, '2025-04-10', 14, 'Delivered'),
(2010, 105, 11, '2025-04-11', 15, 'Pending'),
(2011, 101, 12, '2025-04-12', 16, 'Pending'),
(2012, 102, 13, '2025-04-13', 17, 'Delivered'),
(2013, 103, 14, '2025-04-14', 18, 'Pending'),
(2014, 104, 15, '2025-04-15', 19, 'Pending'),
(2015, 105, 16, '2025-04-16', 5, 'Delivered'),
(2016, 101, 17, '2025-04-17', 6, 'Pending'),
(2017, 102, 18, '2025-04-18', 7, 'Pending'),
(2018, 103, 19, '2025-04-19', 8, 'Delivered'),
(2019, 104, 20, '2025-04-20', 9, 'Pending'),
(2020, 105, 1, '2025-04-21', 10, 'Pending'),
(2021, 101, 2, '2025-04-22', 11, 'Delivered'),
(2022, 102, 3, '2025-04-23', 12, 'Pending'),
(2023, 103, 4, '2025-04-24', 13, 'Pending'),
(2024, 104, 5, '2025-04-25', 14, 'Delivered'),
(2025, 105, 6, '2025-04-26', 15, 'Pending'),
(2026, 101, 7, '2025-04-27', 16, 'Pending'),
(2027, 102, 8, '2025-04-28', 17, 'Delivered'),
(2028, 103, 9, '2025-04-01', 18, 'Pending'),
(2029, 104, 10, '2025-04-02', 19, 'Pending'),
(2030, 105, 11, '2025-04-03', 5, 'Delivered');
select * from purchase_orders;

-- Queries basedd on this table
-- 1) Retrieve top 5 products by price
     select product_name,price from products order by price desc;

-- 2)Obtain Average Stock Quantity by Product Category
     select p.category,avg(s.quantity) as avg_stock from products p join stock_levels s on p.product_id=s.product_id group by p.category;

-- 3)List Products That Were Updated After a Specific Date
     select p.product_name, s.last_updated from stock_levels s join products p ON 
	 p.product_id = s.product_id where s.last_updated > '2025-04-20';

-- 4)Retrieve Total Stock Value per Product
     select p.product_name, (p.price * s.quantity) as total_stock_value from products p join stock_levels s on p.product_id = s.product_id;

-- 5)Obtain Supplier-wise Product Count in Purchase Orders
     select s.supplier_name, count(po.product_id) as total_products from suppliers s join purchase_orders po on s.supplier_id = po.supplier_id 
     group by s.supplier_name;

-- 6)Get the List All Products with Less Than 15 in Stock
     select p.product_name, s.quantity from products p join stock_levels s on p.product_id = s.product_id where s.quantity < 15;

-- 7)Get the Pending Purchase Orders
     select order_id, supplier_id, product_id, quantity_ordered from purchase_orders where status = 'Pending';

-- 8) Find Supplier for Each Purchase Order
     select po.order_id, s.supplier_name, po.order_date from purchase_orders po join suppliers s ON po.supplier_id = s.supplier_id;

-- 9)Retrieve the Total Quantity Ordered by Product
     select p.product_name, sum(po.quantity_ordered) as total_ordered from purchase_orders po join products p on po.product_id = p.product_id
     group by p.product_name order by total_ordered desc;

-- 10)Find the Inventory Value by Category
      select p.category, sum(p.price * s.quantity) as category_value from products p join stock_levels s on p.product_id = s.product_id
	  group by p.category;
