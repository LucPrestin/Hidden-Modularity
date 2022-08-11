fileIn/Out
exportAllGraphsForAllScenarios
	
	| scenarioMethods |
	
	scenarioMethods := self class methodDict values
				select: [:method | method hasPragma: #scenario].
	
	scenarioMethods do: [:scenarioMethod | self exportAllGraphsForScenarioMethod: scenarioMethod]
