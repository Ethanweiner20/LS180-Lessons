/*

Data Types

1. The `text` data type can include an unlimited # of characters, whereas
`varchar` is limited to the # of characters specified by the column. `text` is
usually the recommended data type.

2. Unlike `decimal` and `real`, `integer` is used to store whole numbers only
(positive and negative). The `decimal` data type specifies a particular
precision and scale, while the `real` data type does not. Furthermore, the
`integer` data type is limited in its size.

3. The largest value than can be stored in an integer column is 
+2147483647.

4. The `timestamp` data type includes both a date and time in ISO format,
while the `date` data type only includes the date ('YYYY-MM-DD').

5. No, but we can use the data type `timestamp with time zone` to 
store a timestamp with a timezone.

*/