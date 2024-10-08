create database lab4;
CREATE TABLE Warehouses (
    code INTEGER PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

INSERT INTO Warehouses (code, location, capacity) VALUES
(1, 'Chicago', 3),
(2, 'Chicago', 4),
(3, 'New York', 7),
(4, 'Los Angeles', 5),
(5, 'San Francisco', 8);
CREATE TABLE Boxes (
    code CHAR(4) PRIMARY KEY,
    contents VARCHAR(255),
    value REAL,
    warehouse INTEGER,
    FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);
INSERT INTO Boxes (code, contents, value, warehouse) VALUES
('OMN7', 'Rocks', 180, 3),
('4HBP', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('6YU6', 'Papers', 50, 3),
('9JF6', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 4),
('P0H6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 150, 2)
;

SELECT * FROM Warehouses;
SELECT  * FROM  Boxes
WHERE value > 150;
SELECT DISTINCT contents from Boxes;
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse;
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;
INSERT INTO Warehouses (code, location, capacity)
VALUES (7, 'New York', 3);
INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);
UPDATE Boxes
set value = value*0.85
where code = (
    select code
    from(
        select code, row_number() over(order by value desc) as row_num
        from Boxes

        )
    AS ranked
    where row_num = 3
    );
DELETE FROM Boxes
WHERE value < 150;
DELETE FROM Boxes
WHERE warehouse IN (
    SELECT code
    FROM Warehouses
    WHERE location = 'New York'
)
RETURNING *;
