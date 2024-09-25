DROP TABLE IF EXISTS countrie;
DROP TABLE IF EXISTS countrie_new;
DROP DATABASE IF EXISTS lab_2;
CREATE DATABASE lab_2;

CREATE TABLE countrie (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT 'Kazakhstan',
    region_id INT,
    population INT
);

INSERT INTO countrie (country_name, region_id, population) VALUES ('USA', 1, 331002651);
INSERT INTO countrie (country_name) VALUES ('Canada');
INSERT INTO countrie (country_name, region_id, population) VALUES ('Australia', 3, 25000000);
INSERT INTO countrie (country_name, region_id, population) VALUES
('India', 3, 1393409038),
('China', 3, 1444216107),
('Brazil', 2, 213993437);

INSERT INTO countrie (region_id, population) VALUES (4, 18500000);

CREATE TABLE countrie_new AS TABLE countrie WITH NO DATA;
INSERT INTO countrie_new SELECT * FROM countrie;

UPDATE countrie SET region_id = 1 WHERE region_id IS NULL;

SELECT country_name, population * 1.1 AS "New Population" FROM countrie;
DELETE FROM countrie WHERE population < 100000;

DELETE FROM countrie_new WHERE country_id IN (SELECT country_id FROM countrie) RETURNING *;
DELETE FROM countrie RETURNING *;
