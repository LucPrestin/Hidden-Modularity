message graph construction
messageGraphFromCursor: aTDBCursor

	^ self messageGraphFromContexts: (self collectContextsFrom: aTDBCursor)
