-- Tables for your e-commerce platform
-- This file contains the SQL code to create the necessary tables for an e-commerce platform.
-- Each table is designed with appropriate data types and constraints to ensure data integrity.
-- The tables are related to each other through foreign keys to maintain referential integrity.

--  brand – Stores brand-related data
CREATE TABLE brand (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
    ;

-- color – Manages available color options
CREATE TABLE color (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    hex_code VARCHAR(7) NOT NULL UNIQUE
    ;

-- product – Stores general product details (name, brand, base price)
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL CHECK (base_price >= 0),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
    ;

