// https://codeql.github.com/docs/writing-codeql-queries/introduction-to-ql/#exercise-2
// Write a query which returns the sine of the minimum of 3^5 (3 raised to the power 5) and 245.6.

from float x, float y
where x = 3.pow(5) and y = 245.6
select x.minimum(y).sin()