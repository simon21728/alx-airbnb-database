-- =====================================================================
-- PARTITIONING THE BOOKINGS TABLE BY start_date (MONTH-RANGE PARTITIONING)
-- =====================================================================

-- 1. Rename original table (if needed)
-- NOTE: Only run this once
ALTER TABLE bookings RENAME TO bookings_original;

-- 2. Create new partitioned table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
)
PARTITION BY RANGE (start_date);

-- 3. Create partitions (example: yearly partitions)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Move data from original table into partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date)
SELECT id, user_id, property_id, start_date, end_date
FROM bookings_original;

-- =====================================================================
-- PERFORMANCE TESTING
-- =====================================================================

-- BEFORE partitioning (run on bookings_original)
EXPLAIN ANALYZE
SELECT *
FROM bookings_original
WHERE start_date BETWEEN '2024-01-01' AND '2024-02-01';

-- AFTER partitioning (should scan only one partition)
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-02-01';
