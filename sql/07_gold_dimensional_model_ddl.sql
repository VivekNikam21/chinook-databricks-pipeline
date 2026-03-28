-- Chinook Gold Layer — Dimensional Model DDL
-- Portable SQL for import into data modeling tools (DBeaver, Navicat, dbdiagram.io)
-- Azure SQL compatible syntax

DROP TABLE IF EXISTS fact_sales_customer_agg;
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_track;
DROP TABLE IF EXISTS dim_album;
DROP TABLE IF EXISTS dim_artist;
DROP TABLE IF EXISTS dim_genre;
DROP TABLE IF EXISTS dim_media_type;
DROP TABLE IF EXISTS dim_employee;
DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_customer (
  customer_key BIGINT PRIMARY KEY,
  customer_id INT,
  first_name NVARCHAR(100),
  last_name NVARCHAR(100),
  company NVARCHAR(200),
  address NVARCHAR(200),
  city NVARCHAR(100),
  state NVARCHAR(100),
  country NVARCHAR(100),
  postal_code NVARCHAR(20),
  phone NVARCHAR(50),
  fax NVARCHAR(50),
  email NVARCHAR(100),
  support_rep_id INT,
  row_hash NVARCHAR(256),
  effective_start_date DATETIME,
  effective_end_date DATE,
  is_current BIT
);

CREATE TABLE dim_track (
  track_key INT PRIMARY KEY,
  track_id INT,
  track_name NVARCHAR(200),
  album_id INT,
  media_type_id INT,
  genre_id INT,
  composer NVARCHAR(250),
  milliseconds INT,
  bytes INT,
  unit_price DECIMAL(10,2)
);

CREATE TABLE dim_album (
  album_key INT PRIMARY KEY,
  album_id INT,
  album_title NVARCHAR(200),
  artist_id INT,
  artist_name NVARCHAR(150)
);

CREATE TABLE dim_artist (
  artist_key INT PRIMARY KEY,
  artist_id INT,
  artist_name NVARCHAR(150)
);

CREATE TABLE dim_genre (
  genre_key INT PRIMARY KEY,
  genre_id INT,
  genre_name NVARCHAR(150)
);

CREATE TABLE dim_media_type (
  media_type_key INT PRIMARY KEY,
  media_type_id INT,
  media_type_name NVARCHAR(150)
);

CREATE TABLE dim_employee (
  employee_key INT PRIMARY KEY,
  employee_id INT,
  first_name NVARCHAR(50),
  last_name NVARCHAR(50),
  title NVARCHAR(100),
  reports_to INT,
  birth_date DATETIME,
  hire_date DATETIME,
  city NVARCHAR(100),
  state NVARCHAR(100),
  country NVARCHAR(100),
  email NVARCHAR(100)
);

CREATE TABLE dim_date (
  date_key BIGINT PRIMARY KEY,
  full_date DATE,
  year INT,
  quarter INT,
  month INT,
  month_name NVARCHAR(20),
  day INT,
  day_of_week INT,
  day_name NVARCHAR(20),
  is_weekend INT
);

CREATE TABLE fact_sales (
  sales_line_key INT PRIMARY KEY,
  invoice_id INT,
  track_key INT,
  customer_id INT,
  customer_key BIGINT,
  album_key INT,
  genre_key INT,
  media_type_key INT,
  date_key BIGINT,
  invoice_date DATETIME,
  quantity INT,
  unit_price DECIMAL(10,2),
  line_amount DECIMAL(10,2),
  invoice_total DECIMAL(10,2),
  employee_key INT,
  FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
  FOREIGN KEY (track_key) REFERENCES dim_track(track_key),
  FOREIGN KEY (album_key) REFERENCES dim_album(album_key),
  FOREIGN KEY (genre_key) REFERENCES dim_genre(genre_key),
  FOREIGN KEY (media_type_key) REFERENCES dim_media_type(media_type_key),
  FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
  FOREIGN KEY (employee_key) REFERENCES dim_employee(employee_key)
);

CREATE TABLE fact_sales_customer_agg (
  customer_key BIGINT,
  customer_id INT,
  total_invoices BIGINT,
  total_items_purchased BIGINT,
  total_sales_amount DECIMAL(20,2),
  first_purchase_date DATETIME,
  last_purchase_date DATETIME,
  distinct_tracks_purchased BIGINT,
  distinct_genres BIGINT,
  FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key)
);
