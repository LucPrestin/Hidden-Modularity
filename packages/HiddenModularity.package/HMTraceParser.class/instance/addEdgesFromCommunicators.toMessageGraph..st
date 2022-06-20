message graph construction
addEdgesFromCommunicators: communicators toMessageGraph: graph 
	
	communicators
		do: [:contextPair | graph
				addEdgeBetween: (self idExtractionBlock value: contextPair first)
				and: (self idExtractionBlock value: contextPair second)]
