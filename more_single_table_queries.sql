/* More Single Table Queries */

/*

SELECT state, count(id) as count
FROM people
GROUP BY state
ORDER BY count DESC
LIMIT 10;

*/

/*

Requirements:
- Group residents by email address domain
- Order by size of each group in descending order (split_part)

Implementation:
- Need a function that can find domain

SELECT split_part(email, '@', 2) AS domain, count(id) AS num_people
FROM people
GROUP BY domain
ORDER BY num_people DESC;

DELETE FROM people
WHERE id = 3399;

DELETE FROM people
WHERE state = 'CA';

UPDATE people
SET given_name = upper(given_name)
WHERE email LIKE '%teleworm.us%';

*/

DELETE FROM people;