fileIn/Out
exportCommunicatorGraphForAllScenarios
	
	| scenarioMethods |
	
	scenarioMethods := self class methodDict values
				select: [:method | method hasPragma: #scenario].
	
	scenarioMethods do: [:scenarioMethod | self exportCommunicatorGraphForScenarioMethod: scenarioMethod]
