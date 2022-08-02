graph construction
methodBasedGraphFromCursor: aTDBCursor

	^ self methodBasedGraphFromCursor: aTDBCursor withScenarioName: self class defaultScenarioName
