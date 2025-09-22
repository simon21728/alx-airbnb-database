# Airbnb Clone Database - ER Diagram Requirements

## Entities and Attributes

### 1. User
- `user_id` (Primary Key)
- `username`
- `email`
- `password`
- `is_host` (boolean indicating if the user is a host)

### 2. Property
- `property_id` (Primary Key)
- `title`
- `description`
- `location`
- `price_per_night`
- `host_id` (Foreign Key → User)

### 3. Booking
- `booking_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `guest_id` (Foreign Key → User)
- `start_date`
- `end_date`
- `total_price`

### 4. Review
- `review_id` (Primary Key)
- `property_id` (Foreign Key → Property)
- `guest_id` (Foreign Key → User)
- `rating`
- `comment`
- `created_at`

### 5. Payment
- `payment_id` (Primary Key)
- `booking_id` (Foreign Key → Booking)
- `amount`
- `payment_method`
- `status`
- `payment_date`

---

## Relationships

- **User → Property**: One-to-Many  
  (A host can have multiple properties)

- **User → Booking**: One-to-Many  
  (A guest can have multiple bookings)

- **Property → Booking**: One-to-Many  
  (A property can have multiple bookings)

- **Booking → Payment**: One-to-One  
  (Each booking has a payment)

- **Property → Review**: One-to-Many  
  (A property can have multiple reviews)

- **User → Review**: One-to-Many  
  (A guest can write multiple reviews)
