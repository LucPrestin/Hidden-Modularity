as yet unclassified
exportMethodCategoryGraphForSymbol: traceSymbol 

	| traceMethod |
	
	traceMethod := self class methodDict at: traceSymbol.
	self exportMethodCategoryGraphForMethod: traceMethod
