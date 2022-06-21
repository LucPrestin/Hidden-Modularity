graph construction
addEdgesFromCommunicators: communicators toGraph: graph 
	
	communicators
		do: [:contextPair | graph
				addEdgeBetween: (self idExtractionBlock value: contextPair first)
				and: (self idExtractionBlock value: contextPair second)]
