fileIn/Out
exportMethodCategoryGraphForScenarioWithSymbol: scenarioSymbol 

	| scenarioMethod |
	
	scenarioMethod := self class methodDict at: scenarioSymbol.
	self exportMethodCategoryGraphForScenarioMethod: scenarioMethod
