CREATE DATABASE lab__2;

CREATE TABLE countr(
    country_id SERIAL PRIMARY KEY ,    country_name VARCHAR(255),
    region_id INT,    population INT
);

INSERT INTO countr(country_name, region_id, population) VALUES ('USA', 1, 331002651);
INSERT INTO countr (country_id, country_name) VALUES (2, 'Canada');

INSERT INTO countr (country_name, region_id, population) VALUES ('Australia', NULL, 25000000);

INSERT INTO countr (country_name, region_id, population)VALUES ('India', 3, 1393409038),
       ('China', 3, 1444216107),       ('Brazil', 2, 213993437);

ALTER TABLE countr
 country_name VARCHAR(255) DEFAULT 'Kazakhstan';
INSERT INTO countr (region_id, population) VALUES (4, 18500000);

INSERT INTO countr () VALUES ();
CREATE TABLE countr_new LIKE countr;

INSERT INTO countr_new SELECT * FROM countr;
UPDATE countr SET region_id = 1 WHERE region_id IS NULL;

SELECT country_name, population * 1.1 AS "New Population" FROM countr;
DELETE FROM countr WHERE population < 100000;

DELETE FROM countr_new WHERE country_id IN (SELECT country_id FROM countr)RETURNING *;

DELETE FROM countr RETURNING *;