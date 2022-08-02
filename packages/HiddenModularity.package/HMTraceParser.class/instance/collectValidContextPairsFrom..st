as yet unclassified
collectValidContextPairsFrom: contexts 

	| result |

	result := OrderedCollection new.
	
	contexts do: [:contextPair | 
		(contextPair first isNil or: contextPair second isNil) ifFalse: [result add: contextPair]].
	
	^ result
