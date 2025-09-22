# Database Normalization Steps - Airbnb Clone

The goal of normalization is to eliminate redundancy, ensure data integrity, and organize the database to meet the Third Normal Form (3NF).

## Step 1: First Normal Form (1NF)
- Ensure that each table has a primary key.
- Remove repeating groups and ensure atomic values for each attribute.
- Example: In the `Booking` table, store one booking per row; do not combine multiple guest IDs or property IDs in a single column.

## Step 2: Second Normal Form (2NF)
- Ensure that all non-key attributes are fully functionally dependent on the primary key.
- Example: In `Property`, attributes like `host_id` fully depend on `property_id` (primary key), so no partial dependencies exist.

## Step 3: Third Normal Form (3NF)
- Ensure that all non-key attributes are not dependent on other non-key attributes (no transitive dependencies).
- Example: In `Booking`, `total_price` is calculated from `price_per_night` and `duration`. To achieve strict 3NF, `total_price` could be calculated on-the-fly rather than stored, avoiding redundancy.
- Example: In `Review`, `guest_name` should not be stored; instead, reference the `User` table to retrieve user information.

## Summary of Adjustments
- Removed any derived or redundant attributes (e.g., `total_price` can be computed).
- Ensured foreign keys correctly reference primary keys.
- Each entity contains only attributes that directly relate to the primary key.
- Relationships remain consistent and avoid data duplication.

By applying these steps, the database design meets **3NF**, ensuring data consistency, reducing redundancy, and supporting scalable queries.
