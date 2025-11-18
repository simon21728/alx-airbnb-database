# Optimization Report – Complex Query Performance

This report analyzes and optimizes the query used to retrieve bookings along with related user, property, and payment information.

---

## 1. Initial Query

The first version of the query joined:
- `bookings`
- `users`
- `properties`
- `payments`

using `LEFT JOIN` on all tables and selecting many unused columns.

This query is stored in `perfomance.sql` under the *INITIAL COMPLEX QUERY* section.

---

## 2. Performance Issues Identified (Using EXPLAIN ANALYZE)

EXPLAIN ANALYZE revealed the following inefficiencies:

### ❌ Full table scans
Large tables (`users`, `properties`, `payments`) were scanned because:
- No filtering was applied
- Too many unnecessary columns were selected

### ❌ Excessive use of LEFT JOIN
LEFT JOIN was used even when NULL values were not possible, causing unnecessary work.

### ❌ Fetching unnecessary columns
Selecting heavy or unused columns increases memory and disk I/O.

### ❌ Missing or unused indexes
The joins did not fully benefit from indexing because the initial query selected too much data without constraints.

---

## 3. Optimization Strategy

### ✔ Replaced LEFT JOIN with INNER JOIN when nulls are not expected  
`users` and `properties` must exist for every booking → INNER JOIN improves filtering.

### ✔ Reduced number of selected columns  
Selected only fields needed by the application.

### ✔ Ensured join keys are indexed  
Indexes created earlier:
- `idx_bookings_user_id`
- `idx_bookings_property_id`
- `idx_properties_id`
- `idx_users_id`

Greatly improved join performance.

### ✔ Reduced result payload  
Less data → faster execution and smaller buffers.

---

## 4. Optimized Query

The optimized query (included in `perfomance.sql`) reduces joins, removes unused columns, and uses better join types.

---

## 5. Performance After Optimization

EXPLAIN ANALYZE shows:

### Before:
- High total cost
- Large buffer reads
- Multiple sequential scans
- Slow execution time

### After:
- Index scans replace table scans
- Fewer rows processed
- Lower cost
- Faster execution (sometimes 5–10× improvement depending on dataset)

---

## 6. Conclusion

By refining the JOIN structure, selecting only necessary columns, and ensuring proper indexing, the execution time of the complex booking query was significantly reduced.

See the `perfomance.sql` file for full SQL examples and EXPLAIN ANALYZE output.
