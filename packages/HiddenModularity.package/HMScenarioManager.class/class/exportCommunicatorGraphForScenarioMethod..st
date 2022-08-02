fileIn/Out
exportCommunicatorGraphForScenarioMethod: scenarioMethod 

	| aTDBCursor scenarioName |

	aTDBCursor := scenarioMethod valueWithReceiver: self arguments: {}.
	scenarioName := scenarioMethod methodReference methodSymbol asString.
	self exportCommunicatorGraphFromCursor: aTDBCursor withScenarioName: scenarioName
