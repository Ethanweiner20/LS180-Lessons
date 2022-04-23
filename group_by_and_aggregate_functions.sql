/* GROUP BY and Aggregate Functions */

/*

INSERT INTO films
  (title, "year", genre, director, duration)
VALUES
  ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
  ('Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);

List all genres for which there is a movie.

1. Group the films table into genres
Note: If the genre appears in the result, then a film must have had that genre


SELECT DISTINCT genre
FROM films;

SELECT genre
FROM films
GROUP BY genre;

SELECT round(avg(duration)) AS average_duration
FROM films;

SELECT genre, round(avg(duration)) AS average_duration
FROM films
GROUP BY genre;

Grouping by decade:
- To determine the decade of a given value, we must round down to the nearest
tens.

Idea: Cast to string -> Select first 3 -> Concatenate with 0
-- First solution: Casting to strings

SELECT substring("year"::text from 1
for 3) || '0' AS decade, round
(avg
(duration)) AS average_duration
FROM films
GROUP BY decade
ORDER BY decade;

-- Second solution: Using mathematical operations

SELECT year / 10 * 10 AS decade,
  round(avg(duration)) AS average_duration
FROM films
GROUP BY decade
ORDER BY decade;


SELECT *
FROM films
WHERE split_part(director, ' ', 1) = 'John';

SELECT *
FROM films
WHERE director LIKE 'John%';

Group by genres, count the # of movies for each genre


SELECT genre, count(id)
FROM films
GROUP BY genre
ORDER BY count DESC;

- Group by decade and genre
- Select decade, genre, films concatenated


SELECT year / 10 * 10 AS decade, genre, string_agg(title, ', ') AS films
FROM films
GROUP BY decade, genre
ORDER BY decade, genre;

*/

SELECT genre, sum(duration) AS total_duration
FROM films
GROUP BY genre
ORDER BY total_duration, genre ASC;