----PROduct URL Table ---4
USE ecommerce_library;
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_url varchar(255),
    FOREIGN KEY (product_id) REFERENCES product_details (product_id)
);

---COLOR OPTIONS----5
USE ecommerce_library;
CREATE TABLE color_options(
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    Color_name VARCHAR(100)
);

---Product Category----2
USE ecommerce_library;
CREATE TABLE product_category(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

-----Product Details-----3
USE ecommerce_library;
CREATE TABLE product_details(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    base_price decimal(10,2),
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand_details (brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category (category_id)
);

------Product Item----6
USE ecommerce_library;
CREATE TABLE product_items(
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_name varchar(100),
    FOREIGN KEY (product_id) REFERENCES product_details (product_id)
);

----Brand----1
USE ecommerce_library;
CREATE TABLE brand_details(
   brand_id INT PRIMARY KEY AUTO_INCREMENT,
   brand_name VARCHAR(100) NOT NULL,
   brand_status VARCHAR(100),
   brand_supplier VARCHAR(100)
);
----Product Variation---7
USE ecommerce_library;
CREATE TABLE product_variation(
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    product_size VARCHAR(20),
    FOREIGN KEY (product_id) REFERENCES product_details (product_id),
    FOREIGN KEY (color_id) REFERENCES color_options (color_id)
);
    
----Size Category -----8
USE ecommerce_library;
CREATE TABLE size_category(
    size_id INT PRIMARY KEY AUTO_INCREMENT,
    size_label VARCHAR(50)
);
----Size Option-----9
USE ecommerce_library;
CREATE TABLE size_option(
    option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_id INT,
    product_id INT,
    FOREIGN KEY (size_id) REFERENCES size_category (size_id),
    FOREIGN KEY (product_id) REFERENCES product_details (product_id)
);
-----product-attribute----10
USE ecommerce_library;
CREATE TABLE product_attribute(
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    material_name VARCHAR(100),
    material_weight VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product_details (product_id)
);
----atribute category----11
USE ecommerce_library;
CREATE TABLE attribute_category(
    attribute_cat_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    physical_attributes VARCHAR(100),
    technical_attributes VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product_details (product_id)
);
-----attribute type------12
USE ecommerce_library;
CREATE TABLE attribute_type(
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_type VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product_details (product_id),
);


