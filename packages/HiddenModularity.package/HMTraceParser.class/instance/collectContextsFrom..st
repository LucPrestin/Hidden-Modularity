information retrieving
collectContextsFrom: aTDBCursor

	| contexts initialContexts |
	
	contexts := OrderedCollection new.
	
	"ignore the scenario method"
	initialContexts := aTDBCursor childContextsFor: aTDBCursor context.
	
	initialContexts do: [:contextProxy |
		contexts add: {nil . contextProxy tdbproxyYourself}.
		contexts addAll: (self collectContextsFrom: aTDBCursor startingAt: contextProxy)].
	
	^ contexts