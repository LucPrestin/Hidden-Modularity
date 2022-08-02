fileIn/Out
exportCommunicatorGraphForScenarioWithSymbol: scenarioSymbol 

	| scenarioMethod |
	
	scenarioMethod := self class methodDict at: scenarioSymbol.
	self exportCommunicatorGraphForScenarioMethod: scenarioMethod
