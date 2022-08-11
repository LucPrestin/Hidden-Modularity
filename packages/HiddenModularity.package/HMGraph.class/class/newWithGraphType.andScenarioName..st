instance creation
newWithGraphType: graphTypeString andScenarioName: scenarioNameString

	^ (self new) 
		graphType: graphTypeString;
		scenarioName: scenarioNameString;
		yourself
