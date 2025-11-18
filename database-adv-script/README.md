# Complex SQL Joins — ALX Airbnb Database

This directory contains SQL queries demonstrating the use of `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN` as required in the ALX Software Engineering Database Advanced tasks.

---

## 📌 1. INNER JOIN  
Retrieve all bookings and the users who made those bookings.

```sql
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.first_name,
    users.last_name,
    users.email
FROM bookings
INNER JOIN users
    ON bookings.user_id = users.id;


# Subquery Practice — ALX Airbnb Database

This directory contains SQL solutions for practicing subqueries, including:

- A **non-correlated subquery** using an aggregate function
- A **correlated subquery** referencing outer query rows

---

## 📌 1. Non-correlated Subquery  
Find all properties whose **average rating is greater than 4.0**.

```sql
SELECT 
    p.id,
    p.title,
    p.location
FROM properties p
WHERE (
        SELECT AVG(r.rating)
        FROM reviews r
        WHERE r.property_id = p.id
      ) > 4.0;




# Aggregations and Window Functions

This module demonstrates the use of SQL aggregation and window functions on the Airbnb-style booking dataset.

## Tasks

### 1. Total Bookings Per User
We use the COUNT() function with GROUP BY to calculate how many bookings each user has made.

### 2. Ranking Properties by Bookings
We use a window function (RANK or ROW_NUMBER) to list properties in order of how many bookings they have received.

## SQL Queries

See `aggregations_and_window_functions.sql` for the full implementation.
