--Create database
CREATE DATABASE catalog;

-- Create item table
CREATE TABLE item (
  id INT PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN
);

-- Create music albums table
CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  publish_date DATE NOT NULL,
  on_spotify BOOLEAN,
  archived BOOLEAN
);

-- Create music albums table
CREATE TABLE genre (
  id INT PRIMARY KEY,
  name VARCHAR(100)
);

-- Create book table
CREATE TABLE book (
  publisher VARCHAR(100),
  cover_state BOOLEAN,
  publish_date DATE
);

-- Create label table
CREATE TABLE label (
  id INT PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE game (
  multiplayer VARCHAR(100),
  last_played_at DATE
);

CREATE TABLE source (
  id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE movie (
title VARCHAR(50),
silet BOOLEAN,
genre VARCHAR(100),
label VARCHAR(100),
publish_date DATE
);

CREATE TABLE author (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);
