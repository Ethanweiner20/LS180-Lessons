-- The SQL Language

/*

SQL is a declarative, "special purpose" language.

SQL's 3 sublanguages are:
- DDL (data definition language)
- DML (data manipulation language)
- DCL (data control language)

'canoe'
'a long road'
'weren''t'
'"No way!"'

String concatenation can be performed using the `+` operator:

e.g. <col1> || <col2> AS "Combined Columns"

The lower() function transforms a string to its lowercase version

e.g. SELECT lower('UPPER');
e.g. SELECT lower(name) FROM users;

The psql console displays true and false values as t/f.

*/

SELECT round(4 * pi() * 26.3 ^ 2) as "Surface Area";

