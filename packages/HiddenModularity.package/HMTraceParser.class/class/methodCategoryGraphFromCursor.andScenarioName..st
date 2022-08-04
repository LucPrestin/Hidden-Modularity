graph construction
methodCategoryGraphFromCursor: aTDBCursor andScenarioName: aString

	| parser |
	
	parser := self 
		newWithIdExtractionBlock: self methodCategoryExtractionBlock 
		labelExtractionBlock: self methodCategoryExtractionBlock
		colorLabelExtractionBlock: self packageExtractionBlock
		andGraphType: HMGraph methodCategoryGraphType.

	^ parser methodBasedGraphFromCursor: aTDBCursor