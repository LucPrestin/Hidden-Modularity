as yet unclassified
collectContextsFrom: aTDBCursor

	| contexts |
	
	contexts :=  self collectContextsFrom: aTDBCursor startingAt: aTDBCursor context.
	contexts add: aTDBCursor context.
	
	^ contexts