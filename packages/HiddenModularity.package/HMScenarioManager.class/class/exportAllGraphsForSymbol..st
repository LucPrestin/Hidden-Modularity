as yet unclassified
exportAllGraphsForSymbol: traceSymbol 

	| traceMethod |
	
	traceMethod := self class methodDict at: traceSymbol.
	self exportAllGraphsForMethod: traceMethod
