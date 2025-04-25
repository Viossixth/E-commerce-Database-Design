----PROduct URL Table ---
USE ecommerce_library;
CREATE TABLE product_image (
product_url varchar(100) PRIMARY KEY
)

---COLOR OPTIONS----
USE ecommerce_library;
CREATE TABLE color_options(
    Colors varchar(100) PRIMARY KEY
)

---Product Category----
USE ecommerce_library;
CREATE TABLE product_category(
    Product ID VARCHAR(100) PRIMARY KEY,
    Category VARCHAR(100)
)

-----Product Details-----
USE ecommerce_library;
CREATE TABLE product_details(
    product_Name varchar(100) PRIMARY KEY,
    base_price VARCHAR(100),
    FOREIGN KEY (Product_ID) REFERENCES product_category(Product_ID),
    FOREIGN KEY (brand_name) REFERENCES brand_details (brand_name)
)

------Product Item----
USE ecommerce_library;
CREATE TABLE product_items(
    FOREIGN KEY (Product_ID) REFERENCES product_category (Product_ID),
    FOREIGN KEY (product_Name) REFERENCES product_details (product_Name)
)

----Brand----
USE ecommerce_library;
CREATE TABLE brand_details(
   brand_ID VARCHAR(100) PRIMARY KEY NOT NULL,
   brand_name VARCHAR(100),
   brand_status VARCHAR(100),
   brand_supplier VARCHAR(100)
)
----Product Variation---
USE ecommerce_library;
CREATE TABLE product_variation(
    product_color VARCHAR(100),
    FOREIGN KEY (product_size) REFERENCES product_items (product_size),
    FOREIGN KEY (Product_ID) REFERENCES product_category (Product_ID),
    FOREIGN KEY (product_Name) REFERENCES product_details (product_Name)
)
    
----Size Category -----
USE ecommerce_library;
CREATE TABLE size_category(
    product_size VARCHAR(100) PRIMARY KEY NOT NULL,
    FOREIGN KEY (product_color) REFERENCES product_variation (product_color),
    FOREIGN KEY (Product_ID) REFERENCES product_category (Product_ID),
    FOREIGN KEY (product_Name) REFERENCES product_details (product_Name)
)
----Size Option-----
USE ecommerce_library;
CREATE TABLE size_option(
    Size_ID VARCHAR(100) PRIMARY KEY NOT NULL,
    FOREIGN KEY (product_size) REFERENCES size_category (product_size),
    FOREIGN KEY (Product_ID) REFERENCES product_category (Product_ID),
    FOREIGN KEY (product_Name) REFERENCES product_details (product_Name)
)
-----product-attribute----
USE ecommerce_library;
CREATE TABLE product_attribute(
    material_ID VARCHAR(100) PRIMARY KEY NOT NULL,
    material_Name VARCHAR(100),
    material_Weight VARCHAR(100),
    FOREIGN KEY (Product_ID) REFERENCES product_category (Product_ID),
    FOREIGN KEY (product_Name) REFERENCES product_details (product_Name)
)
----atribute category----
USE ecommerce_library;
CREATE TABLE attribute_category(
    physical_attributes VARCHAR(100),
    technical_attributes VARCHAR(100),
    FOREIGN KEY (Product_ID) REFERENCES product_category (Product_ID),
    FOREIGN KEY (product_Name) REFERENCES product_details (product_Name)
)
-----attribute type------
USE ecommerce_library;
CREATE TABLE attribute_type(
    Felxible 
    FOREIGN KEY (Product_ID) REFERENCES product_category (Product_ID),
    FOREIGN KEY (product_Name) REFERENCES product_details (product_Name)
)


