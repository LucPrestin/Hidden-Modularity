method category graph
messageCategoryGraphFromCursor: aTDBCursor

	^ self messageCategoryGraphFromContexts: (self collectContextsFrom: aTDBCursor)
