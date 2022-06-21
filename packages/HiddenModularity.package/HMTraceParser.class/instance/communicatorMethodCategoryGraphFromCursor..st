communicator method category graph
communicatorMethodCategoryGraphFromCursor: aTDBCursor

	^ self communicatorMethodCategoryGraphFromContexts: (self collectContextsFrom: aTDBCursor)
