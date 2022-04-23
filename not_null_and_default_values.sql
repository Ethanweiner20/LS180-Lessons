/* NOT NULL and Default Values */

/*

1. Generally, the operator will return `NULL` itself (e.g. `NULL = NULL` =>
`NULL`)

*/

/* Set a default for department
ALTER TABLE employees
ALTER COLUMN department
SET
DEFAULT 'unassigned';

Update all columns to use default
UPDATE employees
SET department = DEFAULT
WHERE department IS NULL;

Now that department column is filled, we can add a NOT NULL constraint
ALTER TABLE employees
ALTER COLUMN department
SET
NOT NULL;

CREATE TABLE temperatures
(
  "date" date NOT NULL,
  low integer NOT NULL,
  high integer NOT NULL
);

INSERT INTO temperatures
VALUES
  ('2016-03-01', 34, 43);
INSERT INTO temperatures
VALUES
  ('2016-03-02', 32, 44);
INSERT INTO temperatures
VALUES
  ('2016-03-03', 31, 47);
INSERT INTO temperatures
VALUES
  ('2016-03-04', 33, 42);
INSERT INTO temperatures
VALUES
  ('2016-03-05', 39, 46);
INSERT INTO temperatures
VALUES
  ('2016-03-06', 32, 43);
INSERT INTO temperatures
VALUES
  ('2016-03-07', 29, 32);
INSERT INTO temperatures
VALUES
  ('2016-03-08', 23, 31);
INSERT INTO temperatures
VALUES
  ('2016-03-09', 17, 28);

SELECT "date", round((high + low) / 2.0, 1) AS "average"
FROM temperatures
WHERE "date" >= '2016-03-02' AND "date" <= '2016-03-08'

ALTER TABLE temperatures
ADD COLUMN rainfall integer DEFAULT 0;

*/

/* For any days above 35 degrees, update rainfall by 1mm/degree above 35) */

/*

UPDATE temperatures
SET rainfall = (high + low) / 2 - 35
WHERE (high + low) / 2 > 35;

SELECT *
FROM temperatures;

*/

/* Updating to inches:
1. Allow decimal values in rainfall column (4, 3)
2. Manually update all rainfall columns using conversion factor

UPDATE temperatures
SET rainfall = rainfall / 25.4;

ALTER TABLE temperatures
RENAME TO weather;

\d weather

*/