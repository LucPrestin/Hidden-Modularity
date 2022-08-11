scenario
zeroDivideHandling
	<scenario>

	^ TDBCursor
		traceForBlock: [[2 / 0]
				on: ZeroDivide
				do: [:ex | ex resume: 0]]
