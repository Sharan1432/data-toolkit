-- 1.

use PwSkill;

create table employess(
emp_id int not null primary key,
emp_name text not null,
age int check(age>=18),
email varchar(500) unique,
salary decimal default 30000
);

/* 2.
Constraints are rules applied to columns in a database table to ensure the accuracy and reliability of the data. They play a crucial role in maintaining data integrity by preventing invalid data from being entered into the database. Here are some common types of constraints and their purposes, along with examples:

1. Primary Key Constraint
Purpose: Ensures that each row in a table has a unique identifier and prevents duplicate records. Example: The emp_id column in the employees table can be defined as the primary key.

sql
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(100),
    age INT
);
2. Foreign Key Constraint
Purpose: Enforces a link between the data in two tables and ensures referential integrity. Example: The department_id in the employees table can reference the department_id in the departments table.

sql
CREATE TABLE departments (
    department_id INT NOT NULL PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(100),
    age INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
3. Unique Constraint
Purpose: Ensures that all values in a column are unique across the table. Example: The email column in the employees table should be unique for each employee.

sql
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    age INT
);
4. Not Null Constraint
Purpose: Ensures that a column cannot have NULL values. Example: The emp_name column in the employees table should not be NULL.

sql
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    age INT
);
5. Check Constraint
Purpose: Ensures that the values in a column satisfy a specific condition. Example: The age column in the employees table should have a minimum value of 18.

sql
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(100),
    age INT CHECK (age >= 18)
);
6. Default Constraint
Purpose: Provides a default value for a column when no value is specified during an insert operation. Example: The salary column in the employees table should have a default value of 30,000.

sql
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL DEFAULT 30000
);
Benefits of Constraints:
Data Integrity: Constraints prevent invalid data from being entered, ensuring the consistency and accuracy of the data.

Reliability: By enforcing rules, constraints ensure that the database behaves predictably.

Relationship Management: Foreign keys maintain the relationships between tables, preserving referential integrity.

Uniqueness: Unique constraints prevent duplicate values, ensuring the uniqueness of data.

Mandatory Fields: Not Null constraints ensure that essential fields always have a value. */

/*3. 
NOT NULL Constraint:
Purpose: The NOT NULL constraint is applied to a column to ensure that every row must have a value in that column. This constraint enforces the integrity of the data by preventing the storage of NULL values in the specified column.

Use Cases:

Mandatory Fields: Certain fields are critical for the operation of the database, such as an employee’s name or a transaction date. By applying the NOT NULL constraint, you ensure that these critical fields always have a value.

Data Consistency: It helps maintain data consistency by ensuring that there are no gaps or missing values in essential columns.

CREATE TABLE employees (
    emp_id INT NOT NULL,
    emp_name VARCHAR(100) NOT NULL,
    age INT,
    salary DECIMAL
);
Primary Key and NULL Values:
Can a Primary Key Contain NULL Values?: No, a primary key cannot contain NULL values. The primary key is used to uniquely identify each row in a table. By definition, it must contain unique and non-null values for each record.
Justification:

Uniqueness: A primary key enforces uniqueness for each record, and a NULL value does not contribute to this uniqueness. If NULL values were allowed, it would be impossible to uniquely identify records that contain NULL.

Referential Integrity: The primary key is often referenced by foreign keys in other tables. Allowing NULL values in a primary key would break referential integrity, as foreign keys would not be able to consistently reference a unique, non-null value.
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    age INT,
    salary DECIMAL
);
*/

