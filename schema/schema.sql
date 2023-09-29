--Create database
CREATE DATABASE catalog;

-- Create item table
CREATE TABLE item (
  id INT PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
);

-- Create music albums table
CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  publish_date DATE NOT NULL DEFAULT DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN,
);
