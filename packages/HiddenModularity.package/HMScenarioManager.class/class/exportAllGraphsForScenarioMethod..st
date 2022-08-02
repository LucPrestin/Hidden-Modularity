fileIn/Out
exportAllGraphsForScenarioMethod: scenarioMethod 

	| aTDBCursor scenarioName |

	aTDBCursor := scenarioMethod valueWithReceiver: self arguments: {}.
	scenarioName := scenarioMethod methodReference methodSymbol asString.
	self exportAllGraphsFromCursor: aTDBCursor withScenarioName: scenarioName
