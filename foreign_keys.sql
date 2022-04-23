/* Foreign Keys */

/*

ALTER TABLE orders
ADD CONSTRAINT orders_product_id_fkey
FOREIGN KEY (product_id)
REFERENCES products(id);

INSERT INTO products
  (name)
VALUES
  ('small bolt'),
  ('large bolt');


INSERT INTO orders
  (quantity, product_id)
VALUES
  (10, 1),
  (25, 1),
  (15, 2);

SELECT orders.quantity, products.name
FROM orders
  JOIN products
  ON orders.product_id = products.id;

Yes, we can insert a row into `orders` without a `product_id`. This is because
unlike the primary key constraint, the foreign key constraint does not add a
`NOT NULL` constraint to the given column; it is completely sensible for an
entry to not need to reference another entry. In the current state of the
relationship, the products side has a modality of 0, because an order does not
require a product.

INSERT INTO orders
  (quantity)
VALUES
  (100);

If we enforce the foreign key (product_id) to be non-nullable, we'll receive
an error, because an order exists without a product id. To fix this, we need to
remove the order without a product id. Now, we have a one-to-many relationship
from products to orders in which an order must have a product id (modality = 1).

DELETE FROM orders
WHERE product_id IS NULL;

ALTER TABLE orders
ALTER COLUMN product_id
SET
NOT NULL;

CREATE TABLE reviews
(
  id serial PRIMARY KEY,
  body text NOT NULL,
  product_id integer REFERENCES products(id)
);

INSERT INTO reviews
  (body, product_id)
VALUES
  ('a little small', 1),
  ('very round!', 1),
  ('could have been smaller', 2);

False; A foreign key constraint simply enforces referential integrity. It
does not enforce non-null values to be entered. We can add rows without
foreign keys.

*/