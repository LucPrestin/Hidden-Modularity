fileIn/Out
exportCommunicatorMethodCategoryGraphForScenarioWithSymbol: scenarioSymbol 

	| scenarioMethod |
	
	scenarioMethod := self class methodDict at: scenarioSymbol.
	self exportCommunicatorMethodCategoryGraphForScenarioMethod: scenarioMethod
