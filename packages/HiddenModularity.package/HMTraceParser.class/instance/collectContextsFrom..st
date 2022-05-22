as yet unclassified
collectContextsFrom: aTDBCursor

	| contexts |
	
	contexts := self collectContextsFrom: aTDBCursor startingAt: aTDBCursor context.
	contexts add: {nil . aTDBCursor context xxxtdbproxyObject}.
	
	^ contexts