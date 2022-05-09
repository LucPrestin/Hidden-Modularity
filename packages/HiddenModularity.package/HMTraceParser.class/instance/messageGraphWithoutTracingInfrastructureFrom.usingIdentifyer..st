as yet unclassified
messageGraphWithoutTracingInfrastructureFrom: aTDBCursor usingIdentifyer: aSymbol

	| context |
	
	context := aTDBCursor context.
	
	"omit data on the creation of the tracing process"
	context := (aTDBCursor childContextsFor: context) first.
	
	"omit data on the tracing block itself to only look at the block's execution"
	context := (aTDBCursor childContextsFor: context) first.

	^ self messageGraphFrom: aTDBCursor usingIdentifyer: aSymbol startingAt: context