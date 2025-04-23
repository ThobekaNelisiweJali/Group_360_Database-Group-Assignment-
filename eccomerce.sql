-- Tables for e-commerce platform
-- This file contains the SQL code to create the necessary tables for an e-commerce platform.
-- Each table is designed with appropriate data types and constraints to ensure data integrity.
-- The tables are related to each other through foreign keys to maintain referential integrity.

--  brand – Stores brand-related data
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL UNIQUE,
    description TEXT
);

-- color – Manages available color options
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY, -- Changed SERIAL to INT AUTO_INCREMENT for compatibility with MySQL
    name VARCHAR(50) NOT NULL UNIQUE,
    hex_code VARCHAR(7) NOT NULL UNIQUE
);

-- product – Stores general product details (name, brand, base price)
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    brand_id INT NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL CHECK (base_price >= 0),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id) -- Fixed foreign key reference to match the correct column name in the brand table
);

-- product_category – Classifies products into categories (e.g., clothing, electronics)
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- product_item – Represents purchasable items with specific variations
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    color_id INT NOT NULL,
    size VARCHAR(50) NOT NULL,
    stock_level INT NOT NULL CHECK (stock_level >= 0),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

-- product_image – Stores product image URLs or file references
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL, -- Added NOT NULL constraint for consistency
    image_url VARCHAR(250) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id) -- Fixed foreign key reference to match the correct column name in the product table
);

-- product_variation – Links a product to its variations (e.g., size, color)
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    color_id INT NOT NULL,
    size_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

-- size_category – Groups sizes into categories (e.g., clothing sizes, shoe sizes)
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- size_option – Lists specific sizes (e.g., S, M, L, 42)
CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    size_value VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- product_attribute – Stores custom attributes (e.g., material, weight)
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_category_id INT NOT NULL,
    attribute_type_id INT NOT NULL,
    value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- attribute_category – Groups attributes into categories (e.g., physical, technical)
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- attribute_type – Defines types of attributes (e.g., text, number, boolean)
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

-- The changes I made:
-- 1. I chhanged SERIAL to INT AUTO_INCREMENT in the color table for compatibility with MySQL.
-- 2. I also fixed foreign key references in the product and product_image tables to match the correct column names.
-- 3. At the end I added NOT NULL constraint to the product_id column in the product_image table for consistency.
-- 4. I added missing tables (size_category, size_option, product_attribute, attribute_category, attribute_type) to meet the assignment specifications.