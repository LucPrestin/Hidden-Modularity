fileIn/Out
exportCommunicatorMethodCategoryGraphForScenarioMethod: scenarioMethod 

	| aTDBCursor scenarioName |

	aTDBCursor := scenarioMethod valueWithReceiver: self arguments: {}.
	scenarioName := scenarioMethod methodReference methodSymbol asString.
	self exportCommunicatorMethodCategoryGraphFromCursor: aTDBCursor withScenarioName: scenarioName
