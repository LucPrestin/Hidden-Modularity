tracing
exportCommunicatorGraphForMethod: traceMethod 

	| cursor |

	cursor := traceMethod valueWithReceiver: self arguments: {}.

	(HMTraceParser communicatorGraphFromCursor: cursor)
		writeToFileNamed: traceMethod methodReference methodSymbol asString , '_communicator_graph.json'.
