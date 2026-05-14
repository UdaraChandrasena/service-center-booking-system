-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS service_center_db;
USE service_center_db;

-- 2. Create Users Table
-- This stores information for Login and Signup
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create Bookings Table
-- This stores the service appointments
CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    booking_id VARCHAR(20) NOT NULL UNIQUE, -- e.g., SCCS-100526-A1
    appointment_date DATETIME NOT NULL,
    vehicle_number VARCHAR(20) NOT NULL,
    service_type VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);