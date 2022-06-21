communicator graph
communicatorGraphFromContexts: contexts
	
	| graph communicators |
	
	communicators := self collectCommunicatorsFrom: contexts.

	graph := HMGraph new.
	
	self addVerticesFromCommunicators: communicators toCommunicatorGraph: graph.
	self addEdgesFromCommunicators: communicators toCommunicatorGraph: graph.
	
	^ graph
