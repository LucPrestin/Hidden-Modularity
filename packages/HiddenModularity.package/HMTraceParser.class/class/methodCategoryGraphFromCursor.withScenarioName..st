graph construction
methodCategoryGraphFromCursor: aTDBCursor withScenarioName: aString

	| parser |
	
	parser := self 
		newWithIdExtractionBlock: self methodCategoryExtractionBlock 
		labelExtractionBlock: self methodCategoryExtractionBlock
		colorLabelExtractionBlock: self packageExtractionBlock
		andGraphType: HMGraph methodCategoryGraphType.

	^ parser methodBasedGraphFromCursor: aTDBCursor withScenarioName: aString
