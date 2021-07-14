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
// no definition found for ntohll

// import cpp
// from Macro m 
// where m.getName().regexpMatch("ntoh(l|ll|s)")
// select m

// Step 1: Finding the calls to memcpy, ntohl, ntohll, and ntohs
// Question 1.0: Find all the calls to memcpy. Hint: Use the auto-completion feature on the function call variable to 
//   guess how to express the relation between a function call and a function, and how to bind them.

//import cpp
//from FunctionCall c
//where c.getTarget().toString() = "memcpy"
//select c

// Question 1.1: Find all the calls to ntohl, ntohll, and ntohs. Hint: calls to ntohl, ntohll, and ntohs are macro invocations, 
//   unlike memcpy which is a function call.

// got stuck on this for awhile, until i realized that the project I was querying (fish-shell) simply doesn't contain any of these Function calls. After widening my search to torvalds/linus, i was able to find some results.

import cpp
from MacroInvocation mi
where mi.getMacroName().regexpMatch("ntoh(s|l|ll)")
// where mi.getMacroName() = "ntohs" or mi.getMacroName() = "ntohl" or mi.getMacroName() = "ntohll"
select mi

// Question 1.2: Find the expressions that resulted in these macro invocations.

// Hint: We need to get the expression of the macro invocation we found in 1.1