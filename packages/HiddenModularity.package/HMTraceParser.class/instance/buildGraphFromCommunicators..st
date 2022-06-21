graph construction
buildGraphFromCommunicators: communicators
	
	| graph |

	graph := HMGraph new.
	
	self addVerticesFromCommunicators: communicators toGraph: graph.
	self addEdgesFromCommunicators: communicators toGraph: graph.
	
	^ graph
