fileIn/Out
exportCommunicatorGraphForScenariosWithSymbols: aCollectionOfScenarioSymbols 

	aCollectionOfScenarioSymbols do: [:scenarioSymbol | self exportCommunicatorGraphForScenarioWithSymbol: scenarioSymbol]
