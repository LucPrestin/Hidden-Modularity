graph construction
allGraphsFromCursor: aTDBCursor withScenarioName: scenarioName

	| graphs |
	
	graphs := OrderedCollection new.
	
	graphs 
		add: (self communicatorGraphFromCursor: aTDBCursor withScenarioName: scenarioName);
		add: (self communicatorMethodCategoryGraphFromCursor: aTDBCursor withScenarioName: scenarioName);
		add: (self methodCategoryGraphFromCursor: aTDBCursor withScenarioName: scenarioName).

	^ graphs