/* 4.

Adding a Constraint
To add a constraint, you can use the ALTER TABLE command followed by the specific type of constraint you want to add. Here's an example of adding a PRIMARY KEY constraint:

Example: Adding a Primary Key Constraint

ALTER TABLE employees
ADD CONSTRAINT pk_employee_id PRIMARY KEY (employee_id);

Example: Adding a Foreign Key Constraint

ALTER TABLE orders
ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

Example: Adding a Unique Constraint

ALTER TABLE users
ADD CONSTRAINT uc_username UNIQUE (username);

Removing a Constraint
To remove a constraint, you can also use the ALTER TABLE command, but this time with the DROP CONSTRAINT clause.

Example: Removing a Primary Key Constraint

ALTER TABLE employees
DROP CONSTRAINT pk_employee_id;

Example: Removing a Foreign Key Constraint

ALTER TABLE orders
DROP CONSTRAINT fk_customer_id;

Example: Removing a Unique Constraint

ALTER TABLE users
DROP CONSTRAINT uc_username;

/* 5.

Primary Key Constraint Violation
Attempting to insert a duplicate value in a primary key column will violate the primary key constraint. Consequence: The insertion will fail. Example Error Message:

ERROR: duplicate key value violates unique constraint "pk_employee_id"
DETAIL: Key (employee_id)=(123) already exists.

Foreign Key Constraint Violation
Attempting to insert or update a value in a foreign key column that does not exist in the referenced primary key column will violate the foreign key constraint. Consequence: The insertion or update will fail. 

Example Error Message:
ERROR: insert or update on table "orders" violates foreign key constraint "fk_customer_id"
DETAIL: Key (customer_id)=(456) is not present in table "customers".

Unique Constraint Violation
Attempting to insert a duplicate value in a unique column will violate the unique constraint. Consequence: The insertion will fail.

Example Error Message:
ERROR: duplicate key value violates unique constraint "uc_username"
DETAIL: Key (username)=(john_doe) already exists.

Check Constraint Violation
Attempting to insert or update a value that does not satisfy the check constraint will violate the check constraint.

Example Error Message:
ERROR: new row for relation "employees" violates check constraint "chk_age"
DETAIL: Failing row contains (123, John, Doe, -5).

Not Null Constraint Violation
Attempting to insert or update a column with a NULL value in a column that is defined with a NOT NULL constraint will violate the constraint. Consequence: The insertion or update will fail.

Example Error Message:
ERROR: null value in column "employee_name" violates not-null constraint
DETAIL: Failing row contains (124, null, 30).

eferential Integrity Violation
Deleting a record that is being referenced by a foreign key in another table will violate the referential integrity constraint. Consequence: The deletion will fail

Example Error Message:
ERROR: update or delete on table "customers" violates foreign key constraint "fk_customer_id" on table "orders"
DETAIL: Key (customer_id)=(123) is still referenced from table "orders".

*/

-- 6.
-- 1.Add Primary Key Constraint to product_id

ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

-- 2. Add Default Value to price

ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;

-- 7.

SELECT students.student_name, classes.class_name
FROM students
INNER JOIN classes ON students.class_id = classes.class_id;

-- 8.

SELECT 
    products.product_name, 
    orders.order_id, 
    customers.customer_name
FROM 
    products
LEFT JOIN 
    orders ON products.product_id = orders.product_id
LEFT JOIN 
    customers ON orders.customer_id = customers.customer_id;

-- 9.

SELECT 
    products.product_name,
    SUM(orders.quantity * orders.price) AS total_sales
FROM 
    orders
INNER JOIN 
    products ON orders.product_id = products.product_id
GROUP BY 
    products.product_name;

-- 10.

SELECT 
    orders.order_id, 
    customers.customer_name, 
    order_details.quantity
FROM 
    orders
INNER JOIN 
    customers ON orders.customer_id = customers.customer_id
INNER JOIN 
    order_details ON orders.order_id = order_details.order_id;

/*  SQL Commands
1.

Primary Keys
Primary keys are unique identifiers for records in a table. They ensure that each record is distinct and can be reliably referenced. In the Maven Movies database, primary keys are typically found in tables like:

Customer: Customer_ID

Film: Film_ID

Inventory: Inventory_ID

Rental: Rental_ID

Foreign Keys
Foreign keys are used to establish relationships between tables. They reference primary keys in other tables, ensuring referential integrity. In the Maven Movies database, foreign keys are typically found in tables like:

Rental: Customer_ID (references Customer.Customer_ID)

Inventory: Film_ID (references Film.Film_ID)

Inventory: Store_ID (references Store.Store_ID)

Differences
Primary Key: Uniquely identifies each record within its own table.

Foreign Key: Links one table to another, establishing a relationship between the two tables.

*/


