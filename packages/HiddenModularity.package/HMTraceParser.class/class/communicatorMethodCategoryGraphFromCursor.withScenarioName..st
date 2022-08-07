graph construction
communicatorMethodCategoryGraphFromCursor: aTDBCursor withScenarioName: aString

	| parser |
	
	parser := self 
		newWithIdExtractionBlock: self communicatorClassAndMethodCategoryExtractionBlock 
		labelExtractionBlock: self communicatorClassAndMethodCategoryExtractionBlock
		colorLabelExtractionBlock: self methodPackageExtractionBlock
		andGraphType: HMGraph communicatorMethodCategoryGraphType.

	^ parser methodBasedGraphFromCursor: aTDBCursor withScenarioName: aString
