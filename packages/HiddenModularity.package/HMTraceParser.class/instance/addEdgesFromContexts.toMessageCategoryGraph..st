method category graph
addEdgesFromContexts: contexts toMessageCategoryGraph: graph 

	contexts
		do: [:contextPair | 
			| aBlock firstMethodReference secondMethodReference |
			firstMethodReference := contextPair first method methodReference.
			secondMethodReference := contextPair second method methodReference.
			aBlock := [:reference | reference classSymbol asString , ' ' , reference category asString].
			graph
				addEdgeBetween: (aBlock value: firstMethodReference)
				and: (aBlock value: secondMethodReference)]