graph construction
addEdgesFromCommunicators: communicators toGraph: graph 
	
	communicators
		do: [:contextPair | 
			| senderId receiverId |
			senderId := self idExtractionBlock value: contextPair first.
			receiverId := self idExtractionBlock value: contextPair second.
			((self blacklist includes: senderId)
					or: (self blacklist includes: receiverId))
				ifFalse: [graph
						addEdgeBetween: (self idExtractionBlock value: contextPair first)
						and: (self idExtractionBlock value: contextPair second)]]
