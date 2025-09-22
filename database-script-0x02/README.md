# Airbnb Clone Database Schema

This folder contains the SQL schema for the Airbnb Clone project.

## Files
- **schema.sql**: Defines the database tables, primary keys, foreign keys, constraints, and indexes.

## Database Design
- **Users**: Stores all platform users (guests and hosts).
- **Properties**: Stores property listings with host references.
- **Bookings**: Tracks reservations, linked to properties and guests.
- **Reviews**: Guest feedback on properties.
- **Payments**: Records payment transactions for bookings.

## How to Run
1. Open PostgreSQL.
2. Run the schema file:

   ```bash
   psql -U <username> -d <database_name> -f schema.sql
