as yet unclassified
collectCommunicatorsFrom: contexts 

	^ contexts	collect: [:contextPair | {
			contextPair first
				ifNotNil: [contextPair first receiver]. 
			contextPair second
				ifNotNil: [contextPair second receiver]}]