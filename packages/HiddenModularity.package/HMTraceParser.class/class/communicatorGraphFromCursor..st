graph construction
communicatorGraphFromCursor: aTDBCursor

	| parser |
	
	parser := self 
		newWithIdExtractionBlock: self classExtractionBlock 
		labelExtractionBlock: self classExtractionBlock
		colorLabelExtractionBlock: self packageExtractionBlock
		andGraphType: HMUtils communicatorGraphType.

	^ parser communicatorBasedGraphFromCursor: aTDBCursor