# Partitioning Performance Report

This report describes the implementation and performance effects of partitioning the `bookings` table by the `start_date` column.

---

## 1. Why Partition?

The `bookings` table grows very quickly, and most queries filter by:
- date range
- start_date
- report periods (monthly, yearly)

A full table scan becomes slow as millions of rows accumulate.

Partitioning by `start_date` allows the database to read **only the partitions that match the date range**, reducing I/O and execution time.

---

## 2. Partition Method

We used **RANGE partitioning on start_date**, creating yearly partitions:

- `bookings_2023`
- `bookings_2024`
- `bookings_2025`

This is implemented in the `partitioning.sql` file.

---

## 3. Performance Testing

We compared the performance of the same query before and after partitioning:

### Query Tested:
