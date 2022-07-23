-- script that create database
-- cat create_db_bb.sql | mysql -uroot -p
DROP DATABASE IF EXISTS bb_products;
CREATE DATABASE IF NOT EXISTS bb_products;
SHOW DATABASES;
USE bb_products;

CREATE TABLE IF NOT EXISTS category (
    category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name_category VARCHAR(30) NOT NULL,
    PRIMARY KEY (category_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS mark (
    mark_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name_mark VARCHAR(30) NOT NULL,
    PRIMARY KEY (mark_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS products (
    product_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name_product VARCHAR(30) NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    mark_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id),
    FOREIGN KEY (mark_id) REFERENCES mark (mark_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS providers (
    provider_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    provider_name VARCHAR(30) NOT NULL,
    phone VARCHAR(25) NOT NULL,
    provider_address VARCHAR(50) NOT NULL,
    PRIMARY KEY (provider_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS purchases (
    purchase_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    purchase_date DATE NOT NULL,
    factura VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS stock (
    stock_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    purchase_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    provider_id INT UNSIGNED NOT NULL,
    purchase_price INT NOT NULL,
    sales_price INT NOT NULL,
    amount INT NOT NULL,
    sales INT,
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    FOREIGN KEY (purchase_id) REFERENCES purchases (purchase_id),
    FOREIGN KEY (provider_id) REFERENCES providers (provider_id),
    PRIMARY KEY (stock_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS sales (
    sale_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sale_date DATE NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    stock_id INT UNSIGNED NOT NULL,
    amount INT NOT NULL,
    sales_price INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    FOREIGN KEY (stock_id) REFERENCES stock (stock_id),
    PRIMARY KEY (sale_id)
) ENGINE=INNODB;

SHOW DATABASES;
SHOW TABLES;
