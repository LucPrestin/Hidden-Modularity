instance creation
newWithIdExtractionBlock: idBlock labelExtractionBlock: labelBlock colorLabelExtractionBlock: colorLabelBlock andGraphType: graphTypeString
	| parser |
	
	parser := self new.
	
	parser
		idExtractionBlock: idBlock;
		labelExtractionBlock: labelBlock;
		colorLabelExtractionBlock: colorLabelBlock;
		graphType: graphTypeString.
		
	^ parser
