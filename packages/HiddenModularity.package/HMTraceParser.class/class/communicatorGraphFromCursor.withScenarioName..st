graph construction
communicatorGraphFromCursor: aTDBCursor withScenarioName: aString

	| parser |
	
	parser := self 
		newWithIdExtractionBlock: self classExtractionBlock 
		labelExtractionBlock: self classExtractionBlock
		colorLabelExtractionBlock: self packageExtractionBlock
		andGraphType: HMGraph communicatorGraphType.

	^ parser communicatorBasedGraphFromCursor: aTDBCursor withScenarioName: aString