message category graph construction
messageCategoryGraphFromCursor: aTDBCursor

	^ self messageCategoryGraphFromContexts: (self collectContextsFrom: aTDBCursor)
