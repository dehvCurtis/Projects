// https://codeql.github.com/docs/writing-codeql-queries/introduction-to-ql/#exercise-3
// Example 3
// Write a query which returns the opposite of the boolean false.

from boolean x
where x = true
select x.booleanNot()