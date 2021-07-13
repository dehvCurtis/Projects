import cpp

from IfStmt ifstmt, Block block
where ifstmt.getThen() = block
	and block.getNumStmt() = 0
	and not ifstmt.hasElse()
select ifstmt, "this 'if' statement is redundant"