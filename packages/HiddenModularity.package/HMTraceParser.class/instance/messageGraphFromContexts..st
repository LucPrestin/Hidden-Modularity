message graph construction
messageGraphFromContexts: contexts
	
	| graph communicators |
	
	communicators := self collectCommunicatorsFrom: contexts.

	graph := HMMessageGraph new.
	
	self addVerticesToGraph: graph fromCommunicators: communicators.
	self addEdgesToGraph: graph fromCommunicator: communicators.
	
	^ graph
