/* More Constraints */

/*

ALTER TABLE films
ALTER COLUMN title
SET
NOT NULL,
ALTER COLUMN "year"
SET
NOT NULL,
ALTER COLUMN genre
SET
NOT NULL,
ALTER COLUMN director
SET
NOT NULL,
ALTER COLUMN duration
SET
NOT NULL;

\d describes the schema of a table, so in the `Nullable` column describing each
column, the "not null" constraint will now be present.

*/

/*

ALTER TABLE films
ADD UNIQUE (title);

This new constraint creates an index for the `title` column, specifying that its
values have a `UNIQUE CONSTRAINT`.

ALTER TABLE FILMS
DROP CONSTRAINT films_title_key;

ALTER TABLE FILMS
ADD CONSTRAINT non_empty_title
CHECK (length(title) >= 1);

If this constraint is violated, there will be an error indicating that the
check constraint is violated, and the row(s) will not be added.

INSERT INTO films
VALUES
  ('', 2020, 'Horror', 'Stephen King', 120);

This constraint is displayed as a named constraint at the bottom of the table.
It is listed under the "Check constraints" section.

ALTER TABLE films
DROP CONSTRAINT non_empty_title;

ALTER TABLE films
ADD CONSTRAINT year_range
CHECK("year" BETWEEN 1900 AND 2100);

Again, this constraint is displayed as a named "Check constraint" at the bottom
of the table (this indicates that it is a "table constraint").

ALTER TABLE FILMS
ADD CONSTRAINT director_name
CHECK(length(director) >= 3 AND position(' ' IN director) > 0);

The above constraint appears as a "Check constraint" in the table schema.

UPDATE films
SET director = 'Johnny'
WHERE title = 'Die Hard';

*/

/*

16.

3 ways to use schema to restrict column values:

1. Use data types representative of the column values (the more specific the better)
- Possible length limitation
2. Add CHECK constraints to disallow any values that violate such constraints
3. Add NOT NULL constraints to guarantee that non-null values must be entered
into the column.

17. Is it possible to define a default value that violates a constraint?

It is possible to define a default value that violates a constraint. Constraints
do not limit the existence of other parts of database schema; they only come
into play during insertion into the table.

CREATE TABLE lengths
(
  length integer DEFAULT 0,
  CHECK(length > 1)
);

ALTER TABLE lengths
ADD
CHECK
(length < 0);

Main Ideas:
- NOT NULL and DEFAULT constraints are added a bit differentely (use SET)
- Constraints are important in protecting a database & adding consistency
for database users
- We can easily view constraints using \d (at bottom)
- Conflicting constraints/defaults can be added without error
- However, we can not insert data that violates any constraints

*/