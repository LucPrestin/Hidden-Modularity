scenarios
doAllTraces

	| traceSymbols |

	traceSymbols := {#codeBrowserOpening. #fetchingGoogle. #morphOpening. #objectExplorerOpening. #zeroDivideHandling}.

	traceSymbols
		do: [:traceSymbol | 
			| cursor |
			
			cursor := self perform: traceSymbol.
			(HMTraceParser messageGraphFromCursor: cursor) writeToFileNamed: traceSymbol asString, '_message_graph.json'.
			(HMTraceParser messageCategoryGraphFromCursor: cursor) writeToFileNamed: traceSymbol asString, '_message_category_graph.json']