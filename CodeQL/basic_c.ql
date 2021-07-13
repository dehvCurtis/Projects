import cpp

from IfStmt ifstmt, Block block
where ifstmt.getThen() = block
	and block.getNumStmt() = 0
select ifstmt, "this 'if' statement is redundant"