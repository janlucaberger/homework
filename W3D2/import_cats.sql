CREATE TABLE cats (
  id INTEGER PRIMARY key,
  name VARCHAR(100),
  gender BOOLEAN,
  birth_date DATE
);


INSERT INTO
  cats (name, gender, birth_date)
VALUES
  ('Tom', 0, 2017-01-01),
  ('Jerry', 1, 2017-11-01);
