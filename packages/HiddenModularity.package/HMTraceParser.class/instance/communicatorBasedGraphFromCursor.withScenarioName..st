graph construction
communicatorBasedGraphFromCursor: aTDBCursor withScenarioName: aString

	| contexts communicators |
	
	contexts := self collectContextsFrom: aTDBCursor.
	communicators := self collectCommunicatorsFrom: contexts.
	
	^ self buildGraphFromCommunicators: communicators withScenarioName: aString
