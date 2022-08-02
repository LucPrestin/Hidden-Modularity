graph construction
allGraphsFromCursor: aTdbCursor withScenarioName: scenarioName

	| graphs |
	
	graphs := OrderedCollection new.
	
	graphs 
		add: (self communicatorGraphFromCursor: aTdbCursor withScenarioName: scenarioName);
		add: (self communicatorMethodCategoryGraphFromCursor: aTdbCursor withScenarioName: scenarioName);
		add: (self methodCategoryGraphFromCursor: aTdbCursor withScenarioName: scenarioName).

	^ graphs
