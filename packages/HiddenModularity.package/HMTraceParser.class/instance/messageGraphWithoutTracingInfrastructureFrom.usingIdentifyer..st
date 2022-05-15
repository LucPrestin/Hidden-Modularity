as yet unclassified
messageGraphWithoutTracingInfrastructureFrom: aTDBCursor usingIdentifyer: aBlock

	| rootContext contexts communicators |
	
	rootContext := aTDBCursor context.
	
	"omit data on the creation of the tracing process"
	rootContext := (aTDBCursor childContextsFor: rootContext) first.
	
	"omit data on the tracing block itself to only look at the block's execution"
	rootContext := (aTDBCursor childContextsFor: rootContext) first.
	
	contexts := self collectContextsFrom: aTDBCursor startingAt: rootContext.
	contexts add: rootContext.
	
	communicators := self collectCommunicatorsFrom: contexts usingIdentifyer: aBlock.
	
	^ self constructGraphFromCommunicators: communicators
