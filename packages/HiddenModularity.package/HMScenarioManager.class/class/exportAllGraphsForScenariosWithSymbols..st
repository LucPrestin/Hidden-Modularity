fileIn/Out
exportAllGraphsForScenariosWithSymbols: aCollectionOfScenarioSymbols

	aCollectionOfScenarioSymbols do: [:scenarioSymbol | self exportAllGraphsForScenarioWithSymbol: scenarioSymbol]
