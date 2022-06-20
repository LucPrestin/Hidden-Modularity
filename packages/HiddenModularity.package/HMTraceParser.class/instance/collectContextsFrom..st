information retrieving
collectContextsFrom: aTDBCursor

	| contexts |
	
	contexts := OrderedCollection new.
	contexts add: {nil . aTDBCursor context tdbproxyYourself}.
	contexts addAll: (self collectContextsFrom: aTDBCursor startingAt: aTDBCursor context).
	
	^ contexts