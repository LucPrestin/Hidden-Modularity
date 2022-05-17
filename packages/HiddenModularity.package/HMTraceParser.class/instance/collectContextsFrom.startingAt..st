as yet unclassified
collectContextsFrom: aTDBCursor startingAt: aContextProxy

	| childContexts contexts |
	
	contexts := OrderedCollection new.
	childContexts := aTDBCursor childContextsFor: aContextProxy.
	
	childContexts do: [:cContextProxy | 
		contexts addAll: (self collectContextsFrom: aTDBCursor startingAt: cContextProxy).
		contexts add: {aContextProxy xxxtdbproxyObject . cContextProxy xxxtdbproxyObject}
	].
	
	^ contexts