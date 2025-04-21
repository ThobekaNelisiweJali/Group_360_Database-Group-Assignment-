-- Tables for your e-commerce platform
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
    color_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    hex_code VARCHAR(7) NOT NULL UNIQUE
);

-- product – Stores general product details (name, brand, base price)
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    brand_id INT NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL CHECK (base_price >= 0),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
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
    product_id INT REFERENCES product(id),
    image_url VARCHAR(250) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id)
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