-- 2.

SELECT * FROM actor;

-- 3.

SELECT * FROM customer;

-- 4.

SELECT DISTINCT country FROM country;

-- 5.

SELECT * FROM customer WHERE active = 1;

-- 6.

SELECT rental_id FROM rental WHERE customer_id = 1;

-- 7.

SELECT * FROM film WHERE rental_duration > 5;

-- 8.

SELECT COUNT(*) AS total_films 
FROM film 
WHERE replacement_cost > 15 AND replacement_cost < 20;

-- 9.

SELECT COUNT(DISTINCT first_name) AS unique_first_names_count 
FROM actor;

-- 10.

SELECT * 
FROM customer 
LIMIT 10;


-- 11.

SELECT * 
FROM customer 
WHERE first_name LIKE 'B%' 
LIMIT 3;

-- 12.

SELECT title 
FROM film 
WHERE rating = 'G' 
LIMIT 5;

-- 13.

SELECT * 
FROM customer 
WHERE first_name LIKE 'A%';

-- 14.

SELECT * 
FROM customer 
WHERE first_name LIKE '%a';

-- 15.

SELECT city 
FROM city 
WHERE city LIKE 'A%' AND city LIKE '%A' 
LIMIT 4;

-- 16.

SELECT * 
FROM customer 
WHERE first_name LIKE '%NI%';

-- 17.

SELECT * 
FROM customer 
WHERE first_name LIKE '_r%';

-- 18.

SELECT * 
FROM customer 
WHERE first_name LIKE 'A%' 
AND LENGTH(first_name) >= 5;

-- 19.

SELECT * 
FROM customer 
WHERE first_name LIKE 'A%o';

-- 20.

SELECT * 
FROM film 
WHERE rating IN ('PG', 'PG-13');

-- 21.

SELECT * 
FROM film 
WHERE length BETWEEN 50 AND 100;

-- 22.

SELECT * 
FROM actor 
LIMIT 50;

-- 23

SELECT DISTINCT film_id 
FROM inventory;

-- Functions
-- 1.
use sakila;

select count(*) as rental_incomne
from rental;

-- 2.

SELECT AVG(DATEDIFF(return_date, rental_date)) AS average_rental_duration
FROM rental;

-- 3.

SELECT UPPER(first_name) AS first_name_uppercase, 
       UPPER(last_name) AS last_name_uppercase 
FROM customer;

-- 4.

SELECT rental_id, 
       MONTH(rental_date) AS rental_month 
FROM rental;

-- 5.

SELECT customer_id, 
       COUNT(*) AS rental_count 
FROM rental 
GROUP BY customer_id;

-- 6.

SELECT i.store_id, 
       SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY i.store_id;

-- 7.

SELECT c.name AS category_name, 
       COUNT(*) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- 8.

SELECT l.name AS language_name, 
       AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

-- Joins  
-- 9.

SELECT f.title, 
       c.first_name, 
       c.last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

-- 10.

SELECT a.first_name, 
       a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

-- 11.

SELECT c.first_name, 
       c.last_name, 
       SUM(p.amount) AS total_spent
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 12.

SELECT c.first_name, 
       c.last_name, 
       f.title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London';

-- Advanced Joins and GROUP BY
-- 13.

SELECT f.title, 
       COUNT(*) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

SELECT c.customer_id, 
       c.first_name, 
       c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;

-- Windows Function:
-- 1.

SELECT c.customer_id, 
       c.first_name, 
       c.last_name, 
       SUM(p.amount) AS total_spent
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- 2.

