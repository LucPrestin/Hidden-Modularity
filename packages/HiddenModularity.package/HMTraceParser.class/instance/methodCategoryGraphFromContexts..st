method category graph
methodCategoryGraphFromContexts: contexts
	
	| graph cleanedContexts |

	graph := HMGraph new.
	
	cleanedContexts := self collectValidContextPairsFrom: contexts.
	
	self addVerticesFromContexts: cleanedContexts toMethodCategoryGraph: graph.
	self addEdgesFromContexts: cleanedContexts toMethodCategoryGraph: graph.
	
	^ graph
