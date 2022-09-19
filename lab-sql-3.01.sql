-- lab-sql-3.01

USE sakila;
-- q1
ALTER TABLE staff DROP COLUMN picture;

-- q2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM staff;
SELECT * FROM customer
WHERE first_name= 'tammy';
INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update) 
VALUES
(3,'Tammy','Sanders',4,'TAMMY.SANDERS@sakilacustomer.org',2, 1, 'Tammy', NULL, '2022-09-19 16:37'); -- now()

-- q3 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well.
-- To get that you can use the following query:

SELECT * FROM rental
ORDER BY rental_id DESC; -- the last rental_id is 16049
SELECT * FROM film
WHERE title='Academy Dinosaur'; -- film_id=1
SELECT * FROM inventory
WHERE film_id=1 AND store_id=1; -- inventory_id= 1,2,3,4
SELECT * FROM staff
WHERE store_id=1; -- staff_id=1
SELECT * FROM customer
WHERE first_name= 'charlotte'; -- customer_id=130
SELECT * FROM rental
WHERE inventory_id IN (1,2,3,4) AND staff_id=1; -- all of the four copies in store 1 is available to rent

INSERT INTO rental(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) 
VALUES
(16050, NOW(), 1, 130, NULL, 1, NOW());

SELECT * FROM rental -- checking whether I added the row correctly
ORDER BY rental_id DESC;
