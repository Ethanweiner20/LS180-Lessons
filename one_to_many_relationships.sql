/* One to Many Relationships */

/*

INSERT INTO calls
  ("when", duration, contact_id)
VALUES
  ('2016-01-18 14:47:00', 632, 6);


SELECT calls."when", calls.duration, contacts.first_name
FROM calls
  INNER JOIN contacts
  ON calls.contact_id = contacts.id
WHERE (contacts.first_name || ' ' || contacts.last_name) != 'William Swift';

INSERT INTO CONTACTS
  (first_name, last_name, number)
VALUES
  ('Merve', 'Elk', 6343511126),
  ('Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls
  ("when", duration, contact_id)
VALUES
  ('2016-01-17 11:52:00', 175, 26),
  ('2016-01-18 21:22:00', 79, 27);

ALTER TABLE contacts
ADD CONSTRAINT unique_number
UNIQUE (number);

The error that will be shown will state that the unique constraint is valuated
for the `numbers` column.

INSERT INTO contacts
  (first_name, last_name, number)
VALUES
  ('Ethan', 'Weiner', 7204890809);

"when" is a SQL keyword, so we must quote it in order to notify SQL that we
intend to use "when" as an identifier, not a keyword. This forces "when" to
reference the column "when", rather than the SQL keyword "when". 

ERD:

|-------|        |----------|
| calls |>o---||-| contacts |
|-------|        |----------|

One contact to many calls (0 or more; not required)
A call requires a contact (exactly 1)


INSERT INTO directors
  (name)
VALUES
  ('John McTiernan');
INSERT INTO directors
  (name)
VALUES
  ('Michael Curtiz');
INSERT INTO directors
  (name)
VALUES
  ('Francis Ford Coppola');
INSERT INTO directors
  (name)
VALUES
  ('Michael Anderson');
INSERT INTO directors
  (name)
VALUES
  ('Tomas Alfredson');
INSERT INTO directors
  (name)
VALUES
  ('Mike Nichols');


UPDATE films SET director_id=1 WHERE director = 'John McTiernan';
UPDATE films SET director_id=2 WHERE director = 'Michael Curtiz';
UPDATE films SET director_id=3 WHERE director = 'Francis Ford Coppola';
UPDATE films SET director_id=4 WHERE director = 'Michael Anderson';
UPDATE films SET director_id=5 WHERE director = 'Tomas Alfredson';
UPDATE films SET director_id=6 WHERE director = 'Mike Nichols';

ALTER TABLE directors
ADD CONSTRAINT valid_name
CHECK (length(name) >= 1 AND position(' ' in name) > 0);

*/

SELECT title, "year", genre, directors.name AS director, duration
FROM films
  JOIN directors
  ON films.director_id = directors.id;