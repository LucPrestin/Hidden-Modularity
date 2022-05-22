as yet unclassified
messageGraphFromCursor: aTDBCursor

	^ self messageGraphFromContexts: (self collectContextsFrom: aTDBCursor)


	