message graph construction
messageGraphFromContexts: contexts
	
	| graph communicators |
	
	communicators := self collectCommunicatorsFrom: contexts.

	graph := HMGraph new.
	
	self addVerticesFromCommunicators: communicators toMessageGraph: graph.
	self addEdgesFromCommunicators: communicators toMessageGraph: graph.
	
	^ graph
