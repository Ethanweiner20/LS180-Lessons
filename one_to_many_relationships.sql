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

*/