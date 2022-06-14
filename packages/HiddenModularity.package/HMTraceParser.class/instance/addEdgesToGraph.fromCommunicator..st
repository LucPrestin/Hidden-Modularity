message graph construction
addEdgesToGraph: graph fromCommunicator: communicators 
	
	communicators
		do: [:contextPair | graph
				addEdgeBetween: (self idExtractionBlock value: contextPair first)
				and: (self idExtractionBlock value: contextPair second)]
