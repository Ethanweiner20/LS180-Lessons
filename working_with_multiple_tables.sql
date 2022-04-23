/* Working with Multiple Table */

/*

SELECT count(id)
FROM tickets;


SELECT count(DISTINCT customer_id)
FROM tickets;

SELECT count(DISTINCT customers.id)
FROM customers
  INNER JOIN tickets
  ON customers.id = tickets.customer_id;

What percentage of customers have purchased at least one ticket?

Idea: Count all customer ids + count distinct customer ids in tickets table ->
find percentage


SELECT round(count(DISTINCT tickets.customer_id) * 100.0 /
             count(DISTINCT customers.id), 2)
AS percent
FROM customers
  LEFT OUTER JOIN tickets
  ON customers.id = tickets.customer_id;

*/

/*

Write a query that returns the name of each event and how many tickets were
sold for it, in order from most popular to least popular. 


SELECT events.name, count(tickets.id) AS popularity
FROM events
  LEFT OUTER JOIN tickets
  ON events.id = tickets.event_id
GROUP BY events.id
ORDER BY popularity DESC;

What we need to do:
- Create a join table

SELECT customers.id, customers.email, count(DISTINCT tickets.event_id)
FROM customers
  JOIN tickets
  ON customers.id = tickets.customer_id
GROUP BY customers.id
HAVING count(DISTINCT tickets.event_id) = 3;

*/

SELECT e.name AS event, e.starts_at, sc.name AS section, st.row, st.number AS seat
FROM tickets t
  JOIN customers c -- So far: All tickets + associated customers
  ON t.customer_id = c.id
  JOIN events e
  ON t.event_id = e.id
  JOIN seats st
  ON st.id = t.seat_id
  JOIN sections sc
  ON sc.id = st.section_id
WHERE c.email = 'gennaro.rath@mcdermott.co';