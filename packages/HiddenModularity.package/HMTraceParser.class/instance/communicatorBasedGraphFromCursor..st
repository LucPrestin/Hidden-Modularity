graph construction
communicatorBasedGraphFromCursor: aTDBCursor

	| contexts communicators |
	
	contexts := self collectContextsFrom: aTDBCursor.
	communicators := self collectCommunicatorsFrom: contexts.
	
	^ self buildGraphFromCommunicators: communicators
