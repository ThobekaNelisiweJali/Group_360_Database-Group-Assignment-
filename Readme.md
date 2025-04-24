# 🛍️ E-Commerce Platform Database Project

## Project Overview

This project is a collaborative team effort to **design, build, and implement a relational database** for an e-commerce platform. The aim is to showcase our understanding of data modeling, SQL scripting, and team-based system analysis and design.

The platform supports multiple product types, variations, and attributes, and includes detailed tracking of inventory, product images, brands, and sizes.

---

## Deliverables

1. **Entity-Relationship Diagram (ERD)**
   - A visual model of all tables, attributes, and relationships.
   - Created using draw.io and dbdiagram.io.
   - Clearly shows primary and foreign key relationships.

2. **Data Flow Diagram (DFD)**
   - A flowchart showing how data moves between components in the system.
   - Highlights user interactions, system boundaries, and database exchanges.

3. **Database Schema (SQL Script)**
   - `ecommerce.sql` contains the SQL `CREATE TABLE` statements to set up the schema.
   - Includes primary keys, foreign keys, and constraints.

4. **GitHub Repository**
   - Hosts all documentation, diagrams, and code.
   - Demonstrates use of version control and group collaboration.

5. **Team Collaboration**
   - A shared analysis and implementation effort.
   - Clear documentation of roles and responsibilities.

---

## Tables Created

| Table Name           | Description |
|----------------------|-------------|
| `product_image`      | Stores product image URLs |
| `color`              | Manages color options |
| `product_category`   | Classifies products |
| `product`            | General product info |
| `product_item`       | Individual SKUs (size/color variations) |
| `brand`              | Brand information |
| `product_variation`  | Links product to variation |
| `size_category`      | Categories of sizes (e.g., shoe, clothing) |
| `size_option`        | Individual sizes (e.g., S, M, L) |
| `product_attribute`  | Additional product properties |
| `attribute_category` | Groups of product attributes |
| `attribute_type`     | Attribute data types (text, number, etc.) |

---

## Tools Used

- **Draw.io** – For ERD & DFD diagrams
- **dbdiagram.io** – For database design visualization
- **MySQL** – SQL script creation and testing
- **GitHub** – Version control and collaboration

---

## Team Members

| Name | Role |
|------|------|
| [Thobeka Jali & Janet Mutisya] | Database Design |
| [Thembelani Bukali & Margaret Akinyi ] | SQL Implementation |
| [Thobeka Jali & Janet Mutisya] | Documentation & Diagrams |
| [Isaac Kahura & Mwangi Faith Wanjiru] | Testing & Collaboration |

---

## Getting Started

To run the SQL schema:
1. Clone the repository.
2. Open your SQL client (e.g., MySQL Workbench).
3. Run the `ecommerce.sql` script to create all tables.

---



