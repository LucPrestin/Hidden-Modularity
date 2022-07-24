tracing
exportTraceForSymbol: traceSymbol 

	| traceMethod |
	
	traceMethod := self class methodDict at: traceSymbol.
	self exportTraceForMethod: traceMethod
