/* Keys */

/*

CREATE SEQUENCE counter;

SELECT nextval('counter'
::regclass);

DROP SEQUENCE counter;

Yes, it is possibel, we must simply specify a different increment for the
sequence. We might also need to start the sequence at an even # (0)


CREATE SEQUENCE even_numbers
INCREMENT BY 2
MINVALUE 0;

SELECT nextval('even_numbers'
::regclass);
SELECT nextval('even_numbers'
::regclass);

The name of the sequence will be "regions_id_seq"


ALTER TABLE films
ADD COLUMN
id serial PRIMARY KEY;

We will receive an error specifying that a unique constraint is violated for the
primary key. This is not the same as the UNIQUE constraint, but it has the same
effect.

INSERT INTO films
VALUES
  ('Test', 2020, 'Horror', 'Test Director', 120, 2);

We will receive an error stating that only one column can be designated as the
primary key column.

ALTER TABLE films
ADD COLUMN
film_id serial PRIMARY KEY;

We need to drop the `PRIMARY KEY` constraint from the id column.

*/

ALTER TABLE films
DROP CONSTRAINT "films_pkey";