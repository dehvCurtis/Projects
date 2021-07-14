// Step 0: Finding the definition of memcpy, ntohl, ntohll, and ntohs
// Question 0.0: Can you work out what the above query is doing? Hint: Paste it in the Query Console and run it.

//import cpp
//from Function f
//where f.getName() = "strlen"
//select f

// Question 0.1: Modify the query to find the definition of memcpy. Hint: Queries have a from, where, and select clause. 

//import cpp
//from Function f
//where f.getName() = "memcpy"
//select f

// Question 0.2: ntohl, ntohll, and ntohs can either be functions or macros (depending on the platform where the code is compiled).
//	As these snapshots for U-Boot were built on Linux, we know they are going to be macros. Write a query to find the definition of these macros.
//	Hint: The CodeQL Query Console has an auto-completion feature. Hit Ctrl-Space after the from clause to get the list of objects you can query. Wait a second after typing myObject. to get the list of methods.
//  Hint: We can use a regular expression to write a query that searches for all three macros at once.

//import cpp
//from Macro m 
//where m.getName() = "ntohl"
//	and m.getName() = "ntohll"
//	and m.getName() = "ntohs"
//select m

// at first i tried linking via `and` statements until I saw the hint. It also took me a moment to figure out the regexpMatch. For some reason i couldn't find a reference to regexpMatch in the library search https://codeql.github.com/codeql-standard-libraries/search.html?addsearch=regexpmatch. I found a reference on https://codeql.github.com/docs/writing-codeql-queries/introduction-to-ql/

import cpp
from Macro m 
where m.getName().regexpMatch("ntoh(l|ll|s)")
select m