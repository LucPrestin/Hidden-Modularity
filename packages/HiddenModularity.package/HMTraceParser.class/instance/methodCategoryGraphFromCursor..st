method category graph
methodCategoryGraphFromCursor: aTDBCursor

	^ self methodCategoryGraphFromContexts: (self collectContextsFrom: aTDBCursor)
