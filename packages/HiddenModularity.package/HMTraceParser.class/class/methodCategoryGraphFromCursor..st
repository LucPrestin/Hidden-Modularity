graph construction
methodCategoryGraphFromCursor: aTDBCursor

	| parser |
	
	parser := self 
		newWithIdExtractionBlock: self methodCategoryExtractionBlock 
		labelExtractionBlock: self methodCategoryExtractionBlock
		colorLabelExtractionBlock: self packageExtractionBlock
		andGraphType: HMUtils methodCategoryGraphType.

	^ parser methodBasedGraphFromCursor: aTDBCursor