graph construction
buildGraphFromCommunicators: communicators
	
	| graph |

	graph := HMGraph new.
	graph graphType: self graphType.
	
	self addVerticesFromCommunicators: communicators toGraph: graph.
	self addEdgesFromCommunicators: communicators toGraph: graph.
	
	^ graph
