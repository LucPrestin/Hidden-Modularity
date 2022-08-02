as yet unclassified
drawOn: aCanvas

	|aTdbCurser scenarioName |
	
	scenarioName := self class scenarioName, '_', self traceCounter.
	
	aTdbCurser := TDBCursor traceForBlock: [super drawOn: aCanvas].
	
	(HMTraceParser allGraphsFromCursor: aTdbCurser withScenarioName: scenarioName)
		do: [:graph | graph explore; export].
		
	self traceCounter: self traceCounter + 1
