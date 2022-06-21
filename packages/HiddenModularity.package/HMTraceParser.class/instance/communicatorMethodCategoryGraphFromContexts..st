communicator method category graph
communicatorMethodCategoryGraphFromContexts: contexts
	
	| graph cleanedContexts |

	graph := HMGraph new.
	
	cleanedContexts := self collectValidContextPairsFrom: contexts.
	
	self addVerticesFromContexts: cleanedContexts toCommunicatorMethodCategoryGraph: graph.
	self addEdgesFromContexts: cleanedContexts toCommunicatorCategoryGraph: graph.
	
	^ graph
