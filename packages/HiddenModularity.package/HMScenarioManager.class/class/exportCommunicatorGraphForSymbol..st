as yet unclassified
exportCommunicatorGraphForSymbol: traceSymbol 

	| traceMethod |
	
	traceMethod := self class methodDict at: traceSymbol.
	self exportCommunicatorGraphForMethod: traceMethod
