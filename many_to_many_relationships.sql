/* Many to Many Relationships */

/*

ALTER TABLE books_categories
DROP CONSTRAINT books_categories_book_id_fkey
, 
DROP CONSTRAINT books_categories_category_id_fkey;

ALTER TABLE books_categories
ALTER COLUMN book_id
SET
NOT NULL,
ALTER COLUMN category_id
SET
NOT NULL,
ADD FOREIGN KEY
(book_id) REFERENCES books
(id) ON
DELETE CASCADE,
ADD FOREIGN KEY
(category_id) REFERENCES categories
(id) ON
DELETE CASCADE;

SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories
FROM books
  INNER JOIN books_categories
  ON books.id = books_categories.book_id
  INNER JOIN categories
  ON categories.id = books_categories.category_id
GROUP BY books.id
ORDER BY books.id;

We need to increase the maximum length allowed by the `books.title` column
in order to fit the new book titles.

ALTER TABLE books
ALTER COLUMN title
TYPE
varchar
(100);

INSERT INTO books
  (title, author)
VALUES
  ('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
  ('Jane Eyrje', 'Charlotte Brontë'),
  ('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikhram Vij');

INSERT INTO categories
  (name)
VALUES
  ('Space Exploration'),
  ('Cookbook'),
  ('South Asia');

INSERT INTO books_categories
  (book_id, category_id)
VALUES
  (4, 5),
  (4, 1),
  (4, 7),
  (5, 2),
  (5, 4),
  (6, 8),
  (6, 1),
  (6, 9);

ALTER TABLE books_categories
ADD UNIQUE (book_id, category_id);

*/

SELECT
  categories.name,
  count(books.id) AS book_count,
  string_agg(books.title, ', ') AS book_titles
FROM categories
  INNER JOIN books_categories
  ON categories.id = books_categories.category_id
  INNER JOIN books
  ON books.id = books_categories.book_id
GROUP BY categories.id
ORDER BY categories.name;