SELECT f.title,
       p.payment_date,
       SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
ORDER BY f.title, p.payment_date;

-- 3.

SELECT f.title,
       f.length,
       AVG(DATEDIFF(r.return_date, r.rental_date)) AS average_rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.length, f.title
ORDER BY f.length;

-- 4.

WITH FilmRentalCounts AS (
    SELECT f.film_id, 
           f.title, 
           c.name AS category_name, 
           COUNT(*) AS rental_count,
           ROW_NUMBER() OVER (PARTITION BY c.category_id ORDER BY COUNT(*) DESC) AS `rank`
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title, c.name, c.category_id
)
SELECT film_id, 
       title, 
       category_name, 
       rental_count
FROM FilmRentalCounts
WHERE `rank` <= 3
ORDER BY category_name, `rank`;

--  5.

WITH CustomerRentals AS (
    SELECT customer_id, 
           COUNT(*) AS total_rentals
    FROM rental
    GROUP BY customer_id
),
AverageRentals AS (
    SELECT AVG(total_rentals) AS avg_rentals
    FROM CustomerRentals
)
SELECT c.customer_id, 
       c.total_rentals, 
       ar.avg_rentals, 
       (c.total_rentals - ar.avg_rentals) AS rental_difference
FROM CustomerRentals c, AverageRentals ar;

-- 6.

SELECT YEAR(p.payment_date) AS year, 
       MONTH(p.payment_date) AS month, 
       SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY YEAR(p.payment_date), MONTH(p.payment_date)
ORDER BY YEAR(p.payment_date), MONTH(p.payment_date);

-- 7. 

-- Calculate total spending for each customer
WITH CustomerSpending AS (
    SELECT customer_id, 
           SUM(amount) AS total_spent
    FROM payment
    GROUP BY customer_id
),

-- Determine the spending threshold for the top 20%
SpendingRank AS (
    SELECT customer_id, 
           total_spent,
           NTILE(5) OVER (ORDER BY total_spent DESC) AS spending_percentile
    FROM CustomerSpending
)

-- Retrieve customers in the top 20% of spending
SELECT c.customer_id, 
       c.first_name, 
       c.last_name, 
       sr.total_spent
FROM SpendingRank sr
JOIN customer c ON sr.customer_id = c.customer_id
WHERE sr.spending_percentile = 1
ORDER BY sr.total_spent DESC;

-- 8.

WITH CategoryRentalCounts AS (
    SELECT c.name AS category_name, 
           COUNT(*) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name
)
SELECT category_name, 
       rental_count,
       SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM CategoryRentalCounts
ORDER BY rental_count DESC;


-- 9.

WITH FilmRentalCounts AS (
    SELECT fc.category_id, 
           f.film_id,
           f.title,
           COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN film_category fc ON f.film_id = fc.film_id
    GROUP BY fc.category_id, f.film_id, f.title
),
CategoryAverageRentals AS (
    SELECT fc.category_id, 
           AVG(FilmRentalCounts.rental_count) AS avg_rental_count
    FROM FilmRentalCounts
    JOIN film_category fc ON FilmRentalCounts.category_id = fc.category_id
    GROUP BY fc.category_id
)
SELECT f.title, 
       fr.rental_count,
       car.avg_rental_count
FROM FilmRentalCounts fr
JOIN CategoryAverageRentals car ON fr.category_id = car.category_id
WHERE fr.rental_count < car.avg_rental_count;

-- 10.

WITH MonthlyRevenue AS (
    SELECT YEAR(payment_date) AS year,
           MONTH(payment_date) AS month,
           SUM(amount) AS total_revenue
    FROM payment
    GROUP BY YEAR(payment_date), MONTH(payment_date)
)
SELECT year, 
       month, 
       total_revenue
FROM MonthlyRevenue
ORDER BY total_revenue DESC
LIMIT 5;

-- Normalisation & CTE

-- 1. First Normal Form (1NF):

