fileIn/Out
exportAllMethodCategoryGraphs
	
	| scenarioMethods |
	
	scenarioMethods := self class methodDict values
				select: [:method | method hasPragma: #scenario].
	
	scenarioMethods do: [:scenarioMethod | self exportMethodCategoryGraphForScenarioMethod: scenarioMethod]
