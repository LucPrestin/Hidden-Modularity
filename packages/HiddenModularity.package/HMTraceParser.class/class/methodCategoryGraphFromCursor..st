graph construction
methodCategoryGraphFromCursor: aTDBCursor

	| parser |
	
	parser := self 
		newWithIdExtractionBlock: self methodCategoryExtractionBlock 
		labelExtractionBlock: self methodCategoryExtractionBlock
		colorLabelExtractionBlock: self packageExtractionBlock.

	^ parser methodBasedGraphFromCursor: aTDBCursor