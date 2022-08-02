graph construction
communicatorBasedGraphFromCursor: aTDBCursor

	^ self communicatorBasedGraphFromCursor: aTDBCursor withScenarioName: self class defaultScenarioName
