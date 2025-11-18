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
