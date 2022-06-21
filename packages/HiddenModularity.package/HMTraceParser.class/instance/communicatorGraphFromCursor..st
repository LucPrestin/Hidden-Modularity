communicator graph
communicatorGraphFromCursor: aTDBCursor

	^ self communicatorGraphFromContexts: (self collectContextsFrom: aTDBCursor)
