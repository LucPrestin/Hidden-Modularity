scenarios
doAllTraces
	
	| traceMethods |
	
	traceMethods := self class methodDict values
				select: [:method | method hasPragma: #scenario].
	
	traceMethods
		do: [:traceMethod | 
			| cursor |
			
			cursor := traceMethod valueWithReceiver: self arguments: {}.
			
			(HMTraceParser communicatorGraphFromCursor: cursor)
				writeToFileNamed: traceMethod methodReference methodSymbol asString , '_communicator_graph.json'.
			(HMTraceParser communicatorMethodCategoryGraphFromCursor: cursor)
				writeToFileNamed: traceMethod methodReference methodSymbol asString , '_communicator_method_category_graph.json'.
			(HMTraceParser methodCategoryGraphFromCursor: cursor)
				writeToFileNamed: traceMethod methodReference methodSymbol asString , '_method_category_graph.json']