fileIn/Out
exportAllGraphsFromCursor: aTDBCursor withScenarioName: scenarioName


	| graphs |
	
	graphs := HMTraceParser allGraphsFromCursor: aTDBCursor withScenarioName: scenarioName.
	graphs do: [:graph | graph exportToFile]
