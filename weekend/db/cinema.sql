DROP TABLE tickets IF EXISTS;
DROP TABLE customers IF EXISTS;
DROP TABLE films IF EXISTS;

CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT8
);

CREATE TABLE films(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  price INT8
);

CREATE TABLE tickets(
  id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers(id),
  film_id INT8 REFERENCES films(id)
);
