tracing
exportMethodCategoryGraphForSymbols: aCollectionOfTraceSymbol 

	aCollectionOfTraceSymbol do: [:traceSymbol | self exportMethodCategoryGraphForSymbol: traceSymbol]
