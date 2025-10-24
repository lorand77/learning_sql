-- SQLite Bookstore Example
-- Drop tables if they exist
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_items;

-- Create tables
CREATE TABLE authors (
    author_id INTEGER,
    name TEXT,
    country TEXT
);

CREATE TABLE books (
    book_id INTEGER,
    title TEXT,
    author_id INTEGER,
    price REAL,
    genre TEXT
);

CREATE TABLE customers (
    customer_id INTEGER,
    name TEXT,
    city TEXT
);

CREATE TABLE orders (
    order_id INTEGER,
    customer_id INTEGER,
    order_date TEXT
);

CREATE TABLE order_items (
    order_id INTEGER,
    book_id INTEGER,
    quantity INTEGER
);

-- Insert data
INSERT INTO authors VALUES (1, 'J.K. Rowling', 'UK');
INSERT INTO authors VALUES (2, 'George R.R. Martin', 'USA');
INSERT INTO authors VALUES (3, 'Haruki Murakami', 'Japan');

INSERT INTO books VALUES (1, 'Harry Potter and the Sorcerer''s Stone', 1, 19.99, 'Fantasy');
INSERT INTO books VALUES (2, 'Harry Potter and the Chamber of Secrets', 1, 21.50, 'Fantasy');
INSERT INTO books VALUES (3, 'A Game of Thrones', 2, 25.00, 'Fantasy');
INSERT INTO books VALUES (4, 'Kafka on the Shore', 3, 18.00, 'Fiction');
INSERT INTO books VALUES (5, 'Norwegian Wood', 3, 15.50, 'Fiction');

INSERT INTO customers VALUES (1, 'Alice Johnson', 'New York');
INSERT INTO customers VALUES (2, 'Bob Smith', 'London');
INSERT INTO customers VALUES (3, 'Charlie Tanaka', 'Tokyo');

INSERT INTO orders VALUES (1, 1, '2025-01-15');
INSERT INTO orders VALUES (2, 2, '2025-01-20');
INSERT INTO orders VALUES (3, 3, '2025-02-01');

INSERT INTO order_items VALUES (1, 1, 1);
INSERT INTO order_items VALUES (1, 3, 1);
INSERT INTO order_items VALUES (2, 2, 2);
INSERT INTO order_items VALUES (3, 4, 1);
INSERT INTO order_items VALUES (3, 5, 3);

-- Sample queries

-- 1. List all books with authors
SELECT books.title, authors.name AS author
FROM books, authors
WHERE books.author_id = authors.author_id;

SELECT 
    books.title, 
    authors.name AS author
FROM books
JOIN authors
    ON books.author_id = authors.author_id;

-- 2. Show all books in each order
SELECT 
    orders.order_id,
    customers.name AS customer,
    books.title AS book,
    order_items.quantity,
    books.price,
    (order_items.quantity * books.price) AS total_price
FROM orders, customers, order_items, books
WHERE orders.customer_id = customers.customer_id
  AND orders.order_id = order_items.order_id
  AND order_items.book_id = books.book_id;

SELECT 
    orders.order_id,
    customers.name AS customer,
    books.title AS book,
    order_items.quantity,
    books.price,
    (order_items.quantity * books.price) AS total_price
FROM orders
JOIN customers 
    ON orders.customer_id = customers.customer_id
JOIN order_items 
    ON orders.order_id = order_items.order_id
JOIN books 
    ON order_items.book_id = books.book_id;

-- 3. Total quantity of each book sold
SELECT 
    books.title,
    SUM(order_items.quantity) AS total_sold
FROM books, order_items
WHERE books.book_id = order_items.book_id
GROUP BY books.title
ORDER BY total_sold DESC;

-- 4. Customers who spent more than $40
SELECT 
    customers.name,
    SUM(order_items.quantity * books.price) AS total_spent
FROM customers, orders, order_items, books
WHERE customers.customer_id = orders.customer_id
  AND orders.order_id = order_items.order_id
  AND order_items.book_id = books.book_id
GROUP BY customers.name
HAVING total_spent > 40
ORDER BY total_spent DESC;