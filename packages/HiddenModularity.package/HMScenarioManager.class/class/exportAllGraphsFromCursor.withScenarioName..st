fileIn/Out
exportAllGraphsFromCursor: aTDBCursor withScenarioName: scenarioName

	self
		exportCommunicatorGraphFromCursor: aTDBCursor withScenarioName: scenarioName;
		exportCommunicatorMethodCategoryGraphFromCursor: aTDBCursor withScenarioName: scenarioName;
		exportMethodCategoryGraphFromCursor: aTDBCursor withScenarioName: scenarioName
