/* Converting a 1:M relationship to a M:M relationship */

/*

CREATE TABLE directors_films
(
  id serial PRIMARY KEY,
  film_id integer NOT NULL REFERENCES films(id) ON DELETE CASCADE,
  director_id integer NOT NULL REFERENCES directors(id) ON DELETE CASCADE
);


ALTER TABLE films
DROP COLUMN director_id;

INSERT INTO directors_films
  (film_id, director_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 3),
  (8, 7),
  (9, 8),
  (10, 4);

SELECT films.title, directors.name
FROM films
  INNER JOIN directors_films
  ON films.id = directors_films.film_id
  INNER JOIN directors
  ON directors.id = directors_films.director_id
ORDER BY films.title;

INSERT INTO films
  (title, year, genre, duration)
VALUES
  ('Fargo', 1996, 'comedy', 98),
  ('No Country for Old Men', 2007, 'western', 122),
  ('Sin City', 2005, 'crime', 124),
  ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors
  (name)
VALUES
  ('Joel Coen'),
  ('Ethan Coen'),
  ('Frank Miller'),
  ('Robert Rodriguez');

INSERT INTO directors_films
  (film_id, director_id)
VALUES
  (11, 9),
  (12, 9),
  (12, 10),
  (13, 11),
  (13, 12),
  (14, 12);

*/

SELECT directors.name AS director, count(films.id) AS num_films
FROM directors
  LEFT OUTER JOIN directors_films -- Include directors w/o films
  ON directors.id = directors_films.director_id
  INNER JOIN films
  ON films.id = directors_films.film_id
GROUP BY directors.id
ORDER BY num_films DESC, director ASC;