fileIn/Out
exportMethodCategoryGraphForScenarioMethod: scenarioMethod 

	| aTDBCursor scenarioName |

	aTDBCursor := scenarioMethod valueWithReceiver: self arguments: {}.
	scenarioName := scenarioMethod methodReference methodSymbol asString.
	self exportMethodCategoryGraphFromCursor: aTDBCursor withScenarioName: scenarioName
