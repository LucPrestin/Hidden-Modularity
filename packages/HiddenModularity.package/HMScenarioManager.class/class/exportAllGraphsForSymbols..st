fileIn/Out
exportAllGraphsForSymbols: aCollectionOfTraceSymbol 

	aCollectionOfTraceSymbol do: [:traceSymbol | self exportAllGraphsForSymbol: traceSymbol]
