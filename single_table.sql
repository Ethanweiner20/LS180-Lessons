/* Single Table */

/*

CREATE TABLE people
(
  name varchar(255),
  age integer,
  occupation varchar(255)
);

INSERT INTO people
VALUES
  ('Abby', 34, 'biologist'),
  ('Mu''nisah', 26, NULL),
  -- Optionally specify `NULL`
  ('Mirabelle', 40, 'contractor');

SELECT *
FROM people
WHERE name = 'Mu''nisah';

SELECT *
FROM people
ORDER BY age
LIMIT 1;

SELECT * FROM people
WHERE occupation IS NULL;


CREATE TABLE birds
(
  name varchar(255),
  length decimal(4,1),
  wingspan decimal(4,1),
  family text,
  extinct boolean
);

INSERT INTO birds
VALUES
  ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
  ('American Robin', 25.5, 36.0, 'Turbidae', false),
  ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
  ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
  ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);

SELECT name, family
FROM birds
WHERE extinct = false
ORDER BY length DESC;


SELECT round(avg(wingspan), 1) as "avg", min(wingspan), max(wingspan)
FROM birds;

CREATE TABLE menu_items
(
  item text,
  prep_time integer,
  ingredient_cost decimal(4,2),
  sales integer,
  menu_price decimal(4,2)
);

INSERT INTO menu_items
VALUES
  ('omelete', 10, 1.50, 182, 7.99),
  ('tacos', 5, 2.00, 254, 8.99),
  ('oatmeal', 1, 0.50, 79, 5.99);

SELECT item, menu_price - ingredient_cost AS profit
FROM menu_items
ORDER BY menu_price - ingredient_cost DESC
LIMIT 1;

*/

/*

Determine the profits from each item
- Include the cost associated with prep time
- Order by profit (descending)

Profit = menu_price - ingredient_cost - prep_time/60 (hrs) * 13 ($/hr)

*/

SELECT
  item, menu_price, ingredient_cost,
  round(prep_time * 13.0 / 60, 2) AS labor,
  menu_price - ingredient_cost - round(prep_time * 13.0 / 60, 2) AS profit
FROM menu_items
ORDER BY profit DESC;