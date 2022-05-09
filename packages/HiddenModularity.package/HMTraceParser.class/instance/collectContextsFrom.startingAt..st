as yet unclassified
collectContextsFrom: aTDBCursor startingAt: aContext

	| childContexts contexts |
	
	contexts := OrderedCollection new.
	childContexts := aTDBCursor childContextsFor: aContext.
	
	childContexts do: [:cContext | 
		contexts addAll: (self collectContextsFrom: aTDBCursor startingAt: cContext).
		contexts add: cContext
	].
	
	^ contexts