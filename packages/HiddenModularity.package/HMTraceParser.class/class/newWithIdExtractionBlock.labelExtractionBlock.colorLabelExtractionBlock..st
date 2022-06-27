instance creation
newWithIdExtractionBlock: idBlock labelExtractionBlock: labelBlock colorLabelExtractionBlock: colorLabelBlock

	| parser |
	
	parser := self new.
	
	parser
		idExtractionBlock: idBlock;
		labelExtractionBlock: labelBlock;
		colorLabelExtractionBlock: colorLabelBlock.
		
	^ parser
