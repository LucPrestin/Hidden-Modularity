graph construction
methodBasedGraphFromCursor: aTDBCursor
	
	| contexts cleanedContexts |
	
	contexts := self collectContextsFrom: aTDBCursor.
	cleanedContexts := self collectValidContextPairsFrom: contexts.
	
	^ self buildGraphFromCommunicators: cleanedContexts
