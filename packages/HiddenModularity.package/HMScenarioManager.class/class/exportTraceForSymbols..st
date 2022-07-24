tracing
exportTraceForSymbols: aCollectionOfTraceSymbol 

	aCollectionOfTraceSymbol do: [:traceSymbol | self exportTraceForSymbol: traceSymbol]
