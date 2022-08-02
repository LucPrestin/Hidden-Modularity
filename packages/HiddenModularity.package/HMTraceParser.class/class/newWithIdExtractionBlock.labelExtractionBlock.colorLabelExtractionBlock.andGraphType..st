as yet unclassified
newWithIdExtractionBlock: idBlock labelExtractionBlock: labelBlock colorLabelExtractionBlock: colorLabelBlock andGraphType: aString

	| parser |
	
	parser := self new.
	
	parser
		idExtractionBlock: idBlock;
		labelExtractionBlock: labelBlock;
		colorLabelExtractionBlock: colorLabelBlock;
		graphType: aString.
		
	^ parser