CREATE TABLE film (
  film_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  release_year YEAR NOT NULL,
  language_id TINYINT UNSIGNED NOT NULL,
  original_language_id TINYINT UNSIGNED,
  rental_duration TINYINT UNSIGNED NOT NULL DEFAULT 3,
  rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
  length SMALLINT UNSIGNED,
  replacement_cost DECIMAL(5,2) NOT NULL DEFAULT 19.99,
  rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  PRIMARY KEY (film_id)
);

CREATE TABLE film_special_features (
  special_feature_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  special_feature_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (special_feature_id)
);

CREATE TABLE film_special_features_junction (
  film_id SMALLINT UNSIGNED NOT NULL,
  special_feature_id TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (film_id, special_feature_id),
  FOREIGN KEY (film_id) REFERENCES film (film_id),
  FOREIGN KEY (special_feature_id) REFERENCES film_special_features (special_feature_id)
);

-- 2. Second Normal Form (2NF):

CREATE TABLE rental (
  rental_id INT NOT NULL AUTO_INCREMENT,
  rental_date DATETIME NOT NULL,
  inventory_id INT NOT NULL,
  customer_id INT NOT NULL,
  return_date DATETIME,
  staff_id TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (rental_id),
  FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);

/*

Determining 2NF Compliance

To determine if the rental table is in 2NF, we need to check if it meets the following conditions:

1. The table is in 1NF (already checked).
2. All non-key attributes depend on the entire primary key.

In this case, the primary key is rental_id, which is a single column. However, we can still check if there are any partial dependencies.

Identifying Partial Dependencies

Upon examining the table structure, we notice that rental_date, return_date, customer_id, and staff_id depend on the rental_id. However, inventory_id also depends on the rental_id, but it's not a partial dependency in this case.

Normalization Steps (Not Required)

Since we didn't find any partial dependencies, the rental table is already in 2NF. Therefore, no normalization steps are required.

However, if we had found partial dependencies, we would need to create separate tables to eliminate them and achieve 2NF. The general steps would involve:

1. Identify the partial dependencies.
2. Create a new table with the dependent attributes and the relevant part of the primary key.
3. Remove the dependent attributes from the original table.

*/

-- 3. Third Normal Form (3NF):

CREATE TABLE payment (
  payment_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  staff_id TINYINT UNSIGNED NOT NULL,
  rental_id INT,
  amount DECIMAL(5,2) NOT NULL,
  payment_date DATETIME NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
  FOREIGN KEY (rental_id) REFERENCES rental (rental_id)
);

/*

Transitive Dependencies

Upon examining the table structure, I've identified the following transitive dependencies:

1. payment_id → customer_id (A payment is made by a customer.)
2. customer_id → email (A customer has an email address.)
*Note: The email column is not present in the payment table, but it's present in the customer table, which is referenced by the customer_id foreign key.

However, the payment table also contains the amount and payment_date columns, which depend on the payment_id. But, the customer_id and staff_id columns also depend on the payment_id, creating a transitive dependency:

payment_id → customer_id → email

Normalization Steps

To normalize the payment table to 3NF, we'll eliminate the transitive dependencies by removing the customer_id and staff_id columns, which are already referenced by the rental_id foreign key. We'll also create a new table to store the payment details.

*/

-- Step 1: Create a new table, payment_details, to store the payment details.


CREATE TABLE payment_details (
  payment_id INT NOT NULL,
  amount DECIMAL(5,2) NOT NULL,
  payment_date DATETIME NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (payment_id) REFERENCES payment (payment_id)
);


-- Step 2: Remove the amount and payment_date columns from the payment table.


ALTER TABLE payment DROP COLUMN amount;
ALTER TABLE payment DROP COLUMN payment_date;


-- Step 3: Remove the customer_id and staff_id columns from the payment table.


ALTER TABLE payment DROP COLUMN customer_id;
ALTER TABLE payment DROP COLUMN staff_id;


-- 5. CTE Basics:

-- Here is the query using a Common Table Expression (CTE) to retrieve the distinct list of actor names and the number of films they have acted in:


WITH actor_film_count AS (
  SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
  FROM actor a
  JOIN film_actor fa ON a.actor_id = fa.actor_id
  GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT first_name, last_name, film_count
FROM actor_film_count
ORDER BY film_count DESC;

-- 6. CTE with Joins:

WITH film_language_info AS (
  SELECT f.title, l.name AS language_name, f.rental_rate
  FROM film f
  JOIN language l ON f.language_id = l.language_id
)
SELECT title, language_name, rental_rate
FROM film_language_info
ORDER BY rental_rate DESC;

-- CTE for Aggregation:

WITH customer_revenue AS (
  SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_revenue
  FROM customer c
  JOIN payment p ON c.customer_id = p.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT customer_id, first_name, last_name, total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC;

-- 8.CTE with Window Functions:

WITH ranked_films AS (
  SELECT film_id, title, rental_duration,
         RANK() OVER (ORDER BY rental_duration DESC) AS rental_duration_rank
  FROM film
)
SELECT film_id, title, rental_duration, rental_duration_rank
FROM ranked_films
ORDER BY rental_duration_rank;

-- 9.CTE and Filtering:

WITH frequent_renters AS (
  SELECT customer_id
  FROM rental
  GROUP BY customer_id
  HAVING COUNT(rental_id) > 2
)
SELECT c.customer_id, c.first_name, c.last_name, c.email, fr.customer_id AS frequent_renter_id
FROM customer c
JOIN frequent_renters fr ON c.customer_id = fr.customer_id
ORDER BY c.last_name, c.first_name;

-- 10.CTE for Date Calculations:

WITH monthly_rentals AS (
  SELECT 
    EXTRACT(YEAR FROM rental_date) AS rental_year,
    EXTRACT(MONTH FROM rental_date) AS rental_month,
    COUNT(rental_id) AS total_rentals
  FROM 
    rental
  GROUP BY 
    EXTRACT(YEAR FROM rental_date),
    EXTRACT(MONTH FROM rental_date)
)
SELECT 
  rental_year, 
  rental_month, 
  total_rentals
FROM 
  monthly_rentals
ORDER BY 
  rental_year, 
  rental_month;

-- 11.CTE and Self-Join:

WITH actor_pairs AS (
  SELECT 
    fa1.actor_id AS actor1_id,
    fa2.actor_id AS actor2_id,
    fa1.film_id
  FROM 
    film_actor fa1
  JOIN 
    film_actor fa2 ON fa1.film_id = fa2.film_id
  WHERE 
    fa1.actor_id < fa2.actor_id
)
SELECT 
  a1.first_name AS actor1_first_name,
  a1.last_name AS actor1_last_name,
  a2.first_name AS actor2_first_name,
  a2.last_name AS actor2_last_name,
  ap.film_id
FROM 
  actor_pairs ap
JOIN 
  actor a1 ON ap.actor1_id = a1.actor_id
JOIN 
  actor a2 ON ap.actor2_id = a2.actor_id
ORDER BY 
  ap.actor1_id, 
  ap.actor2_id;
  
  -- 12.CTE for Recursive Search:
  
  WITH RECURSIVE employee_hierarchy AS (
  SELECT 
    staff_id, 
    first_name, 
    last_name, 
    reports_to, 
    0 AS level
  FROM 
    staff
  WHERE 
    staff_id = ?  -- specify the manager's staff_id here
  UNION ALL
  SELECT 
    s.staff_id, 
    s.first_name, 
    s.last_name, 
    s.reports_to, 
    level + 1
  FROM 
    staff s
  JOIN 
    employee_hierarchy m ON s.reports_to = m.staff_id
)
SELECT 
  staff_id, 
  first_name, 
  last_name, 
  reports_to, 
  level
FROM 
  employee_hierarchy
ORDER BY 
  level;

