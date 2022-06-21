method category graph
messageCategoryGraphFromContexts: contexts
	
	| graph cleanedContexts |

	graph := HMGraph new.
	
	cleanedContexts := self collectValidContextPairsFrom: contexts.
	
	self addVerticesFromContexts: cleanedContexts toMessageCategoryGraph: graph.
	self addEdgesFromContexts: cleanedContexts toMessageCategoryGraph: graph.
	
	^ graph
