accessing
contents: aTextOrString 

	| aTdbCursor scenarioName |

	scenarioName := self class scenarioName, '_', self traceCounter.

	aTdbCursor := TDBCursor
				traceForBlock: [super contents: aTextOrString].

	(HMTraceParser allGraphsFromCursor: aTdbCursor withScenarioName: scenarioName)
		do: [:graph | graph explore; exportToFile].

	self traceCounter: self traceCounter + 1
