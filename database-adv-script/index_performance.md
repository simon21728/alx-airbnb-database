# Index Performance Analysis

This document describes the indexes added to the database and compares performance before and after indexing using EXPLAIN and ANALYZE.

---

## 1. Identifying High-Usage Columns

Based on typical operations in the Airbnb booking system:

### Users Table
- `id` is frequently used in JOINs.
- `email` is commonly used for lookups and authentication.

### Properties Table
- `id` used in JOINs.
- `host_id` used when retrieving all properties belonging to a host.
- `city` often used in search queries.

### Bookings Table
- `user_id` to list user bookings.
- `property_id` to list bookings per property.
- `start_date` / `end_date` used in date-range availability checks.

---

## 2. Indexes Created

See `database_index.sql` for SQL commands.

Indexes created:

- `idx_users_email`
- `idx_users_id`
- `idx_properties_host_id`
- `idx_properties_city`
- `idx_properties_id`
- `idx_bookings_user_id`
- `idx_bookings_property_id`
- `idx_bookings_start_date`
- `idx_bookings_end_date`

---

## 3. Performance Measurement (EXPLAIN / ANALYZE)

### Example Query (Before Index)
