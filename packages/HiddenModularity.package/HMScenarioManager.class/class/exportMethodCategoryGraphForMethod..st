tracing
exportMethodCategoryGraphForMethod: traceMethod 

	| cursor |

	cursor := traceMethod valueWithReceiver: self arguments: {}.

	(HMTraceParser methodCategoryGraphFromCursor: cursor)
		writeToFileNamed: traceMethod methodReference methodSymbol asString , '_method_category_graph.json'