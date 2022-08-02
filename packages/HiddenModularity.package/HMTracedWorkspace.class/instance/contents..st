as yet unclassified
contents: aTextOrString 

	| aTdbCursor scenarioName |

	scenarioName := self class scenarioName, '_', self traceCounter.

	aTdbCursor := TDBCursor
				traceForBlock: [super contents: aTextOrString].

	(HMTraceParser allGraphsFromCursor: aTdbCursor withScenarioName: scenarioName)
		do: [:graph | graph explore; export].

	self traceCounter: self traceCounter + 1
