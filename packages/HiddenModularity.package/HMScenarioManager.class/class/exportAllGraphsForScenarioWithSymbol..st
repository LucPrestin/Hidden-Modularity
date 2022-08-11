fileIn/Out
exportAllGraphsForScenarioWithSymbol: scenarioSymbol 

	| scenarioMethod |
	
	scenarioMethod := self class methodDict at: scenarioSymbol.
	self exportAllGraphsForScenarioMethod: scenarioMethod