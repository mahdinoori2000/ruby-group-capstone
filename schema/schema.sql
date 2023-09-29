--Create database
CREATE DATABASE catalog;
-- Create item table
CREATE TABLE item (
  id INT PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
);
