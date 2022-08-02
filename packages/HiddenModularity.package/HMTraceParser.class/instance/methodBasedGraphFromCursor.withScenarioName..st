as yet unclassified
methodBasedGraphFromCursor: aTDBCursor withScenarioName: aString
	
	| contexts cleanedContexts |
	
	contexts := self collectContextsFrom: aTDBCursor.
	cleanedContexts := self collectValidContextPairsFrom: contexts.
	
	^ self buildGraphFromCommunicators: cleanedContexts withScenarioName: aString
