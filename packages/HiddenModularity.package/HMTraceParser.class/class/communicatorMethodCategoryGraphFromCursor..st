graph construction
communicatorMethodCategoryGraphFromCursor: aTDBCursor

	| parser |
	
	parser := self 
		newWithIdExtractionBlock: self communicatorClassAndMethodCategoryExtractionBlock 
		labelExtractionBlock: self communicatorClassAndMethodCategoryExtractionBlock
		colorLabelExtractionBlock: self methodPackageExtractionBlock
		andGraphType: HMUtils communicatorMethodCategoryGraphType.

	^ parser methodBasedGraphFromCursor: aTDBCursor